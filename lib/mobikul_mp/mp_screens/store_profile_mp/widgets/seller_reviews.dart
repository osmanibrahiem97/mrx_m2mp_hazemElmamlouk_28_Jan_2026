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
import 'package:test_new/mobikul/helper/bottom_sheet_helper.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/screens/product_detail/widgets/product_review_circle.dart';
import 'package:test_new/mobikul/screens/product_detail/widgets/product_reviews.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';

import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/review_circle_mp.dart';

class SellerReviews extends StatelessWidget {
  final StoreProfileMpModel storeProfileMpModel;
  const SellerReviews(
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
              Utils.getStringValue(context, MpStringConstants.sellerReviews)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: storeProfileMpModel.reviewList?.length ?? 0,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    color: Theme.of(context).cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      Utils.getStringValue(context,
                                          MpStringConstants.price_) ??
                                          '',
                                      style:
                                      Theme.of(context).textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppSizes.spacingTiny,
                                          vertical: AppSizes.spacingTiny),
                                      decoration: BoxDecoration(
                                          color: Utils.ratingBackground(
                                              (((storeProfileMpModel
                                                  ?.reviewList?[index]
                                                  ?.feedPrice??"0"))).toString()) ??
                                              Colors.pink,
                                          borderRadius:
                                          BorderRadius.circular(2.0)),
                                      child: SizedBox(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                                (((storeProfileMpModel
                                                    ?.reviewList?[index]
                                                    ?.feedPrice??"0")) )
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: AppSizes
                                                        .textSizeSmall,
                                                    color:
                                                    AppColors.white)),
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      Utils.getStringValue(context,
                                          MpStringConstants.value_) ??
                                          '',
                                      style:
                                      Theme.of(context).textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppSizes.spacingTiny,
                                          vertical: AppSizes.spacingTiny),
                                      decoration: BoxDecoration(
                                          color: Utils.ratingBackground(
                                              (((storeProfileMpModel
                                                  ?.reviewList?[index]
                                                  ?.feedValue??"0"))).toString()) ??
                                              Colors.pink,
                                          borderRadius:
                                          BorderRadius.circular(2.0)),
                                      child: SizedBox(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                                (((storeProfileMpModel
                                                    ?.reviewList?[index]
                                                    ?.feedValue??"0")))
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: AppSizes
                                                        .textSizeSmall,
                                                    color:
                                                    AppColors.white)),
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      Utils.getStringValue(context,
                                          MpStringConstants.quality_) ??
                                          '',
                                      style:
                                      Theme.of(context).textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppSizes.spacingTiny,
                                          vertical: AppSizes.spacingTiny),
                                      decoration: BoxDecoration(
                                          color: Utils.ratingBackground(
                                              (((storeProfileMpModel
                                                  ?.reviewList?[index]
                                                  ?.feedQuality??"0"))).toString()) ??
                                              Colors.pink,
                                          borderRadius:
                                          BorderRadius.circular(2.0)),
                                      child: SizedBox(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          children: [
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(
                                                (((storeProfileMpModel
                                                    ?.reviewList?[index]
                                                    ?.feedQuality??"0")))
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontSize: AppSizes
                                                        .textSizeSmall,
                                                    color:
                                                    AppColors.white)),
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            storeProfileMpModel!
                                .reviewList![index].description ??
                                '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    Utils.getStringValue(
                                        context, MpStringConstants.reviewBy),
                                    style:
                                    Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    storeProfileMpModel!
                                        .reviewList![index].userName ??
                                        '',
                                    style:
                                    Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              Text(
                                storeProfileMpModel!.reviewList![index].date ??
                                    '',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ]),
    );
  }
}
