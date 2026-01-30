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

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';

class ReviewCircleMp extends StatefulWidget {
  final oneRating, twoRating, threeRating, fourRating, fiveRating;
  const ReviewCircleMp(
      {Key? key,
      required this.oneRating,
      required this.twoRating,
      required this.threeRating,
      required this.fourRating,
      required this.fiveRating})
      : super(key: key);

  @override
  _ReviewCircleMpState createState() => _ReviewCircleMpState();
}

class _ReviewCircleMpState extends State<ReviewCircleMp> {
  AppLocalizations? _localizations;

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Center(
        child: CustomPaint(
          painter: OpenPainter(
              oneRating: widget.oneRating,
              twoRating: widget.twoRating,
              threeRating: widget.threeRating,
              fourRating: widget.fourRating,
              fiveRating: widget.fiveRating),
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ratingStar(widget.oneRating, AppColors.red),
              ratingStar(widget.twoRating, AppColors.lightRed),
              ratingStar(widget.threeRating, AppColors.yellow),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ratingStar(widget.fourRating, AppColors.orange),
              ratingStar(widget.fiveRating, AppColors.green),
            ],
          ),
        ],
      )
    ]);
  }

  Widget ratingStar(String rating, Color color) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: (AppSizes.linePadding),
            vertical: (AppSizes.linePadding / 2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              rating,
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10),
            ),
            Icon(
              Icons.star,
              color: color,
              size: 10,
            )
          ],
        ));
  }
}

class OpenPainter extends CustomPainter {
  final oneRating;
  final twoRating;
  final threeRating;
  final fourRating;
  final fiveRating;
  double pi = math.pi;

  OpenPainter(
      {this.oneRating,
      this.threeRating,
      this.twoRating,
      this.fiveRating,
      this.fourRating});

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 7;
    Rect myRect =
        Offset(-(AppSizes.deviceWidth / 7.4), -(AppSizes.deviceWidth / 7.4)) &
            Size(AppSizes.deviceWidth / 3.5, AppSizes.deviceWidth / 3.5);

    var paint1 = Paint()
      ..color = AppColors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint2 = Paint()
      ..color = AppColors.yellow
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    var paint3 = Paint()
      ..color = AppColors.green
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double firstLineRadianStart = 0;
    double totalRating = (double.parse(oneRating) +
        double.parse(twoRating) +
        double.parse(threeRating) +
        double.parse(fourRating) +
        double.parse(fiveRating));
    double _badReview =
        (double.parse(oneRating) + double.parse(twoRating)) / totalRating;
    double firstLineRadianEnd = getRadians(_badReview);
    canvas.drawArc(
        myRect, firstLineRadianStart, firstLineRadianEnd, false, paint1);
    double goodReview =
        (double.parse(threeRating) + double.parse(fourRating)) / totalRating;
    double secondLineRadianEnd = getRadians(goodReview);
    canvas.drawArc(
        myRect, firstLineRadianEnd, secondLineRadianEnd, false, paint2);
    double excellent = (double.parse(fiveRating)) / totalRating;
    double thirdLineRadianEnd = getRadians(excellent);
    canvas.drawArc(myRect, firstLineRadianEnd + secondLineRadianEnd,
        thirdLineRadianEnd, false, paint3);
  }

  double getRadians(double value) {
    return (360 * value) * pi / 180;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
