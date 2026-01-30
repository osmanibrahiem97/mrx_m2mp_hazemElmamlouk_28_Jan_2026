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
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';

class MpAlertDialog extends StatelessWidget {
  final String? title, msg;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool? barrierDismissible;
  const MpAlertDialog({
    this.title,
    this.msg,
    this.onConfirm,
    this.onCancel,
    this.barrierDismissible,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title!,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      content: Text(
        msg!,
        style:Theme.of(context).textTheme.titleLarge,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                    Utils.getStringValue(context, Utils.getStringValue(context, MpStringConstants.cancel)),
                    style: Theme.of(context)
                    .textTheme
                    .displaySmall,
                )),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onConfirm != null) {
                  onConfirm!();
                }
              },
              child: Center(
                child: Text(
                    Utils.getStringValue(context, Utils.getStringValue(context, AppStringConstant.ok)),
                    style:  TextStyle(color: Theme.of(context).textTheme.labelLarge?.color)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
