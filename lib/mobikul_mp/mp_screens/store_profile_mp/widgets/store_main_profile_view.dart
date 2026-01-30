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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_images.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../../../../mobikul/helper/app_storage_pref.dart';

class StoreMainProfileView extends StatefulWidget {
  final sellerId;
  final StoreProfileMpModel storeProfileMpModel;
  const StoreMainProfileView({
    required this.sellerId,
    required this.storeProfileMpModel,
    super.key,
  });

  @override
  State<StoreMainProfileView> createState() => _StoreMainProfileViewState();
}

class _StoreMainProfileViewState extends State<StoreMainProfileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ImageView(
          url: "${widget.storeProfileMpModel.bannerImage}",
          height: AppSizes.deviceWidth / 1,
          width: AppSizes.deviceWidth / 1,
          fit: BoxFit.fill,
          borderRadius: BorderRadius.zero,
          isBottomPadding: false,
        ),
        Container(
          width: AppSizes.deviceWidth / 1,
          height: AppSizes.deviceWidth / 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.4),
            Colors.black.withOpacity(0.2),
            Colors.black.withOpacity(0.4),
          ])),
        ),
        Positioned(
          bottom: AppSizes.size100,
          child: SizedBox(
            width: AppSizes.deviceWidth / 1,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ImageView(
                      url: widget.storeProfileMpModel.profileImage,
                      fit: BoxFit.fill,
                      borderRadius: BorderRadius.circular(10.0),
                      isBottomPadding: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                      Utils.parseHtmlString(
                          widget.storeProfileMpModel.shopTitle ?? ""),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.mapView,
                        arguments: widget.storeProfileMpModel.location ?? '',
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.storeProfileMpModel.location ?? "",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),

                  ///ReviewShow
                  if (widget.storeProfileMpModel?.averageRating == 0.0)
                    Text(
                      Utils.getStringValue(
                          context, AppStringConstant.noReviewsYet),
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: AppSizes.textSizeMedium,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  if (widget.storeProfileMpModel?.averageRating != 0.0)
                    if (widget.storeProfileMpModel?.averageRating != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.spacingTiny,
                            vertical: AppSizes.spacingTiny),
                        color: Utils.ratingBackground(
                                (widget.storeProfileMpModel?.averageRating ??
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
                                  "${widget.storeProfileMpModel?.averageRating}",
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
                    height: AppSizes.spacingTiny,
                  ),
                  if(widget.storeProfileMpModel.reportData?.showReportSeller ?? false)...[
                    if(widget.storeProfileMpModel.reportData?.guestCanReport ?? false)...[
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.reportSeller, arguments: {
                            "sellerId": widget.sellerId,
                            "model": widget.storeProfileMpModel.reportData,
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.flag,
                              size: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                Utils.getStringValue(
                                    context, widget.storeProfileMpModel.reportData?.sellerReportLabel ?? "") ??
                                    "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )
                    ] else if(appStoragePref.isLoggedIn() ?? false)...[
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.reportSeller, arguments: {
                            "sellerId": widget.sellerId,
                            "model": widget.storeProfileMpModel.reportData,
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.flag,
                              size: 20,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                Utils.getStringValue(
                                    context, widget.storeProfileMpModel.reportData?.sellerReportLabel ?? "") ??
                                    "",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      )
                    ]
                  ],

                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible:
                              widget.storeProfileMpModel.isFacebookActive ??
                                  false,
                          child: InkWell(
                            onTap: () async {
                              var username =
                                  widget.storeProfileMpModel.facebookId;
                              var profileUrl =
                                  'https://www.facebook.com/$username';
                              await launch(profileUrl);
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  MpStaticImages.iconFacebook,
                                )),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Visibility(
                          visible: widget.storeProfileMpModel.isTwitterActive ??
                              false,
                          child: InkWell(
                            onTap: () async {
                              var username =
                                  widget.storeProfileMpModel.twitterId;
                              var profileUrl =
                                  'https://www.twitter.com/$username';
                              await launch(profileUrl);
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  MpStaticImages.iconTwitter,
                                )),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Visibility(
                          visible:
                              widget.storeProfileMpModel.isInstagramActive ??
                                  false,
                          child: InkWell(
                            onTap: () async {
                              var username =
                                  widget.storeProfileMpModel.instagramId;
                              var profileUrl =
                                  'https://www.instagram.com/$username';
                              await launch(profileUrl);
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  MpStaticImages.iconInstagram,
                                )),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Visibility(
                          visible:
                              widget.storeProfileMpModel.isPinterestActive ??
                                  false,
                          child: InkWell(
                            onTap: () async {
                              var username =
                                  widget.storeProfileMpModel.pinterestId;
                              var profileUrl =
                                  'https://www.pinterest.com/$username';
                              await launch(profileUrl);
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  MpStaticImages.iconPinterest,
                                )),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Visibility(
                          visible: widget.storeProfileMpModel.isVimeoActive ??
                              false,
                          child: InkWell(
                            onTap: () async {
                              var username =
                                  widget.storeProfileMpModel.vimeoId;
                              var profileUrl =
                                  'https://venmo.com/$username';
                              await launch(profileUrl);
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  MpStaticImages.iconVemo,
                                  fit: BoxFit.fill,
                                )),
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Visibility(
                          visible: widget.storeProfileMpModel.isYoutubeActive ??
                              false,
                          child: InkWell(
                            onTap: () async {
                              var username =
                                  widget.storeProfileMpModel.youtubeId;
                              var profileUrl =
                                  'https://www.youtube.com/$username';
                              await launch(profileUrl);
                            },
                            child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Image.asset(
                                  MpStaticImages.iconYoutube,
                                  fit: BoxFit.fill,
                                )),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
