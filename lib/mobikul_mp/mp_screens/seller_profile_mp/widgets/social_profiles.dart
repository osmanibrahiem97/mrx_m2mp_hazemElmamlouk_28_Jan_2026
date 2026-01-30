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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_switch_button.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_state.dart';

class SocialProfiles extends StatefulWidget {
  const SocialProfiles({Key? key}) : super(key: key);

  @override
  State<SocialProfiles> createState() => _SocialProfilesState();
}

class _SocialProfilesState extends State<SocialProfiles> {
  ///TextFieldController
  TextEditingController fbLinkController = TextEditingController();
  TextEditingController twitterLinkController = TextEditingController();
  TextEditingController instagramLinkController = TextEditingController();
  TextEditingController youtubeLinkController = TextEditingController();
  TextEditingController vimeoLinkController = TextEditingController();
  TextEditingController pinterestLinkController = TextEditingController();

  late SellerProfileMpModel sellerProfileMpModel;
  late SellerProfileMpBloc sellerProfileMpBloc;

  void toggleSwitch(bool value, isEnable) {
    if (isEnable == false) {
      setState(() {
        isEnable = true;
      });
    } else {
      setState(() {
        isEnable = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sellerProfileMpBloc = context.read<SellerProfileMpBloc>();
    sellerProfileMpBloc.add(const SellerProfileMpFetchEvent());
    sellerProfileMpModel = SellerProfileMpModel();
    sellerProfileMpBloc = SellerProfileMpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProfileMpBloc, SellerProfileMpState>(
        builder: (context, currentState) {
      if (currentState is SellerProfileMpInitial) {
      } else if (currentState is SellerProfileMpSuccess) {
        sellerProfileMpModel = currentState.sellerProfileMpModel;
        fbLinkController.text = sellerProfileMpModel.facebookId ?? '';
        twitterLinkController.text = sellerProfileMpModel.twitterId ?? '';
        instagramLinkController.text = sellerProfileMpModel.instagramId ?? '';
        youtubeLinkController.text = sellerProfileMpModel.youtubeId ?? '';
        vimeoLinkController.text = sellerProfileMpModel.vimeoId ?? '';
        pinterestLinkController.text = sellerProfileMpModel.pinterestId ?? '';
      } else if (currentState is SellerProfileMpError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return Container(
        color: Theme.of(context).cardColor,
        child: ExpansionTile(
            initiallyExpanded: false,
            title: Text(
                Utils.getStringValue(context, MpStringConstants.socialProfiles)
                        .toUpperCase() ??
                    '',
                style: Theme.of(context).textTheme.titleLarge),
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///FaceBook
                      Text(
                        Utils.getStringValue(
                            context, MpStringConstants.faceBook),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSwitchButton(
                        Utils.getStringValue(
                            context, MpStringConstants.activated),
                        (bool isOn) {
                          if (kDebugMode) {
                            print('isFaceBookEnable');
                            print(isOn);
                            print(sellerProfileMpModel.isFacebookActive);
                          }
                          setState(() {
                            sellerProfileMpModel.isFacebookActive = isOn;
                          });
                        },
                        sellerProfileMpModel.isFacebookActive ?? false,
                        isFromPaymentInfo: false,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: fbLinkController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.profileLink),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),

                      ///Twitter
                      Text(
                        Utils.getStringValue(
                            context, MpStringConstants.twitter),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSwitchButton(
                        Utils.getStringValue(
                            context, MpStringConstants.activated),
                        (bool isOn) {
                          if (kDebugMode) {
                            print('isTwitterEnable');
                            print(isOn);
                            print(sellerProfileMpModel.isTwitterActive);
                          }
                          setState(() {
                            sellerProfileMpModel.isTwitterActive = isOn;
                          });
                        },
                        sellerProfileMpModel.isTwitterActive ?? false,
                        isFromPaymentInfo: false,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: instagramLinkController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.profileLink),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),

                      ///Instagram
                      Text(
                        Utils.getStringValue(
                            context, MpStringConstants.instagram),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSwitchButton(
                        Utils.getStringValue(
                            context, MpStringConstants.activated),
                        (bool isOn) {
                          if (kDebugMode) {
                            print('isInstagramEnable');
                            print(isOn);
                            print(sellerProfileMpModel.isInstagramActive);
                          }
                          setState(() {
                            sellerProfileMpModel.isInstagramActive = isOn;
                          });
                        },
                        sellerProfileMpModel.isInstagramActive ?? false,
                        isFromPaymentInfo: false,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: instagramLinkController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.profileLink),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),

                      ///Youtube
                      Text(
                        Utils.getStringValue(context, MpStringConstants.vimeo),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSwitchButton(
                        Utils.getStringValue(
                            context, MpStringConstants.activated),
                        (bool isOn) {
                          if (kDebugMode) {
                            print('isVimeoEnable');
                            print(isOn);
                            print(sellerProfileMpModel.isInstagramActive);
                          }
                          setState(() {
                            sellerProfileMpModel.isInstagramActive = isOn;
                          });
                        },
                        sellerProfileMpModel.isInstagramActive ?? false,
                        isFromPaymentInfo: false,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: vimeoLinkController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.profileLink),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),

                      ///Pinterest
                      Text(
                        Utils.getStringValue(
                            context, MpStringConstants.pinterest),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      AppSwitchButton(
                        Utils.getStringValue(
                            context, MpStringConstants.activated),
                        (bool isOn) {
                          if (kDebugMode) {
                            print('isPinterestEnable');
                            print(isOn);
                            print(sellerProfileMpModel.isPinterestActive);
                          }
                          setState(() {
                            sellerProfileMpModel.isPinterestActive = isOn;
                          });
                        },
                        sellerProfileMpModel.isPinterestActive ?? false,
                        isFromPaymentInfo: false,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: pinterestLinkController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.profileLink),
                      ),
                    ]),
              )
            ]),
      );
    });
  }
}
