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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/all_sellers/all_sellers_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/all_sellers_bloc/all_sellers_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/all_sellers_bloc/all_sellers_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/all_sellers_bloc/all_selllers_event.dart';

import '../../../../../main.dart';
import '../../../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../../../mobikul/app_widgets/app_outlined_button.dart';
import '../../../../../mobikul/constants/app_routes.dart';
import '../../../../../mobikul/constants/app_string_constant.dart';
import '../../../../../mobikul/constants/arguments_map.dart';
import '../../../../../mobikul/helper/app_localizations.dart';
import '../../../../../mobikul/helper/app_storage_pref.dart';
import '../../../../mp_constants/mp_arguments_map.dart';

class AllSellersView extends StatefulWidget {
  const AllSellersView({Key? key}) : super(key: key);

  @override
  State<AllSellersView> createState() => _AllSellersViewState();
}

class _AllSellersViewState extends State<AllSellersView> {
  late AllSellersBloc allSellersBloc;
  bool isLoading = false;
  late AllSellersModel allSellersModel;
  String searchQuery = '';
  TextEditingController searchQueryController = TextEditingController();

  @override
  void initState() {
    allSellersBloc = context.read<AllSellersBloc>();
    allSellersBloc.add(AllSellersFetchEvent(searchQuery));
    allSellersModel = AllSellersModel();
    allSellersBloc = AllSellersBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllSellersBloc, AllSellersState>(
        builder: (context, currentState) {
      if (currentState is AllSellersInitial) {
        isLoading = true;
      } else if (currentState is AllSellersSuccess) {
        isLoading = false;
        allSellersModel = currentState.allSellersModel;
      } else if (currentState is AllSellersError) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return Scaffold(
        appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.allSellers),
          context,
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _bannerView(),
                    _searchView(),
                    _sellerProfileListView(),
                    _openShopButton()
                  ],
                ),
              ),
      );
    });
  }

  _bannerView() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: AppSizes.deviceWidth / 1,
          height: AppSizes.deviceWidth / 2,
          child: ImageView(
            url: allSellersModel?.bannerImage ?? '',
            fit: BoxFit.fill,
            isBottomPadding: false,
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        Container(
          width: AppSizes.deviceWidth / 1,
          height: AppSizes.deviceWidth / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.5),
              ])),
          child: Center(
            child: SizedBox(
              width: AppSizes.deviceWidth / 1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          Utils.parseHtmlString(
                            allSellersModel?.buttonNHeadingLabel
                                    ?.toUpperCase() ??
                                '',
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Text(
                          Utils.parseHtmlString(
                            allSellersModel?.bannerContent ?? '',
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _searchView() {
    return Column(
      children: [
        const SizedBox(height: 15.0),
        Text(
          allSellersModel.topLabel?.toUpperCase() ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color:
                        Theme.of(context).iconTheme.color!.withOpacity(0.4))),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchQueryController,
                    decoration: InputDecoration(
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.searchHint),
                        border: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.only(left: 15.0, bottom: 7.0)),
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        searchQuery = searchQueryController.text;
                      });
                      allSellersBloc = context.read<AllSellersBloc>();
                      allSellersBloc.add(AllSellersFetchEvent(searchQuery));
                    },
                    child: Center(
                      child: Text(
                        Utils.getStringValue(context, MpStringConstants.search)
                            .replaceAll(".", "")
                            .toUpperCase(),
                        style: TextStyle(color: Theme.of(context).textTheme.labelLarge?.color),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 15.0),
      ],
    );
  }

  _sellerProfileListView() {
    return (allSellersModel.sellersData ?? []).isEmpty
        ? const Center(
            child: Text("No Data Found"),
          )
        : ListView.builder(
            itemCount: allSellersModel.sellersData?.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.storeProfile,
                              arguments: getStoreProfileAttributeMap(
                                int.parse(allSellersModel.sellersData?[index].sellerId.toString()??"0"),
                                false,
                              ),
                          );
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: AppSizes.deviceWidth / 1,
                              height: AppSizes.deviceWidth / 3,
                              child: ImageView(
                                url:
                                    allSellersModel.sellersData?[index].bannerImage ??
                                        '',
                                fit: BoxFit.fill,
                                isBottomPadding: false,
                                borderRadius: BorderRadius.circular(0),
                              ),
                            ),
                            Container(
                              width: AppSizes.deviceWidth / 1,
                              height: AppSizes.deviceWidth / 3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  gradient: LinearGradient(colors: [
                                    Colors.black.withOpacity(0.5),
                                    Colors.black.withOpacity(0.4),
                                    Colors.black.withOpacity(0.5),
                                  ])),
                              child: Center(
                                child: SizedBox(
                                  width: AppSizes.deviceWidth / 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: ImageView(
                                            url: allSellersModel
                                                    .sellersData?[index]?.logo ??
                                                '',
                                            fit: BoxFit.fill,
                                            isBottomPadding: false,
                                            borderRadius: BorderRadius.circular(0),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                allSellersModel.sellersData?[index]
                                                        .shoptitle ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 5.0),
                                              Text(
                                                allSellersModel.sellersData?[index]
                                                        .productCount ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 40,
                            // width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      navigatorKey.currentContext!, AppRoutes.catalogMp,
                                      arguments: getCatalogMap(
                                        allSellersModel.sellersData?[index].sellerId
                                            .toString() ??
                                            "",
                                        Utils.parseHtmlString(allSellersModel.sellersData?[index].shoptitle ??
                                            ""),
                                        "",
                                        false,
                                      ));
                                },
                                child: Center(
                                    child: Text(
                                        Utils.getStringValue(
                                            context, MpStringConstants.viewAll),
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(color: Theme.of(context).textTheme.labelLarge?.color)))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }

  _openShopButton(){
    return Column(
      children: [
        SizedBox(
          height: AppSizes.paddingMedium,
        ),
        Text(
          allSellersModel.bottomLabel?.toUpperCase() ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: AppSizes.paddingMedium,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            // width: MediaQuery.of(context).size.width / 2,
              child:  appOutlinedButton(
                context,
                    () {
                  if (appStoragePref.isLoggedIn()){
                    Navigator.pushNamed(context, AppRoutes.sellerDashboard);
                  } else{
                    AppDialogHelper.confirmationDialog(
                        Utils.getStringValue(
                            context,
                            AppStringConstant
                                .loginRequiredToOpenDashboard),
                        context,
                        AppLocalizations.of(context),
                        title: Utils.getStringValue(
                            context, AppStringConstant.loginRequired),
                        onConfirm: () async {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.signInSignUp);
                        });
                  }
                },
                Utils.getStringValue(
                    context, allSellersModel?.buttonNHeadingLabel ?? ""),
                height: 45,
                width: AppSizes.deviceWidth / 1.5,
              )

          ),
        ),
        SizedBox(
          height: AppSizes.paddingMedium,
        ),
      ],
    );
  }
}
