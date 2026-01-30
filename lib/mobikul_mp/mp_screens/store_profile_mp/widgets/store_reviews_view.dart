import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_dialog_helper.dart';
import 'package:test_new/mobikul/app_widgets/bottom_sheet.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/seller_reviews.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_rating.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/write_your_review_mp.dart';

import '../../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../../mobikul/constants/app_string_constant.dart';

class StoreReviewsView extends StatelessWidget {
  final StoreProfileMpModel storeProfileMpModel;
  const StoreReviewsView({Key? key, required this.storeProfileMpModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: storeProfileMpModel.backgroundColor != null
          ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
          : const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Container(
          color: storeProfileMpModel.backgroundColor != null
              ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
              : const Color(0xFFFFFFFF),
          child: Column(
            children: [
              ///Header View
              // if (storeProfileMpModel?.averageRating == 0.0)
              //   SingleChildScrollView(
              //     child: SizedBox(
              //       height: 100,
              //       child: Center(
              //         child: Text(Utils.getStringValue(
              //             context,
              //             MpStringConstants
              //                 .noReviewsFound)),
              //       ),
              //     ),
              //   ),

              // if (storeProfileMpModel?.averageRating != 0.0)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    if (storeProfileMpModel?.averageRating == null)
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
                    if (storeProfileMpModel?.averageRating != null &&
                        storeProfileMpModel?.averageRating != 0.0)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.spacingTiny,
                            vertical: AppSizes.spacingTiny),
                        color: Utils.ratingBackground(
                                (storeProfileMpModel?.averageRating ?? "0")
                                    .toString()) ??
                            Colors.pink,
                        child: SizedBox(
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              const SizedBox(
                                width: AppSizes.size4,
                              ),
                              Text("${storeProfileMpModel?.averageRating}",
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
                    if (storeProfileMpModel?.averageRating != null &&
                        storeProfileMpModel?.averageRating != 0.0)
                      const SizedBox(
                        height: AppSizes.spacingTiny,
                      ),
                    if (storeProfileMpModel?.averageRating != null &&
                        storeProfileMpModel?.averageRating != 0.0)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Utils.getStringValue(
                                context, MpStringConstants.averageRating),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            '(${storeProfileMpModel?.feedbackCount})',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    if (storeProfileMpModel?.averageRating != null &&
                        storeProfileMpModel?.averageRating != 0)
                      Text(
                        '${(storeProfileMpModel?.averageRating??0.0) ~/ 0.05}% ${Utils.getStringValue(context, MpStringConstants.positiveFeedback)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // if(storeProfileMpModel?.showReview ?? false)
                     ElevatedButton(
                        // onPressed: () async {
                        //   if (await appStoragePref.isLoggedIn()) {
                        //     if(storeProfileMpModel?.showReview != true?? false) {
                        //       showAppModalBottomSheet(
                        //           isScrollControlled: true,
                        //           context: context,
                        //           builder: (context) =>
                        //               BlocProvider(
                        //                 create: (context) =>
                        //                     WriteYourReviewBloc(
                        //                         repository:
                        //                         WriteYourReviewRepositoryImp()),
                        //                 child: WriteYourReviewMp(
                        //                   sellerId: storeProfileMpModel
                        //                       .sellerId,
                        //                   shopUrl: storeProfileMpModel.shopUrl,
                        //                 ),
                        //               ));
                        //     }else {
                        //       WidgetsBinding.instance.addPostFrameCallback((_) {
                        //         AlertMessage.showWarning(
                        //             AppStringConstant.youNeedToPurchase ?? '', context);
                        //       });
                        //     }
                        //   } else {
                        //     AppDialogHelper.confirmationDialog(
                        //         Utils.getStringValue(context,
                        //             MpStringConstants.loginRequiredToAddReview),
                        //         context,
                        //         AppLocalizations.of(context),
                        //         title: Utils.getStringValue(
                        //             context, AppStringConstant.loginRequired),
                        //         onConfirm: () async {
                        //       Navigator.of(context).pushNamed(
                        //           AppRoutes.signInSignUp,
                        //           arguments: false);
                        //     });
                        //   }
                        // },
                         onPressed: () async {
                           if (await appStoragePref.isLoggedIn()) {
                             if(storeProfileMpModel?.showReview == true?? false) {
                               showAppModalBottomSheet(
                                   isScrollControlled: true,
                                   context: context,
                                   builder: (context) =>
                                       BlocProvider(
                                         create: (context) =>
                                             WriteYourReviewBloc(
                                                 repository:
                                                 WriteYourReviewRepositoryImp()),
                                         child: WriteYourReviewMp(
                                           sellerId: storeProfileMpModel
                                               .sellerId,
                                           shopUrl: storeProfileMpModel.shopUrl,
                                         ),
                                       ));
                             }else {
                               WidgetsBinding.instance.addPostFrameCallback((_) {
                                 AlertMessage.showWarning(

                                     Utils.getStringValue(context,
                                         AppStringConstant.youNeedToPurchase)
                                         ?? '', context);
                               });
                             }
                           } else {
                             AppDialogHelper.confirmationDialog(
                                 Utils.getStringValue(context,
                                     MpStringConstants.loginRequiredToAddReview),
                                 context,
                                 AppLocalizations.of(context),
                                 title: Utils.getStringValue(
                                     context, AppStringConstant.loginRequired),
                                 onConfirm: () async {
                                   Navigator.of(context).pushNamed(
                                       AppRoutes.signInSignUp,
                                       arguments: false);
                                 });
                           }
                         },
                         child: Text(
                          Utils.getStringValue(
                              context, MpStringConstants.writeYourReview),
                          style: TextStyle(color: Theme.of(context).textTheme!.labelLarge?.color),
                        )),
                  ],
                ),
              ),

              ///Store Rating View
              if (storeProfileMpModel?.averagePriceRating != null &&
                  storeProfileMpModel?.averagePriceRating != 0.0)
                StoreRating(storeProfileMpModel),

              ///Seller Reviews View
              if ((storeProfileMpModel?.reviewList ?? []).isNotEmpty)
                SellerReviews(storeProfileMpModel),
            ],
          ),
        ),
      ),
    );
  }
}
