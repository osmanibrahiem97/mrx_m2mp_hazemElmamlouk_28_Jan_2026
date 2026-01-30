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

import '../constants/app_constants.dart';

// import '../constants/app_constants.dart';
AppBar commonAppBar(
    String heading,
    BuildContext context, {
      bool isHomeEnable = false,
      bool isElevated = true,
      bool isLeadingEnable = false,
      leadingIcon,
      List<Widget>? actions,
      VoidCallback? onPressed,
      Color? color,
    }) {
  return AppBar(
      backgroundColor: color == null ? null : color,
      leading: isLeadingEnable
          ? IconButton(
          onPressed: () {
            onPressed!();
          },
          icon: Icon(leadingIcon ?? Icons.clear))
          : null,
      elevation: isElevated ? null : 0,
      title: Wrap(
        children: [
          if (isHomeEnable)
            SizedBox(
              height: AppBar().preferredSize.height / 2,
              width: AppBar().preferredSize.height / 2,
              child: Image.asset(
                AppImages.appIcon,
                fit: BoxFit.fill,
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isHomeEnable ? AppSizes.size8 : 0),
            child: Text(
              heading,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Theme.of(context).textTheme.bodySmall?.color,),
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
      actions: actions);
}
