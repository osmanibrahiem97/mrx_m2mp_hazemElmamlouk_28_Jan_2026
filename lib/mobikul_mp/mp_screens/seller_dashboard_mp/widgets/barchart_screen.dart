import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'PricePoint.dart';


class BarChartWidget extends StatefulWidget {
  const BarChartWidget({Key? key, required this.points,required this.type}) : super(key: key);

  final List<List>? points;
  final String? type;

  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  final List<PricePoint>? points = [];

  List<List> pointsData = [];
  // bool isCheck = true;



  @override
  void initState() {
    // dataFindMetod();

    // pointsData = widget?.points ?? [[]];
    // print("pointsData--${pointsData}");
    // var index =  1;
    // for(int i = 1; i < pointsData.length ;i++){
    //     double val = double.parse(pointsData[i][1].toString());
    //     print("fghsfg----${val}");
    //     points?.add(PricePoint(x: index, y: val));
    //     index = index + 1;
    // }
    // for (var element in pointsData) {
    //   double val = double.parse(element[1].toString());
    //   points?.add(PricePoint(x: index, y: val));
    //   index = index + 1;
    // }
    super.initState();
  }

  dataFindMetod(){
    points?.clear();
    pointsData = widget?.points ?? [[]];
    print("pointsData--${pointsData}");
    var index =  1;
    for(int i = 1; i < pointsData.length ;i++){
      double val = double.parse(pointsData[i][1].toString());
      points?.add(PricePoint(x: index, y: val));
      index = index + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    dataFindMetod();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: BarChart(
            BarChartData(
              barGroups: _chartGroups(),
              borderData: FlBorderData(
                  border: const Border(bottom: BorderSide(), left: BorderSide())),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _chartGroups() {


    return points!.map((point) =>BarChartGroupData(
        x: point.x?.toInt() ?? 0,
        barRods: [
          BarChartRodData(
              toY: point.y?.toDouble() ?? 0.0
          )
        ]
    )).toList();
  }

  var indexData = 0;

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      indexData = indexData + 1;
      String text = "";
      // print("dhgdgdindex =--${indexData}");
      // print("---pointsData${pointsData}");
      if(indexData %2 == 0 && widget.type == "Yearly") {
        text = pointsData.isNotEmpty ? (pointsData[value.toInt()].first ?? "") : "";
        indexData = 0;
      } else if(indexData % 2 == 0 && widget.type == "Monthly"){
        text = pointsData.isNotEmpty ? (pointsData[value.toInt()].first ?? "") : "";
        indexData = 0;
      } else if(indexData % 3 == 0 && widget.type == "Daily"){
        text = pointsData.isNotEmpty ? (pointsData[value.toInt()].first ?? "") : "";
        indexData = 0;
      } else if(indexData % 2 == 0 && widget.type == "Weekly"){
        text = pointsData.isNotEmpty ? (pointsData[value.toInt()].first ?? "") : "";
        indexData = 0;
      }



      // var data = value.truncate();
      // print("=====data${data}");
      // // text = (pointsData[data.toInt()].first ?? "");
      // if (data >= 0 && data < pointsData.length) {
      //   text = pointsData[data].first ?? "";
      // } else {
      //   print("Index out of bounds: $data");
      // }
      // }

      return Text(text);
    },
  );

}





