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
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_dialog_helper.dart';
import 'package:test_new/mobikul/app_widgets/app_switch_button.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/country_list_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/widgets/seller_profile_save_request.dart';

import '../../../mobikul/helper/app_storage_pref.dart';

class SellerProfileMpScreen extends StatefulWidget {
  const SellerProfileMpScreen({Key? key}) : super(key: key);

  @override
  State<SellerProfileMpScreen> createState() => _SellerProfileMpScreenState();
}

class _SellerProfileMpScreenState extends State<SellerProfileMpScreen> {
  late SellerProfileMpModel sellerProfileMpModel;
  late SellerProfileMpBloc sellerProfileBloc;

  /// To show the loader while data will be load
  bool isLoading = false;

  /// Variable initialized to store the country list coming from api
  List<CountryListMpModel> countryListData = [];

  /// fromKey to validate the forms
  final _formKey = GlobalKey<FormState>();

  /// send the final data as map on the server
  SellerProfileSaveRequestModel? sellerProfileSaveRequestModel;

  /// TextFieldController
  TextEditingController shopTitleController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController taxOrVatNumberController = TextEditingController();
  TextEditingController shopLocalityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController fbLinkController = TextEditingController();
  TextEditingController twitterLinkController = TextEditingController();
  TextEditingController instagramLinkController = TextEditingController();
  TextEditingController youtubeLinkController = TextEditingController();
  TextEditingController vimeoLinkController = TextEditingController();
  TextEditingController pinterestLinkController = TextEditingController();
  TextEditingController googlePlusIdController = TextEditingController();
  TextEditingController metaKeywordController = TextEditingController();
  TextEditingController metaDescriptionController = TextEditingController();
  TextEditingController paymentDetailController = TextEditingController();
  TextEditingController returnPolicyController = TextEditingController();
  TextEditingController shippingPolicyController = TextEditingController();
  TextEditingController privacyPolicyController = TextEditingController();

  /// Choose Country
  String? selectedCountry;
  List<dynamic> countryList = [];
  String? selectedCountryName = "";

  /// ColorPicker
  Color currentColor = Colors.white;
  String? colorCode;

  /// UploadBannerAndImage
  String? bannerEncoded;
  String? bannerName;
  SellerProfileMpModel? imageModel;

  /// Upload Cover Banner and Logo
  String? bannerImage;
  String? profileImage;
  String? countryFlagImage;
  File? pickedBannerImage;
  File? pickedProfileImage;
  final ImagePicker _picker = ImagePicker();

  /// TOGGLE SWITCH
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
    /// Initially used to get the seller profile data
    sellerProfileBloc = context.read<SellerProfileMpBloc>();
    sellerProfileBloc.add(SellerProfileMpFetchEvent());
    isLoading = true;

    /// Initialization the model and bloc
    sellerProfileMpModel = SellerProfileMpModel();

    print("TEST LOG ::: SelectedCountryName => $selectedCountryName");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProfileMpBloc, SellerProfileMpState>(
        builder: (BuildContext context, SellerProfileMpState currentState) {
          if (currentState is SellerProfileMpInitial) {
            isLoading = true;
          } else if (currentState is SellerProfileMpSuccess) {
            isLoading = false;
            sellerProfileMpModel = currentState.sellerProfileMpModel;
            _setUpFormData();
            sellerProfileBloc.emit(SellerProfileMpEmptyState());
          } else if (currentState is AddImageState) {
            isLoading = false;
            imageModel = currentState.model;
            if (currentState.model?.success ?? false) {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                setState(() {
                  // var data = appStoragePref.getUserData();
                  if (currentState.type == AppConstant.profileImage) {
                    // data?.profileImage = imageModel?.url;
                    profileImage = imageModel?.url;
                  } else {
                    // data?.bannerImage = imageModel?.url;
                    bannerImage = imageModel?.url;
                  }

                  // appStoragePref.setUserData(data);
                });
                AlertMessage.showSuccess(
                    currentState.model?.message ?? '', context);
              });
            } else {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showError(currentState.model?.message ?? '', context);
              });
            }

            sellerProfileBloc.emit(SellerProfileMpEmptyState());
          } else if (currentState is DeleteImageState) {
            isLoading = false;

            if (currentState.model?.success ?? false) {
              var data = appStoragePref.getUserData();
              if (currentState.type == "1") {
                data?.profileImage = "";
                profileImage = "";
              } else {
                data?.bannerImage = "";
                bannerImage = "";
              }
              appStoragePref.setUserData(data);
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showSuccess(
                    currentState.model?.message ?? '', context);
              });
            } else {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showError(currentState.model?.message ?? '', context);
              });
            }
            sellerProfileBloc.emit(SellerProfileMpEmptyState());
          } else if (currentState is SellerProfileSaveRequestState) {
            isLoading = false;
            if (currentState.baseModel.success ?? false) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showSuccess(
                    currentState.baseModel.message ?? '', context);
              });
              // Navigator.pop(context);
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AlertMessage.showError(
                    currentState.baseModel.message ?? '', context);
              });
            }
            sellerProfileBloc.emit(SellerProfileMpEmptyState());
          } else if (currentState is SellerProfileMpError) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message, context);
            });
            sellerProfileBloc.emit(SellerProfileMpEmptyState());
          }
          return Scaffold(
              appBar: commonAppBar(
                  Utils.getStringValue(context, MpStringConstants.sellerProfile),
                  context),
              body: (sellerProfileMpModel != null) ? _buildUI(context) : Loader());
        });
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: sellerProfileMpModel != null,
          child: SingleChildScrollView(
            child: Column(children: [
              _basicDetail(),
              const SizedBox(
                height: 15.0,
              ),
              _imageTheme(),
              const SizedBox(
                height: 15.0,
              ),
              // ImageAndTheme((image, type) {
              //   print("TEST_LOG ==profile=> ${type}");
              //   sellerProfileMpBloc?.add(AddImageEvent(image, type));
              // }, (image) {
              //   print("TEST_LOG ==profile=> ${image}");
              //   sellerProfileMpBloc?.add(DeleteProfileEvent(image));
              // }, sellerProfileMpModel),
              _socialProfiles(),
              const SizedBox(
                height: 15.0,
              ),
              _seo(),
              const SizedBox(
                height: 15.0,
              ),
              _paymentMethod(),
              const SizedBox(
                height: 15.0,
              ),
              Visibility(
                visible: sellerProfileMpModel.isSellerPolicyEnabled ?? true,
                child: _policies(),
              ),
              const SizedBox(
                height: 15.0,
              ),
              _saveButton(),
              const SizedBox(
                height: 15.0,
              ),
            ]),
          ),
        ),
        Visibility(
          child: const Loader(),
          visible: isLoading,
        ),
      ],
    );
  }

  ///SET UP FORM DATA
  _setUpFormData() {
    shopTitleController.text = sellerProfileMpModel.shopTitle ?? '';
    contactNoController.text = sellerProfileMpModel.contactNumber ?? '';
    taxOrVatNumberController.text = sellerProfileMpModel.taxvat ?? '';
    shopLocalityController.text = sellerProfileMpModel.companyLocality ?? '';
    descriptionController = TextEditingController(text:sellerProfileMpModel.companyDescription ?? '');
    // descriptionController.text =
    //     Utils.parseHtmlString(sellerProfileMpModel.companyDescription ?? '');
    countryList = sellerProfileMpModel.countryList ?? [];
    fbLinkController.text = sellerProfileMpModel.facebookId ?? '';
    twitterLinkController.text = sellerProfileMpModel.twitterId ?? '';
    instagramLinkController.text = sellerProfileMpModel.instagramId ?? '';
    youtubeLinkController.text = sellerProfileMpModel.youtubeId ?? '';
    vimeoLinkController.text = sellerProfileMpModel.vimeoId ?? '';
    pinterestLinkController.text = sellerProfileMpModel.pinterestId ?? '';
    metaKeywordController.text = sellerProfileMpModel.metaKeyword ?? '';
    metaDescriptionController.text = sellerProfileMpModel.metaDescription ?? '';
    paymentDetailController.text = sellerProfileMpModel.paymentDetails ?? '';
    returnPolicyController.text = sellerProfileMpModel.returnPolicy ?? '';
    shippingPolicyController.text = sellerProfileMpModel.shippingPolicy ?? '';
    privacyPolicyController.text = sellerProfileMpModel.privacyPolicy ?? '';
    bannerImage = sellerProfileMpModel?.bannerImage;
    profileImage = sellerProfileMpModel?.profileImage;

    if ((sellerProfileMpModel.backgroundColor ?? "").isNotEmpty ) {

//Removes everything after first '.'
      String result = sellerProfileMpModel.backgroundColor!.substring(1, sellerProfileMpModel.backgroundColor!.length).toUpperCase();
      String finalColorCode =  "$result";
      // print("Final Color code is $result    $finalColorCode");

      colorCode = finalColorCode;
      currentColor = Color(int.parse(colorCode ?? "0XFFFFFF",radix: 16));
    }


    if ((sellerProfileMpModel.country ?? "").isNotEmpty &&
        (selectedCountry ?? "").isEmpty) {
      selectedCountry = sellerProfileMpModel.country;
      var country = sellerProfileMpModel?.getCountryById(selectedCountry);
      selectedCountryName = country?.label ?? '';

      countryFlagImage =
      "${sellerProfileMpModel.flagImageUrl}/${sellerProfileMpModel.country.toString()}.png";
    }
  }

  ///BASIC DETAIL
  _basicDetail() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.basicDetail)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      isPassword: false,
                      controller: shopTitleController,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.shopTitle),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    AppTextField(
                      isPassword: false,
                      controller: contactNoController,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.contactNumber),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    AppTextField(
                      isPassword: false,
                      controller: taxOrVatNumberController,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.taxOrVatNumber),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    AppTextField(
                      isPassword: false,
                      controller: shopLocalityController,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.shopLocality),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      Utils.getStringValue(context, MpStringConstants.country_),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButtonFormField<String>(
                            // value: selectedCountryName,
                            borderRadius: BorderRadius.circular(5.0),
                            decoration: InputDecoration(
                              hintText: selectedCountryName ?? '',
                              hintStyle: Theme.of(context).textTheme.titleLarge,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            onChanged: (value) {
                              // setState(() {
                              //   selectedCountry = value!;
                              // });
                            },
                            iconEnabledColor: Colors.grey,
                            iconDisabledColor: Colors.grey,
                            items: countryList
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                value: item.label.toString(),
                                child: Text(
                                    item.label == ""
                                        ? selectedCountryName
                                        : item.label,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                onTap: () {
                                  setState(() {
                                    selectedCountryName = item.label;
                                    selectedCountry = item.value;

                                    countryFlagImage =
                                    "${sellerProfileMpModel.flagImageUrl}/${selectedCountry.toString()}.png";
                                  });
                                },
                              ),
                            )
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                return Utils.getStringValue(
                                    context, AppStringConstant.required);
                                // add validation with return statement
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                        height: AppSizes.deviceWidth / 4,
                        width: AppSizes.deviceWidth / 3.5,
                        child: ImageView(
                          isBottomPadding: false,
                          fit: BoxFit.fill,
                          url: countryFlagImage,
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.description),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                      ),
                    ),
                  ]),
            )
          ]),
    );
  }

  ///IMAGE&THEME
  _imageTheme() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
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
                    Visibility(
                      visible:
                      sellerProfileMpModel.isColorPickerEnabled ?? true,
                      child: Text(
                        Utils.getStringValue(
                            context, MpStringConstants.backgroundColor),
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Visibility(
                      visible:
                      sellerProfileMpModel.isColorPickerEnabled ?? true,
                      child: const SizedBox(
                        height: 10.0,
                      ),
                    ),
                    Visibility(
                      visible:
                      sellerProfileMpModel.isColorPickerEnabled ?? true,
                      child: Row(
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
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible:
                      sellerProfileMpModel.isColorPickerEnabled ?? true,
                      child: const SizedBox(
                        height: 15.0,
                      ),
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
                              _showChoiceBottomSheet(
                                context,
                                false,
                                    (image, type) {
                                  sellerProfileBloc
                                      .add(AddImageEvent(image, type));
                                },
                              );
                            });
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 1,
                            child: Card(
                                elevation: 5,
                                child: ImageView(
                                  url: bannerImage ?? "",
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
                                      sellerProfileBloc
                                          ?.add(const DeleteProfileEvent('0'));
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
                              _showChoiceBottomSheet(
                                context,
                                true,
                                    (image, type) {
                                  sellerProfileBloc
                                      .add(AddImageEvent(image, type));
                                },
                              );
                            });
                          },
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width / 5,
                            width: MediaQuery.of(context).size.width / 5,
                            child: ImageView(
                              width: MediaQuery.of(context).size.width / 1,
                              isBottomPadding: false,
                              fit: BoxFit.fitWidth,
                              url: profileImage ?? "",
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
                                  onConfirm: () {
                                    sellerProfileBloc
                                        .add(DeleteProfileEvent('1'));
                                  },
                                  title: Utils.getStringValue(
                                      context, MpStringConstants.removeLogo),
                                );
                              },
                              child: const Icon(
                                Icons.highlight_remove_outlined,
                                size: 20,
                                color: Colors.red,
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

  ///SOCIAL PROFILES

  ///CHOOSE COVER BANNER
  void _showChoiceBottomSheet(
      BuildContext context, bool uploadProfile, addImageCallback) {
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
                  isLoading = true;
                  Navigator.of(context).pop();
                  _openGallery(context, uploadProfile, addImageCallback);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(
                  Utils.getStringValue(context, AppStringConstant.camera),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  isLoading = true;
                  Navigator.of(context).pop();
                  _openCamera(context, uploadProfile, addImageCallback);
                },
              )
            ],
          );
        });
    //Navigator.pop(context);
  }

  void _openCamera(
      BuildContext context, bool uploadProfile, addImageCallback) async {
    // Navigator.of(context).pop;
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: uploadProfile ? 500 : 900,
        maxHeight: uploadProfile ? 500 : 600,
        imageQuality: 60,
        requestFullMetadata: true
    );
    setState(() {
      if (uploadProfile) {
        pickedProfileImage = File(photo?.path ?? "");
        final bytes = pickedProfileImage?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        addImageCallback!(img64, AppConstant.profileImage);
      } else {
        pickedBannerImage = File(photo?.path ?? "");
        final bytes = pickedBannerImage?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        addImageCallback!(img64, AppConstant.userBannerImage);
      }
    });
  }

  void _openGallery(
      BuildContext context, bool uploadProfile, addImageCallback) async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: uploadProfile ? 500 : 900,
        maxHeight: uploadProfile ? 500 : 600,
        imageQuality: 60
    );
    setState(() {
      // Navigator.of(context).pop();
      if (uploadProfile) {
        pickedProfileImage = File(image?.path ?? "");
        final bytes = pickedProfileImage?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        addImageCallback!(img64, AppConstant.profileImage);
      } else {
        pickedBannerImage = File(image?.path ?? "");
        final bytes = pickedBannerImage?.readAsBytesSync();
        String img64 = base64Encode(bytes!);
        addImageCallback!(img64, AppConstant.userBannerImage);
      }
    });
  }

  Widget optionTile(String title, VoidCallback? addAction) {
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
                style: Theme.of(context).textTheme.titleLarge,
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

  ///SOCIAL PROFILES
  _socialProfiles() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
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
                      Utils.getStringValue(context, MpStringConstants.faceBook),
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
                      Utils.getStringValue(context, MpStringConstants.twitter),
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
                      controller: twitterLinkController,
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
                      Utils.getStringValue(
                          context, MpStringConstants.youtube),
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
                          print(sellerProfileMpModel.isYoutubeActive);
                        }
                        setState(() {
                          sellerProfileMpModel.isYoutubeActive = isOn;
                        });
                      },
                      sellerProfileMpModel.isYoutubeActive ?? false,
                      isFromPaymentInfo: false,
                    ),
                    AppTextField(
                      isPassword: false,
                      controller: youtubeLinkController,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.profileLink),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
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
                          print(sellerProfileMpModel.isVimeoActive);
                        }
                        setState(() {
                          sellerProfileMpModel.isVimeoActive = isOn;
                        });
                      },
                      sellerProfileMpModel.isVimeoActive ?? false,
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
  }

  ///SEO
  _seo() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.seo)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: metaKeywordController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.metaKeyword),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Utils.getStringValue(
                                context, MpStringConstants.metaKeywordErrorMsg);
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: metaDescriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.metaDescription),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                      ),
                    ),
                  ]),
            )
          ]),
    );
  }

  ///PAYMENT METHOD
  _paymentMethod() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.paymentInfo)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: paymentDetailController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 10,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.metaKeyword),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return Utils.getStringValue(context,
                        //         MpStringConstants.metaKeywordErrorMsg);
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ]),
            )
          ]),
    );
  }

  ///POLICIES
  _policies() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.policies)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSizes.deviceHeight / 3,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: returnPolicyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.returnPolicy),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return Utils.getStringValue(context,
                        //         MpStringConstants.metaKeywordErrorMsg);
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: AppSizes.deviceHeight / 3,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: shippingPolicyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.shippingPolicy),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: AppSizes.deviceHeight / 3,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: privacyPolicyController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.privacyPolicy),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                      ),
                    ),
                  ]),
            )
          ]),
    );
  }

  ///SAVE BUTTON
  _saveButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: AppSizes.genericButtonHeight,
        child: ElevatedButton(
            onPressed: () async {
              var validate = _formKey.currentState?.validate();
              String description = descriptionController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');
              String metaKeyword = metaKeywordController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');
              String metaDescription = metaDescriptionController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');
              String paymentDetails = paymentDetailController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');
              String returnPolicy = returnPolicyController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');
              String pricyPolicy = privacyPolicyController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');
              String shippingPolicy = shippingPolicyController.text
                  .replaceAll('\r', '')
                  .replaceAll(r'\', r'\\')
                  .replaceAll('"', r'\"')
                  .replaceAll('\n', '\\n');

              sellerProfileBloc.add(SellerProfileSaveRequestEvent(
                  sellerProfileSaveRequestModel = SellerProfileSaveRequestModel(
                    storeId: appStoragePref.getStoreId(),
                    customerToken: appStoragePref.getCustomerToken(),
                    twActive: sellerProfileMpModel.isTwitterActive ?? false,
                    twitterId: twitterLinkController.text ?? "",
                    fbActive: sellerProfileMpModel.isFacebookActive ?? false,
                    facebookId: fbLinkController.text ?? "",
                    instagramActive:
                    sellerProfileMpModel.isInstagramActive ?? false,
                    instagramId: instagramLinkController.text ?? "",
                    gplusActive: sellerProfileMpModel.isgoogleplusActive ?? false,
                    gplusId: googlePlusIdController.text ?? "",
                    backgroundColor: '#${colorCode ?? "ffffff"}',
                    companyLocality: shopLocalityController.text.toString(),
                    companyDescription:description.replaceAll('"', ' ').toString(),
                    pinterestId: pinterestLinkController.text.toString(),
                    country: selectedCountry,
                    shopTitle: shopTitleController.text.toString(),
                    vimeoId: vimeoLinkController.text ?? "",
                    youtubeId: youtubeLinkController.text.toString(),
                    privacyPolicy: pricyPolicy.toString().replaceAll('"', ' ') ?? '',
                    shippingPolicy: shippingPolicy.toString().replaceAll('"', ' ') ?? '',
                    returnPolicy: returnPolicy.toString().replaceAll('"', ' ') ?? '',
                    paymentDetails: paymentDetails.toString().replaceAll('"', ' ') ?? '',
                    metaKeyword:metaKeyword.replaceAll('"', ' ').toString(),
                    metaDescription: metaDescription.replaceAll('"', ' ') ?? '',
                    contactNumber: contactNoController.text.toString(),
                    taxvat: taxOrVatNumberController.text.toString(),
                    banner: bannerImage ?? "",
                    pinterestActive:
                    sellerProfileMpModel.isPinterestActive ?? false,
                    profileLogo: profileImage ?? "",
                    vimeoActive:sellerProfileMpModel.isVimeoActive ?? false,
                    // sellerProfileMpModel.isMPDeliveryBoyEnabled ?? false,
                    youtubeActive: sellerProfileMpModel.isYoutubeActive ?? false,
                  )));
              if (kDebugMode) {
                print(
                    'TEST LOG ::: customerToken => ${sellerProfileSaveRequestModel?.customerToken}');
                print(
                    'TEST LOG ::: storeId => ${sellerProfileSaveRequestModel?.storeId}');
                print(
                    'TEST LOG ::: taxvat => ${sellerProfileSaveRequestModel?.taxvat}');
                print(
                    'TEST LOG ::: gplusId => ${sellerProfileSaveRequestModel?.gplusId}');
                print(
                    'TEST LOG ::: country => ${sellerProfileSaveRequestModel?.country}');
                print(
                    'TEST LOG ::: vimeoID => ${sellerProfileSaveRequestModel?.vimeoId}');
                print(
                    'TEST LOG ::: twActive => ${sellerProfileSaveRequestModel?.twActive}');
                print(
                    'TEST LOG ::: fbActive => ${sellerProfileSaveRequestModel?.fbActive}');
                print(
                    'TEST LOG ::: twitterId => ${sellerProfileSaveRequestModel?.twitterId}');
                print(
                    'TEST LOG ::: youtubeId => ${sellerProfileSaveRequestModel?.youtubeId}');
                print(
                    'TEST LOG ::: shopTitle => ${sellerProfileSaveRequestModel?.shopTitle}');
                print(
                    'TEST LOG ::: facebookId => ${sellerProfileSaveRequestModel?.facebookId}');
                print(
                    'TEST LOG ::: instaId => ${sellerProfileSaveRequestModel?.instagramId}');
                print(
                    'TEST LOG ::: pintrestId => ${sellerProfileSaveRequestModel?.pinterestId}');
                print(
                    'TEST LOG ::: metaKeyword => ${sellerProfileSaveRequestModel?.metaKeyword}');
                print(
                    'TEST LOG ::: gplusActive => ${sellerProfileSaveRequestModel?.gplusActive}');
                print(
                    'TEST LOG ::: vimeoActive => ${sellerProfileSaveRequestModel?.vimeoActive}');
                print(
                    'TEST LOG ::: returnPolicy => ${sellerProfileSaveRequestModel?.returnPolicy}');
                print(
                    'TEST LOG ::: contactNumber => ${sellerProfileSaveRequestModel?.contactNumber}');
                print(
                    'TEST LOG ::: youtubeActive => ${sellerProfileSaveRequestModel?.youtubeActive}');
                print(
                    'TEST LOG ::: shippingPolicy => ${sellerProfileSaveRequestModel?.shippingPolicy}');
                print(
                    'TEST LOG ::: privacyPolicy => ${sellerProfileSaveRequestModel?.privacyPolicy}');
                print(
                    'TEST LOG ::: paymentDetails => ${sellerProfileSaveRequestModel?.paymentDetails}');
                print(
                    'TEST LOG ::: companyLocality => ${sellerProfileSaveRequestModel?.companyLocality}');
                print(
                    'TEST LOG ::: backgroundColor => ${sellerProfileSaveRequestModel?.backgroundColor}');
                print(
                    'TEST LOG ::: metaDescription => ${sellerProfileSaveRequestModel?.metaDescription}');
                print(
                    'TEST LOG ::: instagramActive => ${sellerProfileSaveRequestModel?.instagramActive}');
                print(
                    'TEST LOG ::: pinterestActive => ${sellerProfileSaveRequestModel?.pinterestActive}');
                print(
                    'TEST LOG ::: companyDescription => ${sellerProfileSaveRequestModel?.companyDescription}');
              }
            },
            child: Center(
              child: Text(
                  Utils.getStringValue(context, MpStringConstants.saveProfile)
                      .toUpperCase() ??
                      '',
                  style: TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color)),
            )),
      ),
    );
  }
}
