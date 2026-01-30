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

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_dialog_helper.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_state.dart';

class ImageAndTheme extends StatefulWidget {
  Function(String, String)? addImageCallback;
  Function(String)? deleteImageCallBack;
  SellerProfileMpModel sellerProfileMpModel;

  ImageAndTheme(this.addImageCallback, this.deleteImageCallBack,
      this.sellerProfileMpModel,
      {Key? key})
      : super(key: key);
  @override
  State<ImageAndTheme> createState() => _ImageAndThemeState();
}

class _ImageAndThemeState extends State<ImageAndTheme> {
  ///ColorPicker
  Color currentColor = Colors.white;
  var colorCode;

  ///CHOOSE COVER BANNER
  String? coverBanner;
  File? pickedCoverBanner;
  final ImagePicker _picker = ImagePicker();

  ///CHOOSE LOGO
  String? logo;
  File? pickedLogo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    coverBanner = widget.sellerProfileMpModel.bannerImage ?? '';
    logo = widget.sellerProfileMpModel.profileImage ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: false,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.imagesAndTheme)
                      .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getStringValue(
                          context, MpStringConstants.backgroundColor),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: AppSizes.deviceWidth / 3,
                              child: Card(
                                elevation: 5,
                                color: currentColor,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                                ' Selected Color :  ${currentColor.value.toRadixString(16)}'),
                          ],
                        ),
                        InkWell(
                          onTap: openColorPicker,
                          child: Text(
                            Utils.getStringValue(
                                    context, MpStringConstants.changeColor)
                                .toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      Utils.getStringValue(
                          context, MpStringConstants.coverBanner),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _showChoiceBottomSheet(context, false);
                            });
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 1,
                            child: Card(
                                elevation: 5,
                                child: ImageView(
                                  url: coverBanner ?? "",
                                  isBottomPadding: false,
                                )),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                                onPressed: () {
                                  AppDialogHelper.confirmationDialog(
                                    Utils.getStringValue(
                                        context,
                                        MpStringConstants
                                            .removeCoverBannerAlert),
                                    context,
                                    AppLocalizations.of(context),
                                    onConfirm: () {
                                      // widget.sellerProfileMpModel?.add(
                                      //     DeleteProfileEvent("coverBanner"));
                                    },
                                    title: Utils.getStringValue(context,
                                        MpStringConstants.removeCoverBanner),
                                  );
                                },
                                icon: const Icon(
                                  Icons.highlight_remove_outlined,
                                  color: Colors.red,
                                )))
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      Utils.getStringValue(context, MpStringConstants.logo),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _showChoiceBottomSheet(context, true);
                            });
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width / 5,
                            width: MediaQuery.of(context).size.width / 5,
                            child: ImageView(
                              width: MediaQuery.of(context).size.width / 1,
                              isBottomPadding: false,
                              fit: BoxFit.fitWidth,
                              url: logo ?? "",
                            ),
                          ),
                        ),
                        Positioned(
                            right: 2,
                            top: 2,
                            child: InkWell(
                              onTap: () {
                                AppDialogHelper.confirmationDialog(
                                  Utils.getStringValue(context,
                                      MpStringConstants.removeLogoAlert),
                                  context,
                                  AppLocalizations.of(context),
                                  onConfirm: () async {
                                    // bloc.emit(WishlistActionState());
                                    // bloc.add(
                                    //     RemoveItemEvent(items?[index].id ?? "0"));
                                    // bloc?.add(const WishlistDataFetchEvent(0));
                                    // Utils.hideSoftKeyBoard();
                                    // bloc?.add(RemoveItemEvent());
                                  },
                                  title: Utils.getStringValue(
                                      context, MpStringConstants.removeLogo),
                                );
                              },
                              child: const Icon(
                                Icons.highlight_remove_outlined,
                                size: 20,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ]),
            )
          ]),
    );
  }

  ///CHOOSE COVER BANNER
  void _showChoiceBottomSheet(BuildContext context, bool uploadProfile) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 17, 0, 10),
                child: Text(
                  Utils.getStringValue(context, AppStringConstant.chooseOption),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.folder),
                title: Text(
                    Utils.getStringValue(context, AppStringConstant.gallery),
                    style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  _openGallery(context, uploadProfile);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(
                  Utils.getStringValue(context, AppStringConstant.camera),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  _openCamera(context, uploadProfile);
                },
              )
            ],
          );
        });
    //Navigator.pop(context);
  }

  void _openCamera(BuildContext context, bool uploadProfile) async {
    Navigator.of(context).pop;
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      Navigator.of(context).pop();
      if (uploadProfile) {
        // profileFromNetwork = false;
        pickedLogo = File(photo?.path ?? "");
        final bytes = pickedLogo?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        widget.addImageCallback!(img64, AppConstant.profileImage);
      } else {
        // bannerFromNetwork = false;
        pickedCoverBanner = File(photo?.path ?? "");
        final bytes = pickedCoverBanner?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        widget.addImageCallback!(img64, AppConstant.userBannerImage);
      }
    });
  }

  void _openGallery(BuildContext context, bool uploadProfile) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (uploadProfile) {
        pickedLogo = File(image?.path ?? "");
        final bytes = pickedLogo?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        widget.addImageCallback!(img64, AppConstant.profileImage);
      } else {
        pickedCoverBanner = File(image?.path ?? "");
        final bytes = pickedCoverBanner?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        widget.addImageCallback!(img64, AppConstant.userBannerImage);
      }

      Navigator.of(context).pop();
    });
  }

  Widget optionTile(
      String title, VoidCallback? addAction, BuildContext context) {
    return GestureDetector(
      onTap: addAction,
      child: SizedBox(
          height: AppSizes.itemHeight,
          width: AppSizes.deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider()
            ],
          )),
    );
  }

  ///ColorPicker
  void openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: MaterialColorPicker(
              selectedColor: currentColor,
              onColorChange: (color) {
                setState(() {
                  currentColor = color;
                });
              },
              onMainColorChange: (color) {
                setState(() {
                  currentColor = color!;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                'OK',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  colorCode = currentColor.value.toRadixString(16);
                });
                if (kDebugMode) {
                  print("This is the color code we choose ::: $colorCode");
                }
              },
            ),
          ],
        );
      },
    );
  }
}
