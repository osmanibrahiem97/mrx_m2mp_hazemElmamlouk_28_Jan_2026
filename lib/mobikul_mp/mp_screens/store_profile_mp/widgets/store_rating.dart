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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/review_circle_mp.dart';

class StoreRating extends StatelessWidget {
  final StoreProfileMpModel storeProfileMpModel;
  const StoreRating(
    this.storeProfileMpModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.storeRating)
                      .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            /// Average Price Rating ///
            if (storeProfileMpModel?.averagePriceRating != null &&
                storeProfileMpModel?.averagePriceRating != 0.0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (storeProfileMpModel?.price1Star != '' &&
                      storeProfileMpModel?.price1Star != null)
                    SizedBox(
                        height: AppSizes.deviceWidth / 3,
                        width: AppSizes.deviceWidth / 3,
                        child: ReviewCircleMp(
                          oneRating: storeProfileMpModel.price1Star ?? '',
                          twoRating: storeProfileMpModel.price2Star ?? '',
                          threeRating: storeProfileMpModel.price3Star ?? '',
                          fourRating: storeProfileMpModel.price4Star ?? '',
                          fiveRating: storeProfileMpModel.price5Star ?? '',
                        )),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (storeProfileMpModel?.averagePriceRating == 0.0 &&
                            storeProfileMpModel?.averagePriceRating != null)
                          Text(
                            Utils.getStringValue(
                                context, AppStringConstant.noReviewsYet),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: AppSizes.textSizeTiny),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        if (storeProfileMpModel?.averagePriceRating != 0.0 &&
                            storeProfileMpModel?.averagePriceRating != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.spacingTiny,
                                vertical: AppSizes.spacingTiny),
                            color: Utils.ratingBackground(
                                    (storeProfileMpModel?.averagePriceRating ??
                                            "0")
                                        .toString()) ??
                                Colors.pink,
                            child: SizedBox(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: AppSizes.size4,
                                  ),
                                  Text(
                                      "${storeProfileMpModel?.averagePriceRating}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: AppSizes.textSizeSmall,
                                              color: AppColors.white)),
                                  const SizedBox(
                                    width: AppSizes.spacingTiny,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: AppSizes.textSizeSmall,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: AppSizes.spacingGeneric,
                        ),
                        Text(
                            Utils.getStringValue(
                                    context, AppStringConstant.basedOn) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(
                          height: AppSizes.spacingTiny,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Utils.getStringValue(context,
                                  MpStringConstants.averagePriceRating),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                            Text(
                              ' (${storeProfileMpModel?.feedbackCount})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                      ])
                ],
              ),
            if (storeProfileMpModel?.averagePriceRating != null &&
                storeProfileMpModel?.averagePriceRating != 0.0)
              const SizedBox(height: 10.0),

            /// Average Value Rating ///
            if (storeProfileMpModel?.averageValueRating != null &&
                storeProfileMpModel?.averagePriceRating != 0.0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (storeProfileMpModel.value1Star != '')
                    SizedBox(
                        height: AppSizes.deviceWidth / 3,
                        width: AppSizes.deviceWidth / 3,
                        child: ReviewCircleMp(
                          oneRating: storeProfileMpModel.value1Star ?? '',
                          twoRating: storeProfileMpModel.value2Star ?? '',
                          threeRating: storeProfileMpModel.value3Star ?? '',
                          fourRating: storeProfileMpModel.value4Star ?? '',
                          fiveRating: storeProfileMpModel.value5Star ?? '',
                        )),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (storeProfileMpModel?.averageValueRating == 0.0)
                          Text(
                            Utils.getStringValue(
                                context, AppStringConstant.noReviewsYet),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: AppSizes.textSizeTiny),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        if (storeProfileMpModel?.averageValueRating != 0.0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.spacingTiny,
                                vertical: AppSizes.spacingTiny),
                            color: Utils.ratingBackground(
                                    (storeProfileMpModel?.averageValueRating ??
                                            "0")
                                        .toString()) ??
                                Colors.pink,
                            child: SizedBox(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: AppSizes.size4,
                                  ),
                                  Text(
                                      "${storeProfileMpModel?.averageValueRating}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: AppSizes.textSizeSmall,
                                              color: AppColors.white)),
                                  const SizedBox(
                                    width: AppSizes.spacingTiny,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: AppSizes.textSizeSmall,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: AppSizes.spacingGeneric,
                        ),
                        Text(
                            Utils.getStringValue(
                                    context, AppStringConstant.basedOn) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(
                          height: AppSizes.spacingTiny,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Utils.getStringValue(context,
                                  MpStringConstants.averageValueRating),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                            Text(
                              ' (${storeProfileMpModel?.feedbackCount})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                      ])
                ],
              ),
            if (storeProfileMpModel?.averageValueRating != null &&
                storeProfileMpModel?.averagePriceRating != 0.0)
              const SizedBox(height: 10.0),

            /// Average Quality Rating ///
            if (storeProfileMpModel?.averageQualityRating != null &&
                storeProfileMpModel?.averagePriceRating != 0.0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (storeProfileMpModel.quality1Star != '')
                    SizedBox(
                        height: AppSizes.deviceWidth / 3,
                        width: AppSizes.deviceWidth / 3,
                        child: ReviewCircleMp(
                          oneRating: storeProfileMpModel.quality1Star ?? '',
                          twoRating: storeProfileMpModel.quality2Star ?? '',
                          threeRating: storeProfileMpModel.quality3Star ?? '',
                          fourRating: storeProfileMpModel.quality4Star ?? '',
                          fiveRating: storeProfileMpModel.quality5Star ?? '',
                        )),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (storeProfileMpModel?.averageQualityRating == 0.0 &&
                            storeProfileMpModel?.averagePriceRating != 0.0)
                          Text(
                            Utils.getStringValue(
                                context, AppStringConstant.noReviewsYet),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: AppSizes.textSizeTiny),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        if (storeProfileMpModel?.averageQualityRating != 0.0 &&
                            storeProfileMpModel?.averagePriceRating != 0.0)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.spacingTiny,
                                vertical: AppSizes.spacingTiny),
                            color: Utils.ratingBackground((storeProfileMpModel
                                            ?.averageQualityRating ??
                                        "0")
                                    .toString()) ??
                                Colors.pink,
                            child: SizedBox(
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: AppSizes.size4,
                                  ),
                                  Text(
                                      "${storeProfileMpModel?.averageQualityRating}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: AppSizes.textSizeSmall,
                                              color: AppColors.white)),
                                  const SizedBox(
                                    width: AppSizes.spacingTiny,
                                  ),
                                  const Icon(
                                    Icons.star,
                                    size: AppSizes.textSizeSmall,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: AppSizes.spacingGeneric,
                        ),
                        Text(
                            Utils.getStringValue(
                                    context, AppStringConstant.basedOn) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(
                          height: AppSizes.spacingTiny,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Utils.getStringValue(context,
                                  MpStringConstants.averageQualityRating),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                            Text(
                              '(${storeProfileMpModel?.feedbackCount})',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                            ),
                          ],
                        ),
                      ])
                ],
              ),
            if (storeProfileMpModel?.averageQualityRating != null &&
                storeProfileMpModel?.averagePriceRating != 0.0)
              const SizedBox(
                height: AppSizes.spacingLarge,
              ),
          ]),
    );
  }
}
