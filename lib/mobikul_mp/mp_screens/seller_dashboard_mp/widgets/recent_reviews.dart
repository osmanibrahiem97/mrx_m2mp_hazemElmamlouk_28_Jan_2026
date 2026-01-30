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
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';

class RecentReviews extends StatelessWidget {
  final SellerDashboardMpModel? sellerDashboardMpModel;
  const RecentReviews(
      this.sellerDashboardMpModel, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).cardColor,
        child: ExpansionTile(
            initiallyExpanded: false,
            title: Text(
                Utils.getStringValue(context, MpStringConstants.recentReviews)
                    .toUpperCase() ??
                    '',
                style: Theme.of(context).textTheme.titleLarge),
            children: [

              ((sellerDashboardMpModel?.reviewList??[]).length > 0) ?

              ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: sellerDashboardMpModel?.reviewList?.length ?? 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        Utils.getStringValue(context,
                                            MpStringConstants.price_) ??
                                            '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                              "${getRangeReview(sellerDashboardMpModel?.reviewList?[index].priceRating ?? "0.0") ?? 0.0 * 0.05}",

                                              // (double.tryParse(sellerDashboardMpModel
                                              //     ?.reviewList?[
                                              // index]
                                              //     .priceRating.toString() ??
                                              //     '0.0') ?? 0.0 *
                                              //     0.05)
                                              //     .toString(),
                                            ) ??
                                                Colors.pink,
                                            borderRadius:
                                            BorderRadius.circular(3.0)),
                                        child: SizedBox(
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              Text(
                                                  "${getRangeReview(sellerDashboardMpModel?.reviewList?[index].priceRating ?? "0.0") ?? 0.0 * 0.05}",

                                                  // (double.tryParse(sellerDashboardMpModel
                                                  //     ?.reviewList?[
                                                  // index]
                                                  //     .priceRating.toString() ??
                                                  //     '0.0') ?? 0.0 *
                                                  //     0.05)
                                                  //     .toString(),
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
                                  SizedBox(width: 2,),

                                    Row(
                                      children: [
                                        Text(
                                          Utils.getStringValue(context,
                                              MpStringConstants.value_) ??
                                              '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
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
                                                "${getRangeReview(sellerDashboardMpModel?.reviewList?[index].valueRating ?? "0.0") ?? 0.0 * 0.05}",

                                                // (double.tryParse(sellerDashboardMpModel
                                                //     ?.reviewList?[index].valueRating.toString() ?? '0.0') ?? 0.0 * 0.05)
                                                //     .toString(),
                                              ) ??
                                                  Colors.pink,
                                              borderRadius:
                                              BorderRadius.circular(3.0)),
                                          child: SizedBox(
                                            child: Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                const SizedBox(
                                                  width: 4.0,
                                                ),
                                                Text(
                                                    "${getRangeReview(sellerDashboardMpModel?.reviewList?[index].valueRating ?? "0.0") ?? 0.0 * 0.05}",

                                                    // (double.tryParse(sellerDashboardMpModel
                                                    //     ?.reviewList?[index]
                                                    //     .valueRating.toString() ??
                                                    //     '0.0') ?? 0.0 *
                                                    //     0.05)
                                                    //     .toString(),
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

                                  SizedBox(width: 2,),
                                  Row(
                                    children: [
                                      Text(
                                        Utils.getStringValue(context,
                                            MpStringConstants.quality_) ??
                                            '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                              "${getRangeReview(sellerDashboardMpModel?.reviewList?[index].qualityRating ?? "0.0") ?? 0.0 * 0.05}",

                                              // (double.tryParse(sellerDashboardMpModel
                                              //     ?.reviewList?[
                                              // index]
                                              //     .qualityRating.toString() ??
                                              //     '0.0') ?? 0.0 *
                                              //     0.05)
                                              //     .toString(),
                                            ) ??
                                                Colors.pink,
                                            borderRadius:
                                            BorderRadius.circular(3.0)),
                                        child: SizedBox(
                                          child: Wrap(
                                            alignment: WrapAlignment.center,
                                            children: [
                                              const SizedBox(
                                                width: 4.0,
                                              ),
                                              Text(
                                                  "${getRangeReview(sellerDashboardMpModel?.reviewList?[index].qualityRating ?? "0.0") ?? 0.0 * 0.05}",
                                                  // (double.tryParse(sellerDashboardMpModel
                                                  //     ?.reviewList?[index].qualityRating.toString() ?? '0.0') ?? 0.0 *
                                                  //     0.05)
                                                  //     .toString(),
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
                              sellerDashboardMpModel
                                  ?.reviewList?[index].comment ??
                                  '',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            if ((sellerDashboardMpModel?.reviewList?[index].name??"").isNotEmpty)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Text(
                                          Utils.getStringValue(
                                              context, MpStringConstants.reviewBy),
                                          style:
                                          Theme.of(context).textTheme.titleMedium,
                                        ),
                                        Expanded(
                                          child: Text(
                                            sellerDashboardMpModel?.reviewList?[index].name ?? '',
                                            style:
                                            Theme.of(context).textTheme.titleLarge,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      sellerDashboardMpModel?.reviewList?[index].date ?? '',
                                      style: Theme.of(context).textTheme.titleMedium,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    );
                  })
                  :
              Text(
                  Utils.getStringValue(context, AppStringConstant.noReviewsYet)
                      .toUpperCase() ??
                      '',
                  style: Theme.of(context).textTheme.titleLarge),

              SizedBox(height: AppSizes.spacingGeneric,)

            ]),
      ),
    );
  }

  int getRangeReview(dynamic valuedata) {
    var value = double.parse(valuedata.toString());
    if (value >= 0 && value <= 20) {
      return 1;
    } else if (value > 20 && value <= 40) {
      return 2;
    } else if (value > 40 && value <= 60) {
      return 3;
    } else if (value > 60 && value <= 80) {
      return 4;
    } else if (value > 80 && value <= 100) {
      return 5;
    } else {
      return 0;
      // throw ArgumentError('Value must be between 0 and 100.');
    }
  }
}
