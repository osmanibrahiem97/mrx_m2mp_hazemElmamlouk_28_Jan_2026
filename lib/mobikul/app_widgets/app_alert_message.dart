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

import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
// import 'package:fluttertoast/fluttertoast.dart;
// import 'package:overlay_support/overlay_support.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:async';

import '../constants/app_constants.dart';

class AlertMessage {
  static showError(String message, BuildContext context){

    return showSimpleNotification(
      elevation: 0,
      Text(message,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      background:AppColors.error,
      leading: const Icon(Icons.error, color: Colors.white, size: 40),
      slideDismissDirection: DismissDirection.up,
        duration: Duration(milliseconds: 500)

    );
  }

  static showSuccess(String message,BuildContext context){
    return showSimpleNotification(
      elevation: 0,
      Text(message,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        background:AppColors.success,
        leading: const Icon(Icons.check_circle_outline, color: Colors.white, size: 40),
      slideDismissDirection: DismissDirection.up,
        duration: Duration(milliseconds: 500)
    );
  }
  static showWarning(String message, BuildContext context){
    return showSimpleNotification(
      elevation: 0,
      Text(message,style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      background:AppColors.warning,
      slideDismissDirection: DismissDirection.up,
        duration: Duration(milliseconds: 500)

    );
  }
}

class ToastUtils {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;

  static void showCustomToast(BuildContext context, String message, Icon icon, Color color) {

    if (!(toastTimer?.isActive ?? false)) {

      toastTimer = null;
    }
    if (toastTimer == null) {
      if (!(toastTimer?.isActive ?? false)) {
        _overlayEntry = createOverlayEntry(context, message, icon, color);
        Overlay.of(context)!.insert(_overlayEntry!);
        toastTimer = Timer(const Duration(seconds: 10), () {
          _overlayEntry?.remove();
          _overlayEntry = null;
          // if (_overlayEntry != null) {
          //   _overlayEntry?.remove();
          // }
        });
        toastTimer = null;
      }
    }
  }

  static OverlayEntry createOverlayEntry(
      BuildContext context, String message, Icon icon, Color color) {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: AppSizes.deviceWidth,
        child: SlideInToastMessageAnimation(Material(
          child: Container(
            padding:const EdgeInsets.only(top: 30, bottom: 8, left: 16, right: 8),
            decoration: BoxDecoration(color: color),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  icon,
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                      width: AppSizes.deviceWidth - 75,
                      child: Text(
                        message,
                        softWrap: true,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xFFFFFFFF),
                        ),
                      ))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
class SlideInToastMessageAnimation extends StatefulWidget {
  final Widget child;

  const SlideInToastMessageAnimation(this.child, {Key? key}) : super(key: key);

  @override
  State<SlideInToastMessageAnimation> createState() => _SlideInToastMessageAnimationState();
}

class _SlideInToastMessageAnimationState extends State<SlideInToastMessageAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnim;
  late final Animation<double> _translateYAnim;

  // Duration chosen to emulate previous timings: 500ms fade in, 1000ms hold, 500ms fade out
  static const _totalDuration = Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _totalDuration);

    // Opacity: 0 -> 1 (0-500ms), hold 1 (500-1500ms), 1 -> 0 (1500-2000ms)
    _opacityAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeIn)), weight: 25),
      TweenSequenceItem(tween: ConstantTween<double>(1.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0).chain(CurveTween(curve: Curves.easeOut)), weight: 25),
    ]).animate(_controller);

    // Translate Y (vertical slide): -100 -> 0 (0-250ms), hold (250-1750ms), 0 -> -100 (1750-2000ms)
    _translateYAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: -100.0, end: 0.0).chain(CurveTween(curve: Curves.easeOut)), weight: 12.5),
      TweenSequenceItem(tween: ConstantTween<double>(0.0), weight: 75),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -100.0).chain(CurveTween(curve: Curves.easeIn)), weight: 12.5),
    ]).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnim.value,
          child: Transform.translate(
            offset: Offset(0, _translateYAnim.value),
            child: child,
          ),
        );
      },
    );
  }
}
