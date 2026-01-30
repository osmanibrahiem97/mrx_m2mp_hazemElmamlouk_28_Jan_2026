/*
 *
 *  Webkul Software.
 * @package Mobikul Application Code.
 *  @Category Mobikul
 *  @author Webkul <support@webkul.com>
 *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
 *  @license https://store.webkul.com/license.html
 *  @link https://store.webkul.com/license.html
 *
 * /
 */

import 'dart:convert';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/configuration/mobikul_theme.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_view_mp_item_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/bloc/seller_dashboard_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/bloc/seller_dashboard_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/bloc/seller_dashboard_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/barchart_screen.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/collapse_app_bar_mp.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/header_info.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/latest_orders.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/pie_chart_screen.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/pricePoint.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/recent_reviews.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_dashboard_mp/widgets/top_products.dart';

import '../../../mobikul/constants/app_string_constant.dart';

class SellerDashboardMpScreen extends StatefulWidget {
  const SellerDashboardMpScreen({Key? key}) : super(key: key);

  @override
  State<SellerDashboardMpScreen> createState() =>
      _SellerDashboardMpScreenState();
}

class _SellerDashboardMpScreenState extends State<SellerDashboardMpScreen>
    with SingleTickerProviderStateMixin {
  SellerDashboardMpBloc? sellerDashboardMpBloc;
  bool isLoading = false;
  SellerDashboardMpModel? sellerDashboardMpModel;
  TabController? _tabController;

  /// Initial Selected Value
  String dropDownValue = 'Daily';
  bool onTapSelling = true;

  /// List of items in our dropdown menu
  var items = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  /// Variable for chart
  List<dynamic>? categorySelling = [];
  Map<String, double> salesData = {};

  List<List>? daildSalesStats = [];
  List<BarChartGroupData> daildSalesStatsData = [];
  List<PricePoint> dailsPricePoint = [];
  List<PricePoint> weeklyPricePoint = [];
  List<PricePoint> monthlyPricePoint = [];
  List<PricePoint> yearlyPricePoint = [];

  var maxDailySale;
  List<List>? weeklySalesStats = [];
  // List<HorizontalDetailsModel> weeklySalesStatsData = [];
  var maxweeklySalesStats;
  List<List>? yearlySalesStats = [];
  // List<HorizontalDetailsModel> yearlySalesStatsData = [];
  var maxyearlySalesStats;
  List<List>? monthlySalesStats = [];
  // List<HorizontalDetailsModel> monthlySalesStatsData = [];
  var maxmonthlySalesStats;
  List<dynamic>? dailySalesLocationReport = [];
  List<dynamic>? monthlySalesLocationReportData = [];
  List<dynamic>? weeklySalesLocationReport = [];
  List<dynamic>? yearlySalesLocationReport = [];

  List<dynamic>? yearData = [];
  List<dynamic>? yearCountryData = [];
  List<dynamic>? monthData = [];
  List<dynamic>? monthCountryData = [];
  List<dynamic>? weekData = [];
  List<dynamic>? weekCountryData = [];
  List<dynamic>? dayData = [];
  List<dynamic>? dayCountryData = [];



  @override
  void initState() {
    sellerDashboardMpBloc = context.read<SellerDashboardMpBloc>();
    sellerDashboardMpBloc?.add(SellerDashboardMpFetchEvent());
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerDashboardMpBloc, SellerDashboardMpState>(
        builder: (context, currentState) {
      if (currentState is SellerDashboardMpInitial) {
        isLoading = true;
      } else if (currentState is SellerDashboardMpSuccess) {
        // isLoading = false;
        // print("TEST_LOG===> ${currentState.sellerDashboardMpModel.success}");
        // sellerDashboardMpModel = currentState.sellerDashboardMpModel;
        //
        // // categorySelling = (sellerDashboardMpModel?.categoryChart != null) ? json.decode(sellerDashboardMpModel?.categoryChart ?? "").cast<dynamic>().toList() : [];
        // // if((categorySelling ?? []).length > 0) {
        // //   salesData = {
        // //     for (var item in (categorySelling ?? []).skip(1)) item[0]: item[1]
        // //         .toDouble()
        // //   };
        // }
        isLoading = false;
        sellerDashboardMpModel = currentState.sellerDashboardMpModel;


        categorySelling = (sellerDashboardMpModel?.categoryChart != null) ? json.decode(sellerDashboardMpModel?.categoryChart ?? "").cast<dynamic>().toList() : [];
        if((categorySelling ?? []).length > 0) {
          salesData = {
            for (var item in (categorySelling ?? []).skip(1))
              if (item.length > 1)
                item[0].toString(): (item[1] is num ? item[1].toDouble() : 0.0)
          };
          print("categorySelling: $categorySelling");
        }
        ///    Set Chart Data View ///
        if(sellerDashboardMpModel?.dailySalesStats != null && sellerDashboardMpModel?.dailySalesStats!= ""){
          daildSalesStats = (sellerDashboardMpModel?.dailySalesStats != null) ? json.decode(sellerDashboardMpModel?.dailySalesStats ?? "").cast<List>().toList() : [];
        }
        if(sellerDashboardMpModel?.weeklySalesStats != null && sellerDashboardMpModel?.weeklySalesStats!= ""){
          weeklySalesStats = (sellerDashboardMpModel?.weeklySalesStats != null) ? json.decode(sellerDashboardMpModel?.weeklySalesStats ?? "").cast<List>().toList() : [];
        }
        if(sellerDashboardMpModel?.yearlySalesStats != null && sellerDashboardMpModel?.yearlySalesStats!= ""){
          yearlySalesStats = (sellerDashboardMpModel?.yearlySalesStats != null) ? json.decode(sellerDashboardMpModel?.yearlySalesStats ?? "").cast<List>().toList() : [];
        }
        if(sellerDashboardMpModel?.monthlySalesStats != null && sellerDashboardMpModel?.monthlySalesStats!= ""){
          monthlySalesStats = (sellerDashboardMpModel?.monthlySalesStats != null) ? json.decode(sellerDashboardMpModel?.monthlySalesStats ?? "").cast<List>().toList() : [];
        }
        // daildSalesStats = json.decode(sellerDashboardMpModel?.dailySalesStats ?? "").cast<List>().toList();
        // weeklySalesStats = json.decode(sellerDashboardMpModel?.weeklySalesStats ?? "").cast<List>().toList();
        // yearlySalesStats = json.decode(sellerDashboardMpModel?.yearlySalesStats ?? "").cast<List>().toList();
        // monthlySalesStats = json.decode(sellerDashboardMpModel?.monthlySalesStats ?? "").cast<List>().toList();
        print("dhdhyearlySalesStats${weeklySalesStats}");



        if((daildSalesStats ?? []).length > 0) {
          for (int i = 1; i < (daildSalesStats ?? []).length; i++) {
            dailsPricePoint.add(PricePoint(x: daildSalesStats?[i][1].toInt(), y: daildSalesStats?[i][1].toDouble()));
          }

          for(int i= 0;i<dailsPricePoint.length;i++){
            print("----datata ${dailsPricePoint[i].x}");
            print("----ydatata ${dailsPricePoint[i].y}");

          }

        }



        if((weeklySalesStats ?? []).length > 0) {
          var index =  0;

          for (int i = 1; i < (weeklySalesStats ?? []).length; i++) {
            weeklyPricePoint.add(PricePoint(x: i, y: weeklySalesStats?[i][1].toDouble()));
            index = index + 1;
          }
          for(int i= 0;i<weeklyPricePoint.length;i++){
            print("weeklyPricePoint----datata ${weeklyPricePoint[i].x}");
            print("weeklyPricePoint----ydatata ${weeklyPricePoint[i].y}");

          }
          // for (int i = 1; i < ((weeklySalesStats ?? []).length ?? 0); i++) {
          //   weeklySalesStatsData.add(HorizontalDetailsModel(
          //       name: weeklySalesStats?[i][0],
          //       color: Colors.black,
          //       size: double.parse(weeklySalesStats?[i][1].toString() ?? "0")));
          // }
        }

        if((yearlySalesStats ?? []).length > 0) {
          var index =  0;
          for (int i = 1; i < (yearlySalesStats ?? []).length; i++) {
            yearlyPricePoint.add(PricePoint(x: i, y: yearlySalesStats?[i][1].toDouble()));
            index = index + 1;

          }
          for(int i= 0;i<yearlyPricePoint.length;i++){
            print("yearlySalesStats----datata ${yearlyPricePoint[i].x}");
            print("yearlySalesStats----ydatata ${yearlyPricePoint[i].y}");

          }
          // for (int i = 1; i < ((yearlySalesStats ?? []).length ?? 0); i++) {
          //   yearlySalesStatsData.add(HorizontalDetailsModel(
          //       name: yearlySalesStats?[i][0],
          //       color: Colors.black,
          //       size: double.parse(yearlySalesStats?[i][1].toString() ?? "0")));
          // }
        }
        if((monthlySalesStats ?? []).length > 0) {
          for (int i = 1; i < (monthlySalesStats ?? []).length; i++) {
            monthlyPricePoint.add(PricePoint(x: monthlySalesStats?[i][1].toInt(), y: monthlySalesStats?[i][1].toDouble()));
          }

          for(int i= 0;i<monthlyPricePoint.length;i++){
            print("monthlyPricePoint----datata ${monthlyPricePoint[i].x}");
            print("monthlyPricePoint----ydatata ${monthlyPricePoint[i].y}");

          }
          // for (int i = 1; i < ((monthlySalesStats ?? []).length ?? 0); i++) {
          //   monthlySalesStatsData.add(HorizontalDetailsModel(
          //       name: monthlySalesStats?[i][0],
          //       color: Colors.black,
          //       size: double.parse(
          //           monthlySalesStats?[i][1].toString() ?? "0")));
          // }
        }

        ///    Set Chart Data View ///

        ///    Set Map Chart Data View ///

        dailySalesLocationReport = (sellerDashboardMpModel?.dailySalesLocationReport != null) ? json.decode(sellerDashboardMpModel?.dailySalesLocationReport ?? "").cast<dynamic>().toList() : [];
        monthlySalesLocationReportData = (sellerDashboardMpModel?.monthlySalesLocationReport != null) ? json.decode(sellerDashboardMpModel?.monthlySalesLocationReport ?? "").cast<dynamic>().toList() : [];
        weeklySalesLocationReport = (sellerDashboardMpModel?.weeklySalesLocationReport != null) ? json.decode(sellerDashboardMpModel?.weeklySalesLocationReport ?? "").cast<dynamic>().toList() : [];
        yearlySalesLocationReport = (sellerDashboardMpModel?.yearlySalesLocationReport != null) ? json.decode(sellerDashboardMpModel?.yearlySalesLocationReport ?? "").cast<dynamic>().toList() : [];

        print("dadfahd---${yearlySalesLocationReport}");
        if((yearlySalesLocationReport ?? []).length > 0) {
          for (int i = 1; i < ((yearlySalesLocationReport ?? []).length ?? 0); i++) {
            yearData?.add(yearlySalesLocationReport?[i][1]);
            yearCountryData?.add(yearlySalesLocationReport?[i][0]);
          }
        }



        if((weeklySalesLocationReport ?? []).length > 0) {
          for (int i = 1; i < ((weeklySalesLocationReport ?? []).length ?? 0); i++) {
            weekData?.add(weeklySalesLocationReport?[i][1]);
            weekCountryData?.add(weeklySalesLocationReport?[i][0]);
            // print("fdhafhfdd---${yearData?[i][1]}");
          }
          print("hasdf---${yearData}");
        }

        if((monthlySalesLocationReportData ?? []).length > 0) {
          for (int i = 1; i < ((monthlySalesLocationReportData ?? []).length ?? 0); i++) {
            monthData?.add(monthlySalesLocationReportData?[i][1]);
            monthCountryData?.add(monthlySalesLocationReportData?[i][0]);
            // print("fdhafhfdd---${yearData?[i][1]}");
          }
          print("hasdf---${yearData}");
        }

        if((dailySalesLocationReport ?? []).length > 0) {
          for (int i = 1; i < ((dailySalesLocationReport ?? []).length ?? 0); i++) {
            dayData?.add(dailySalesLocationReport?[i][1]);
            dayCountryData?.add(dailySalesLocationReport?[i][0]);
            // print("fdhafhfdd---${yearData?[i][1]}");
          }
          print("hasdf---${yearData}");
        }




        print("asdvhadfhafdh====${salesData}");

        debugPrint("---dailySalesLocationReport ---${dailySalesLocationReport}");
        debugPrint("---monthlySalesLocationReportData ---${monthlySalesLocationReportData}");
        debugPrint("---weeklySalesLocationReport ---${weeklySalesLocationReport}");
        debugPrint("---yearlySalesLocationReport ---${yearlySalesLocationReport}");

        sellerDashboardMpBloc?.emit(SellerDashboardMpCompleteState());

        print("daildSalesStats---${daildSalesStats.toString()}");
        print("daildSalesStatsData---${daildSalesStatsData.toString()}");



      } else if (currentState is SellerDashboardMpError) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      } else if (currentState is SellerDashboardMpCompleteState){

      }

      return DefaultTabController(
          length: 3,
          child: Scaffold(
              appBar: commonAppBar(
                  Utils.getStringValue(
                      context, MpStringConstants.sellerDashboard),
                  context,
                  actions: [
                    onTapSelling == false
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: DropdownButton(
                              value: dropDownValue,
                              icon: Icon(
                                Icons.calendar_month,
                                color: Theme.of(context).iconTheme.color,
                              ),

                              /// Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: MobikulTheme.diffColor),
                                  ),
                                );
                              }).toList(),

                              /// After selecting the desired option,it will
                              /// change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                                print(sellerDashboardMpModel?.dailySalesStats);
                                print(sellerDashboardMpModel?.weeklySalesStats);
                                print(
                                    sellerDashboardMpModel?.monthlySalesStats);
                              },
                            ),
                          ),
                  ],
                  isElevated: false),
              body: _buildUI()));
    });
  }

  Widget _buildUI() {
    return Stack(
      children: [
        collapseAppBarMp(
          context,
          BodyContainer(sellerDashboardMpModel),

          // Stack(children: [
          //   TabBarView(
          //       physics: const NeverScrollableScrollPhysics(),
          //       controller: _tabController,
          //       children: [
          //         Center(
          //           child: SizedBox(
          //             height: AppSizes.deviceHeight * .4,
          //             width: AppSizes.deviceWidth / 1,
          //             child: ImageView(
          //               fit: BoxFit.fill,
          //               url: dropDownValue == "Daily"
          //                   ? sellerDashboardMpModel?.dailySalesLocationReport
          //                   : dropDownValue == "Weekly"
          //                       ? sellerDashboardMpModel
          //                           ?.weeklySalesLocationReport
          //                       : dropDownValue == "Monthly"
          //                           ? sellerDashboardMpModel
          //                               ?.monthlySalesLocationReport
          //                           : dropDownValue == "Yearly"
          //                               ? sellerDashboardMpModel
          //                                   ?.yearlySalesLocationReport
          //                               : sellerDashboardMpModel
          //                                   ?.dailySalesLocationReport,
          //               borderRadius: BorderRadius.circular(0),
          //             ),
          //           ),
          //         ),
          //         Center(
          //           child: SizedBox(
          //             height: AppSizes.deviceHeight * .4,
          //             width: AppSizes.deviceWidth / 1,
          //             child: ImageView(
          //               fit: BoxFit.fill,
          //               url: dropDownValue == "Daily"
          //                   ? sellerDashboardMpModel?.dailySalesStats
          //                   : dropDownValue == "Weekly"
          //                       ? sellerDashboardMpModel?.weeklySalesStats
          //                       : dropDownValue == "Monthly"
          //                           ? sellerDashboardMpModel?.monthlySalesStats
          //                           : dropDownValue == "Yearly"
          //                               ? sellerDashboardMpModel
          //                                   ?.yearlySalesStats
          //                               : sellerDashboardMpModel
          //                                   ?.dailySalesStats,
          //               borderRadius: BorderRadius.circular(0),
          //             ),
          //           ),
          //         ),
          //         Center(
          //           child: SizedBox(
          //             height: AppSizes.deviceHeight * .4,
          //             width: AppSizes.deviceWidth / 1,
          //             child: ImageView(
          //               fit: BoxFit.fill,
          //               url: sellerDashboardMpModel?.categoryChart,
          //               borderRadius: BorderRadius.circular(0),
          //             ),
          //           ),
          //         ),
          //       ]),
          //   Visibility(visible: isLoading, child: const Loader())
          // ]),
          Stack(children: [
            TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Stack(
                    children: [
                      dropDownValue == "Daily"
                          ? WorldMapChartView(dropDownValue,dailySalesLocationReport ?? [])
                          : dropDownValue == "Weekly"
                          ? WorldMapChartView(dropDownValue,weeklySalesLocationReport ?? [])
                          : dropDownValue == "Monthly"
                          ? WorldMapChartView(dropDownValue,monthlySalesLocationReportData ?? [])
                          : dropDownValue == "Yearly"
                          ? WorldMapChartView(dropDownValue,yearlySalesLocationReport ?? [])
                          : WorldMapChartView(dropDownValue,dailySalesLocationReport ?? []),

                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: AppSizes.dashBoardHeight),
                          child: Container(
                            child: ListView.builder(
                                itemCount: dropDownValue == "Daily"
                                    ? dayData?.length
                                    : dropDownValue == "Weekly"
                                    ? weekData?.length
                                    : dropDownValue == "Monthly"
                                    ? monthData?.length
                                    : dropDownValue == "Yearly"
                                    ? yearData?.length
                                    : dayData?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return dropDownValue == "Daily"
                                      ? Row(
                                    children: [
                                      Text((dayData?[index] ?? "")
                                          .toString()),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Container(
                                        height: 10,
                                        width: (dayData?[index].toInt() > AppSizes.deviceWidth/1.4) ? AppSizes.deviceWidth/1.4 :(dayData?[index].toInt() < 1) ?1 : dayData?[index].toDouble(),

                                        // width: (dayData?[index].toInt() > AppSizes.deviceWidth/1.4) ? AppSizes.deviceWidth/1.4 : dayData?[index].toDouble(),

                                        // width: (dayData?[index] / 4 < AppSizes.deviceWidth) ? AppSizes.deviceWidth/1.6 : dayData?[index] / 7,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Container(
                                        width: 40,
                                        child: Text((dayData?[index] ?? "")
                                            .toString()),
                                      ),
                                    ],
                                  )
                                      : dropDownValue == "Weekly"
                                      ? Row(
                                    children: [
                                      Text((weekCountryData?[index] ?? "")
                                          .toString()),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Container(
                                        height: 10,
                                        width: (weekData?[index].toInt() > AppSizes.deviceWidth/1.4) ? AppSizes.deviceWidth/1.4 : (weekData?[index].toInt() < 1) ?1 :weekData?[index].toDouble(),

                                        // width: (weekData?[index] / 4 < AppSizes.deviceWidth) ? AppSizes.deviceWidth/1.6 : weekData?[index] / 7,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Container(
                                        width: 40,
                                        child: Text((weekData?[index] ?? "")
                                            .toString()),
                                      ),
                                    ],
                                  )
                                      : dropDownValue == "Monthly"
                                      ? Row(
                                    children: [
                                      Text((monthCountryData?[index] ??
                                          "")
                                          .toString()),
                                      const SizedBox(
                                        width: AppSizes
                                            .paddingNormal,
                                      ),
                                      Container(
                                        height: 10,
                                        width: (monthData?[index].toInt() > AppSizes.deviceWidth/1.4) ? AppSizes.deviceWidth/1.4 : (monthData?[index].toInt() < 1) ?1 :monthData?[index].toDouble(),

                                        // width: (monthData?[index] / 4 < AppSizes.deviceWidth) ? AppSizes.deviceWidth/1.6 : monthData?[index] / 7,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Container(
                                        width: 40,
                                        child: Text((monthData?[index] ??
                                            "")
                                            .toString()),
                                      ),
                                    ],
                                  )
                                      : dropDownValue == "Yearly"
                                      ? Row(
                                    children: [
                                      Text(
                                          (yearCountryData?[index] ??
                                              "")
                                              .toString()),
                                      const SizedBox(
                                        width: AppSizes
                                            .paddingNormal,
                                      ),
                                      Container(
                                        height: 10,
                                        width: (yearData?[index].toInt() > AppSizes.deviceWidth/1.4) ? AppSizes.deviceWidth/1.4 : (yearData?[index].toInt() < 1) ?1 :yearData?[index].toDouble(),
                                        // (yearData?[index] > AppSizes.deviceWidth/1),
                                        // width: (yearData?[index] / 4 < AppSizes.deviceWidth) ? AppSizes.deviceWidth/1.6 : yearData?[index] / 7,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Container(
                                        width: 40,
                                        child: Text(
                                            (yearData?[index] ??
                                                "")
                                                .toString()),
                                      ),
                                    ],
                                  )
                                      : Row(
                                    children: [
                                      Text((dayCountryData?[index] ??
                                          "")
                                          .toString()),
                                      const SizedBox(
                                        width: AppSizes
                                            .paddingNormal,
                                      ),
                                      Container(
                                        height: 10,
                                        width: (dayData?[index].toInt() > AppSizes.deviceWidth/1.4) ? AppSizes.deviceWidth/1.4 : (dayData?[index].toInt() < 1) ?1 :dayData?[index].toDouble(),
                                        color: Colors.green,
                                      ),
                                      const SizedBox(
                                        width: AppSizes.paddingNormal,
                                      ),
                                      Text((dayData?[index] ??
                                          "")
                                          .toString()),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      )
                    ],
                  ),
                  dropDownValue == "Daily"
                      ? BarChartWidget(points: daildSalesStats,type: "Daily",)
                      : dropDownValue == "Weekly"
                      ? BarChartWidget(points: weeklySalesStats,type: "Weekly")
                      : dropDownValue == "Monthly"
                      ? BarChartWidget(points: monthlySalesStats,type: "Monthly")
                      : dropDownValue == "Yearly"
                      ? BarChartWidget(points: yearlySalesStats,type: "Yearly")
                      : BarChartWidget(points: daildSalesStats,type: "Daily") ,

                  Center(
                    child: salesData.isNotEmpty ? PieChartScreen(context,salesData! ?? {})
                        : Center(child: Text(Utils.getStringValue(context, AppStringConstant.nodataAvailable),style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: AppSizes.size16,),),),
                  )
                ]),
            Visibility(visible: isLoading, child: const Loader())
          ]),

          AppSizes.deviceHeight * .4,
          tabBar: TabBar(
            padding: EdgeInsets.zero,
            isScrollable: true,
            indicatorColor: Theme.of(context).iconTheme.color,
            indicatorPadding: EdgeInsets.zero,
            controller: _tabController,
            onTap: (value) {
              if (value == 2) {
                setState(() {
                  onTapSelling = false;
                });
                if (kDebugMode) {
                  print('onTapSelling is $onTapSelling');
                }
              } else {
                setState(() {
                  onTapSelling = true;
                });
                if (kDebugMode) {
                  print('onTapSelling is $onTapSelling');
                }
              }
            },
            labelPadding: EdgeInsets.zero,
            tabAlignment: TabAlignment.start,
            tabs: [
              _getTab(
                  Utils.getStringValue(context, MpStringConstants.salesMap) ??
                      ''),
              _getTab(
                  Utils.getStringValue(context, MpStringConstants.salesGraph) ??
                      ''),
              _getTab(Utils.getStringValue(
                      context, MpStringConstants.topSellingCategory) ??
                  ''),
            ],
          ),
        ),
        Visibility(visible: isLoading == true, child: const Loader())
      ],
    );
  }

  Widget getTabScreens(Widget child) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: child,
    );
  }

  Tab _getTab(title) {
    return Tab(
      child: Center(
        child: Container(
          width: AppSizes.deviceWidth / 3,
          height: AppSizes.deviceHeight / 20,
          // padding:
          //     const EdgeInsets.symmetric(horizontal: AppSizes.paddingGeneric),
          color: Theme.of(context).cardColor,
          child: Center(
              child: Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
        ),
      ),
    );
  }

  Widget WorldMapChartView(String? dropDownValue , List<dynamic> mapData){
    List<dynamic>? CountryMapData = [];
    CountryMapData = extractCountryCodes(mapData);
    print("data ---${extractCountryCodes(mapData)}");
    return  SimpleMap(
      instructions: SMapWorld.instructions,
      defaultColor: Colors.grey,
      colors: SMapWorldColors(
        aD:iSContainValue(CountryMapData,"AD") ? Colors.green : Colors.grey,
        aE:iSContainValue(CountryMapData,"AE") ? Colors.green : Colors.grey,
        aF:iSContainValue(CountryMapData,"AF") ? Colors.green : Colors.grey,
        aG:iSContainValue(CountryMapData,"AG") ? Colors.green : Colors.grey,
        aI:iSContainValue(CountryMapData,"AI") ? Colors.green : Colors.grey,
        aL:iSContainValue(CountryMapData,"AL") ? Colors.green : Colors.grey,
        aM:iSContainValue(CountryMapData,"AM") ? Colors.green : Colors.grey,
        aN:iSContainValue(CountryMapData,"AN") ? Colors.green : Colors.grey,
        aO:iSContainValue(CountryMapData,"AO") ? Colors.green : Colors.grey,
        aQ:iSContainValue(CountryMapData,"AQ") ? Colors.green : Colors.grey,
        aR:iSContainValue(CountryMapData,"AR") ? Colors.green : Colors.grey,
        aS:iSContainValue(CountryMapData,"AS") ? Colors.green : Colors.grey,
        aT:iSContainValue(CountryMapData,"AT") ? Colors.green : Colors.grey,
        aU:iSContainValue(CountryMapData,"AU") ? Colors.green : Colors.grey,
        aW:iSContainValue(CountryMapData,"AW") ? Colors.green : Colors.grey,
        aX:iSContainValue(CountryMapData,"AX") ? Colors.green : Colors.grey,
        aZ:iSContainValue(CountryMapData,"AZ") ? Colors.green : Colors.grey,
        bA:iSContainValue(CountryMapData,"BA") ? Colors.green : Colors.grey,
        bB:iSContainValue(CountryMapData,"BB") ? Colors.green : Colors.grey,
        bD:iSContainValue(CountryMapData,"BD") ? Colors.green : Colors.grey,
        bE:iSContainValue(CountryMapData,"BE") ? Colors.green : Colors.grey,
        bF:iSContainValue(CountryMapData,"BF") ? Colors.green : Colors.grey,
        bG:iSContainValue(CountryMapData,"BG") ? Colors.green : Colors.grey,
        bH:iSContainValue(CountryMapData,"BH") ? Colors.green : Colors.grey,
        bI:iSContainValue(CountryMapData,"BI") ? Colors.green : Colors.grey,
        bJ:iSContainValue(CountryMapData,"BJ") ? Colors.green : Colors.grey,
        bL:iSContainValue(CountryMapData,"BL") ? Colors.green : Colors.grey,
        bM:iSContainValue(CountryMapData,"BM") ? Colors.green : Colors.grey,
        bN:iSContainValue(CountryMapData,"BN") ? Colors.green : Colors.grey,
        bO:iSContainValue(CountryMapData,"BO") ? Colors.green : Colors.grey,
        bQ:iSContainValue(CountryMapData,"BQ") ? Colors.green : Colors.grey,
        bR:iSContainValue(CountryMapData,"BR") ? Colors.green : Colors.grey,
        bS:iSContainValue(CountryMapData,"BS") ? Colors.green : Colors.grey,
        bT:iSContainValue(CountryMapData,"BT") ? Colors.green : Colors.grey,
        bV:iSContainValue(CountryMapData,"BV") ? Colors.green : Colors.grey,
        bW:iSContainValue(CountryMapData,"BW") ? Colors.green : Colors.grey,
        bY:iSContainValue(CountryMapData,"BY") ? Colors.green : Colors.grey,
        bZ:iSContainValue(CountryMapData,"BZ") ? Colors.green : Colors.grey,
        cA:iSContainValue(CountryMapData,"CA") ? Colors.green : Colors.grey,
        cC:iSContainValue(CountryMapData,"CC") ? Colors.green : Colors.grey,
        cD:iSContainValue(CountryMapData,"CD") ? Colors.green : Colors.grey,
        cF:iSContainValue(CountryMapData,"CF") ? Colors.green : Colors.grey,
        cG:iSContainValue(CountryMapData,"CG") ? Colors.green : Colors.grey,
        cH:iSContainValue(CountryMapData,"CH") ? Colors.green : Colors.grey,
        cI:iSContainValue(CountryMapData,"CI") ? Colors.green : Colors.grey,
        cK:iSContainValue(CountryMapData,"CK") ? Colors.green : Colors.grey,
        cL:iSContainValue(CountryMapData,"CL") ? Colors.green : Colors.grey,
        cM:iSContainValue(CountryMapData,"CM") ? Colors.green : Colors.grey,
        cN:iSContainValue(CountryMapData,"CN") ? Colors.green : Colors.grey,
        cO:iSContainValue(CountryMapData,"CO") ? Colors.green : Colors.grey,
        cR:iSContainValue(CountryMapData,"CR") ? Colors.green : Colors.grey,
        cU:iSContainValue(CountryMapData,"CU") ? Colors.green : Colors.grey,
        cV:iSContainValue(CountryMapData,"CV") ? Colors.green : Colors.grey,
        cW:iSContainValue(CountryMapData,"CW") ? Colors.green : Colors.grey,
        cX:iSContainValue(CountryMapData,"CX") ? Colors.green : Colors.grey,
        cY:iSContainValue(CountryMapData,"CY") ? Colors.green : Colors.grey,
        cZ:iSContainValue(CountryMapData,"CZ") ? Colors.green : Colors.grey,
        dE:iSContainValue(CountryMapData,"DE") ? Colors.green : Colors.grey,
        dJ:iSContainValue(CountryMapData,"DJ") ? Colors.green : Colors.grey,
        dK:iSContainValue(CountryMapData,"DK") ? Colors.green : Colors.grey,
        dM:iSContainValue(CountryMapData,"DM") ? Colors.green : Colors.grey,
        dO:iSContainValue(CountryMapData,"DO") ? Colors.green : Colors.grey,
        dZ:iSContainValue(CountryMapData,"DZ") ? Colors.green : Colors.grey,
        eC:iSContainValue(CountryMapData,"EC") ? Colors.green : Colors.grey,
        eE:iSContainValue(CountryMapData,"EE") ? Colors.green : Colors.grey,
        eG:iSContainValue(CountryMapData,"EG") ? Colors.green : Colors.grey,
        eH:iSContainValue(CountryMapData,"EH") ? Colors.green : Colors.grey,
        eR:iSContainValue(CountryMapData,"ER") ? Colors.green : Colors.grey,
        eS:iSContainValue(CountryMapData,"ES") ? Colors.green : Colors.grey,
        eT:iSContainValue(CountryMapData,"ET") ? Colors.green : Colors.grey,
        fI:iSContainValue(CountryMapData,"FT") ? Colors.green : Colors.grey,
        fJ:iSContainValue(CountryMapData,"FJ") ? Colors.green : Colors.grey,
        fK:iSContainValue(CountryMapData,"FK") ? Colors.green : Colors.grey,
        fM:iSContainValue(CountryMapData,"FM") ? Colors.green : Colors.grey,
        fO:iSContainValue(CountryMapData,"FO") ? Colors.green : Colors.grey,
        fR:iSContainValue(CountryMapData,"FR") ? Colors.green : Colors.grey,
        gA:iSContainValue(CountryMapData,"GA") ? Colors.green : Colors.grey,
        gB:iSContainValue(CountryMapData,"GB") ? Colors.green : Colors.grey,
        gD:iSContainValue(CountryMapData,"GD") ? Colors.green : Colors.grey,
        gE:iSContainValue(CountryMapData,"GE") ? Colors.green : Colors.grey,
        gF:iSContainValue(CountryMapData,"GF") ? Colors.green : Colors.grey,
        gG:iSContainValue(CountryMapData,"GG") ? Colors.green : Colors.grey,
        gH:iSContainValue(CountryMapData,"GH") ? Colors.green : Colors.grey,
        gI:iSContainValue(CountryMapData,"GI") ? Colors.green : Colors.grey,
        gL:iSContainValue(CountryMapData,"GL") ? Colors.green : Colors.grey,
        gM:iSContainValue(CountryMapData,"GM") ? Colors.green : Colors.grey,
        gN:iSContainValue(CountryMapData,"GN") ? Colors.green : Colors.grey,
        gP:iSContainValue(CountryMapData,"GP") ? Colors.green : Colors.grey,
        gQ:iSContainValue(CountryMapData,"GQ") ? Colors.green : Colors.grey,
        gR:iSContainValue(CountryMapData,"GR") ? Colors.green : Colors.grey,
        gS:iSContainValue(CountryMapData,"GS") ? Colors.green : Colors.grey,
        gT:iSContainValue(CountryMapData,"GT") ? Colors.green : Colors.grey,
        gU:iSContainValue(CountryMapData,"GU") ? Colors.green : Colors.grey,
        gW:iSContainValue(CountryMapData,"GW") ? Colors.green : Colors.grey,
        gY:iSContainValue(CountryMapData,"GY") ? Colors.green : Colors.grey,
        hK:iSContainValue(CountryMapData,"HK") ? Colors.green : Colors.grey,
        hM:iSContainValue(CountryMapData,"HM") ? Colors.green : Colors.grey,
        hN:iSContainValue(CountryMapData,"HN") ? Colors.green : Colors.grey,
        hR:iSContainValue(CountryMapData,"HR") ? Colors.green : Colors.grey,
        hT:iSContainValue(CountryMapData,"HT") ? Colors.green : Colors.grey,
        hU:iSContainValue(CountryMapData,"HU") ? Colors.green : Colors.grey,
        iD:iSContainValue(CountryMapData,"ID") ? Colors.green : Colors.grey,
        iE:iSContainValue(CountryMapData,"IE") ? Colors.green : Colors.grey,
        iL:iSContainValue(CountryMapData,"IL") ? Colors.green : Colors.grey,
        iM:iSContainValue(CountryMapData,"IM") ? Colors.green : Colors.grey,
        iN:iSContainValue(CountryMapData,"IN") ? Colors.green : Colors.grey,
        iO:iSContainValue(CountryMapData,"IO") ? Colors.green : Colors.grey,
        iQ:iSContainValue(CountryMapData,"IQ") ? Colors.green : Colors.grey,
        iR:iSContainValue(CountryMapData,"IR") ? Colors.green : Colors.grey,
        iS:iSContainValue(CountryMapData,"IS") ? Colors.green : Colors.grey,
        iT:iSContainValue(CountryMapData,"IT") ? Colors.green : Colors.grey,
        jE:iSContainValue(CountryMapData,"JE") ? Colors.green : Colors.grey,
        jM:iSContainValue(CountryMapData,"JM") ? Colors.green : Colors.grey,
        jO:iSContainValue(CountryMapData,"JO") ? Colors.green : Colors.grey,
        jP:iSContainValue(CountryMapData,"JP") ? Colors.green : Colors.grey,
        kE:iSContainValue(CountryMapData,"KE") ? Colors.green : Colors.grey,
        kG:iSContainValue(CountryMapData,"KG") ? Colors.green : Colors.grey,
        kH:iSContainValue(CountryMapData,"KH") ? Colors.green : Colors.grey,
        kI:iSContainValue(CountryMapData,"KI") ? Colors.green : Colors.grey,
        kM:iSContainValue(CountryMapData,"KM") ? Colors.green : Colors.grey,
        kN:iSContainValue(CountryMapData,"KN") ? Colors.green : Colors.grey,
        kP:iSContainValue(CountryMapData,"KP") ? Colors.green : Colors.grey,
        kR:iSContainValue(CountryMapData,"KR") ? Colors.green : Colors.grey,
        kW:iSContainValue(CountryMapData,"KW") ? Colors.green : Colors.grey,
        kY:iSContainValue(CountryMapData,"KY") ? Colors.green : Colors.grey,
        kZ:iSContainValue(CountryMapData,"KZ") ? Colors.green : Colors.grey,
        lA:iSContainValue(CountryMapData,"LA") ? Colors.green : Colors.grey,
        lB:iSContainValue(CountryMapData,"LB") ? Colors.green : Colors.grey,
        lC:iSContainValue(CountryMapData,"LC") ? Colors.green : Colors.grey,
        lI:iSContainValue(CountryMapData,"LI") ? Colors.green : Colors.grey,
        lK:iSContainValue(CountryMapData,"LK") ? Colors.green : Colors.grey,
        lR:iSContainValue(CountryMapData,"LR") ? Colors.green : Colors.grey,
        lS:iSContainValue(CountryMapData,"LS") ? Colors.green : Colors.grey,
        lT:iSContainValue(CountryMapData,"LT") ? Colors.green : Colors.grey,
        lU:iSContainValue(CountryMapData,"LU") ? Colors.green : Colors.grey,
        lV:iSContainValue(CountryMapData,"LV") ? Colors.green : Colors.grey,
        lY:iSContainValue(CountryMapData,"LY") ? Colors.green : Colors.grey,
        mA:iSContainValue(CountryMapData,"MA") ? Colors.green : Colors.grey,
        mC:iSContainValue(CountryMapData,"MC") ? Colors.green : Colors.grey,
        mD:iSContainValue(CountryMapData,"MD") ? Colors.green : Colors.grey,
        mE:iSContainValue(CountryMapData,"ME") ? Colors.green : Colors.grey,
        mF:iSContainValue(CountryMapData,"MF") ? Colors.green : Colors.grey,
        mG:iSContainValue(CountryMapData,"MG") ? Colors.green : Colors.grey,
        mH:iSContainValue(CountryMapData,"MH") ? Colors.green : Colors.grey,
        mK:iSContainValue(CountryMapData,"MK") ? Colors.green : Colors.grey,
        mL:iSContainValue(CountryMapData,"ML") ? Colors.green : Colors.grey,
        mM:iSContainValue(CountryMapData,"MM") ? Colors.green : Colors.grey,
        mN:iSContainValue(CountryMapData,"MN") ? Colors.green : Colors.grey,
        mO:iSContainValue(CountryMapData,"MO") ? Colors.green : Colors.grey,
        mP:iSContainValue(CountryMapData,"MP") ? Colors.green : Colors.grey,
        mQ:iSContainValue(CountryMapData,"MQ") ? Colors.green : Colors.grey,
        mR:iSContainValue(CountryMapData,"MR") ? Colors.green : Colors.grey,
        mS:iSContainValue(CountryMapData,"MS") ? Colors.green : Colors.grey,
        mT:iSContainValue(CountryMapData,"MT") ? Colors.green : Colors.grey,
        mU:iSContainValue(CountryMapData,"MU") ? Colors.green : Colors.grey,
        mV:iSContainValue(CountryMapData,"MV") ? Colors.green : Colors.grey,
        mW:iSContainValue(CountryMapData,"MW") ? Colors.green : Colors.grey,
        mX:iSContainValue(CountryMapData,"MX") ? Colors.green : Colors.grey,
        mY:iSContainValue(CountryMapData,"MY") ? Colors.green : Colors.grey,
        mZ:iSContainValue(CountryMapData,"MZ") ? Colors.green : Colors.grey,
        nA:iSContainValue(CountryMapData,"NA") ? Colors.green : Colors.grey,
        nC:iSContainValue(CountryMapData,"NC") ? Colors.green : Colors.grey,
        nE:iSContainValue(CountryMapData,"NE") ? Colors.green : Colors.grey,
        nF:iSContainValue(CountryMapData,"NF") ? Colors.green : Colors.grey,
        nG:iSContainValue(CountryMapData,"NG") ? Colors.green : Colors.grey,
        nI:iSContainValue(CountryMapData,"NI") ? Colors.green : Colors.grey,
        nL:iSContainValue(CountryMapData,"NL") ? Colors.green : Colors.grey,
        nO:iSContainValue(CountryMapData,"NO") ? Colors.green : Colors.grey,
        nP:iSContainValue(CountryMapData,"NP") ? Colors.green : Colors.grey,
        nR:iSContainValue(CountryMapData,"NR") ? Colors.green : Colors.grey,
        nU:iSContainValue(CountryMapData,"NU") ? Colors.green : Colors.grey,
        nZ:iSContainValue(CountryMapData,"NZ") ? Colors.green : Colors.grey,
        oM:iSContainValue(CountryMapData,"OM") ? Colors.green : Colors.grey,
        pA:iSContainValue(CountryMapData,"PA") ? Colors.green : Colors.grey,
        pE:iSContainValue(CountryMapData,"PE") ? Colors.green : Colors.grey,
        pF:iSContainValue(CountryMapData,"PF") ? Colors.green : Colors.grey,
        pG:iSContainValue(CountryMapData,"PG") ? Colors.green : Colors.grey,
        pH:iSContainValue(CountryMapData,"PH") ? Colors.green : Colors.grey,
        pK:iSContainValue(CountryMapData,"PK") ? Colors.green : Colors.grey,
        pL:iSContainValue(CountryMapData,"PL") ? Colors.green : Colors.grey,
        pM:iSContainValue(CountryMapData,"PM") ? Colors.green : Colors.grey,
        pN:iSContainValue(CountryMapData,"PN") ? Colors.green : Colors.grey,
        pR:iSContainValue(CountryMapData,"PR") ? Colors.green : Colors.grey,
        pS:iSContainValue(CountryMapData,"PS") ? Colors.green : Colors.grey,
        pT:iSContainValue(CountryMapData,"PT") ? Colors.green : Colors.grey,
        pW:iSContainValue(CountryMapData,"PW") ? Colors.green : Colors.grey,
        pY:iSContainValue(CountryMapData,"PY") ? Colors.green : Colors.grey,
        qA:iSContainValue(CountryMapData,"QA") ? Colors.green : Colors.grey,
        rE:iSContainValue(CountryMapData,"RE") ? Colors.green : Colors.grey,
        rO:iSContainValue(CountryMapData,"RO") ? Colors.green : Colors.grey,
        rS:iSContainValue(CountryMapData,"RS") ? Colors.green : Colors.grey,
        rU:iSContainValue(CountryMapData,"RU") ? Colors.green : Colors.grey,
        rW:iSContainValue(CountryMapData,"RW") ? Colors.green : Colors.grey,
        sA:iSContainValue(CountryMapData,"SA") ? Colors.green : Colors.grey,
        sB:iSContainValue(CountryMapData,"SB") ? Colors.green : Colors.grey,
        sC:iSContainValue(CountryMapData,"SC") ? Colors.green : Colors.grey,
        sD:iSContainValue(CountryMapData,"SD") ? Colors.green : Colors.grey,
        sE:iSContainValue(CountryMapData,"SE") ? Colors.green : Colors.grey,
        sG:iSContainValue(CountryMapData,"SG") ? Colors.green : Colors.grey,
        sH:iSContainValue(CountryMapData,"SH") ? Colors.green : Colors.grey,
        sI:iSContainValue(CountryMapData,"SI") ? Colors.green : Colors.grey,
        sJ:iSContainValue(CountryMapData,"SJ") ? Colors.green : Colors.grey,
        sK:iSContainValue(CountryMapData,"SK") ? Colors.green : Colors.grey,
        sL:iSContainValue(CountryMapData,"SL") ? Colors.green : Colors.grey,
        sM:iSContainValue(CountryMapData,"SM") ? Colors.green : Colors.grey,
        sN:iSContainValue(CountryMapData,"SN") ? Colors.green : Colors.grey,
        sO:iSContainValue(CountryMapData,"SO") ? Colors.green : Colors.grey,
        sR:iSContainValue(CountryMapData,"SR") ? Colors.green : Colors.grey,
        sS:iSContainValue(CountryMapData,"SS") ? Colors.green : Colors.grey,
        sT:iSContainValue(CountryMapData,"ST") ? Colors.green : Colors.grey,
        sV:iSContainValue(CountryMapData,"SV") ? Colors.green : Colors.grey,
        sX:iSContainValue(CountryMapData,"SX") ? Colors.green : Colors.grey,
        sY:iSContainValue(CountryMapData,"SY") ? Colors.green : Colors.grey,
        sZ:iSContainValue(CountryMapData,"SZ") ? Colors.green : Colors.grey,
        tC:iSContainValue(CountryMapData,"TC") ? Colors.green : Colors.grey,
        tD:iSContainValue(CountryMapData,"TD") ? Colors.green : Colors.grey,
        tF:iSContainValue(CountryMapData,"TF") ? Colors.green : Colors.grey,
        tG:iSContainValue(CountryMapData,"TG") ? Colors.green : Colors.grey,
        tH:iSContainValue(CountryMapData,"TH") ? Colors.green : Colors.grey,
        tJ:iSContainValue(CountryMapData,"TJ") ? Colors.green : Colors.grey,
        tK:iSContainValue(CountryMapData,"TK") ? Colors.green : Colors.grey,
        tL:iSContainValue(CountryMapData,"TL") ? Colors.green : Colors.grey,
        tM:iSContainValue(CountryMapData,"TM") ? Colors.green : Colors.grey,
        tN:iSContainValue(CountryMapData,"TN") ? Colors.green : Colors.grey,
        tO:iSContainValue(CountryMapData,"TO") ? Colors.green : Colors.grey,
        tR:iSContainValue(CountryMapData,"TR") ? Colors.green : Colors.grey,
        tT:iSContainValue(CountryMapData,"TT") ? Colors.green : Colors.grey,
        tV:iSContainValue(CountryMapData,"TV") ? Colors.green : Colors.grey,
        tW:iSContainValue(CountryMapData,"TW") ? Colors.green : Colors.grey,
        tZ:iSContainValue(CountryMapData,"TZ") ? Colors.green : Colors.grey,
        uA:iSContainValue(CountryMapData,"UA") ? Colors.green : Colors.grey,
        uG:iSContainValue(CountryMapData,"UG") ? Colors.green : Colors.grey,
        uM:iSContainValue(CountryMapData,"UM") ? Colors.green : Colors.grey,
        uS:iSContainValue(CountryMapData,"US") ? Colors.green : Colors.grey,
        uY:iSContainValue(CountryMapData,"UY") ? Colors.green : Colors.grey,
        uZ:iSContainValue(CountryMapData,"UZ") ? Colors.green : Colors.grey,
        vA:iSContainValue(CountryMapData,"VA") ? Colors.green : Colors.grey,
        vC:iSContainValue(CountryMapData,"VC") ? Colors.green : Colors.grey,
        vE:iSContainValue(CountryMapData,"VE") ? Colors.green : Colors.grey,
        vG:iSContainValue(CountryMapData,"VG") ? Colors.green : Colors.grey,
        vI:iSContainValue(CountryMapData,"VI") ? Colors.green : Colors.grey,
        vN:iSContainValue(CountryMapData,"VN") ? Colors.green : Colors.grey,
        vU:iSContainValue(CountryMapData,"VU") ? Colors.green : Colors.grey,
        wF:iSContainValue(CountryMapData,"WF") ? Colors.green : Colors.grey,
        wS:iSContainValue(CountryMapData,"WS") ? Colors.green : Colors.grey,
        xK:iSContainValue(CountryMapData,"XK") ? Colors.green : Colors.grey,
        yE:iSContainValue(CountryMapData,"YE") ? Colors.green : Colors.grey,
        yT:iSContainValue(CountryMapData,"YT") ? Colors.green : Colors.grey,
        zA:iSContainValue(CountryMapData,"ZA") ? Colors.green : Colors.grey,
        zM:iSContainValue(CountryMapData,"ZM") ? Colors.green : Colors.grey,
        zW:iSContainValue(CountryMapData,"ZW") ? Colors.green : Colors.grey,

      ).toMap(),

      callback: (id, name, tapdetails) {
        print(id);
      },
    );

  }


  bool iSContainValue(List<dynamic> countryData, String? value){
    for (var item in countryData) {
      if (item == value) {
        return true;
      }
    }
    return false;

  }

  List<String> extractCountryCodes(List<dynamic> data) {
    return [
      for (var item in (data ?? []).skip(1)) item[0].toString()
    ];
  }

  List<String> extractCountryValue(List<dynamic>? data) {
    return [
      for (var item in (data ?? []).skip(1)) item[1].toString()
    ];
  }


}

class BodyContainer extends StatelessWidget {
  final SellerDashboardMpModel? sellerDashboardMpModel;
  const BodyContainer(
    this.sellerDashboardMpModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderInfo(sellerDashboardMpModel),
          TopProducts(sellerDashboardMpModel),
          const SizedBox(
            height: 10.0,
          ),
          LatestOrders(
            sellerDashboardMpModel,
            // (itemHash) {
            //   sellerDashboardMpBloc
            //       ?.add(SellerDashboardMpFetchEvent(itemHash as int));
            // },
          ),
          const SizedBox(
            height: 10.0,
          ),
          RecentReviews(sellerDashboardMpModel),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
