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
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/configuration/mobikul_theme.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';

class StaticViewGridTile extends StatelessWidget {
  const StaticViewGridTile({
    super.key,
    required this.context,
    required this.title,
    required this.subTitle,
    required this.img,
  });

  final BuildContext context;
  final String title;
  final String subTitle;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (AppSizes.deviceWidth/2-8),
      color: MobikulTheme.diffColor.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: MobikulTheme.diffColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.spacingGeneric,),
            CircleAvatar(
              backgroundColor: Theme.of(context).cardColor,
              radius: 35,
              backgroundImage: AssetImage(
                img,
              ),
            ),
            SizedBox(height: AppSizes.spacingTiny,),
            Container(
              height: AppSizes.deviceWidth/5,
              child: Text(
                subTitle,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 14.0),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
