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
import 'package:test_new/mobikul/app_widgets/dialog_helper.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/bottom_sheet_helper.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/models/homePage/cms_data.dart';
import 'package:test_new/mobikul/screens/preferences/currency_bottomsheet_screen.dart';
import 'package:test_new/mobikul/screens/profile/views/profile_menu_items.dart';
import '../../../../mobikul_mp/mp_constants/mp_arguments_map.dart';
import '../../../../mobikul_mp/mp_constants/mp_string_constants.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/app_routes.dart';
import '../../../constants/app_string_constant.dart';
import '../../../constants/arguments_map.dart';
import '../../../constants/global_data.dart';
import '../../../helper/app_localizations.dart';
import '../../../models/homePage/footer_menu.dart';
import '../../../models/seller_menu_model/seller_menu_model_data.dart';
import '../../../network_manager/api_client.dart';
import '../../preferences/website_bottomsheet_screen.dart';

Widget profileMenu(Function logoutFunction, AppLocalizations? _localizations,
    VoidCallback setState, {SellerMenuData? sellerMenuData}) {
  List<ProfileMenuItems> menuItems = [];
  menuItems.clear();
  // if (isUserLogin) {
  if (appStoragePref.isLoggedIn() ?? false) {
    // if (true) {
    menuItems.add(ProfileMenuItems(
        id: 1,
        title: _localizations?.translate(AppStringConstant.dashboard) ?? '',
        icon: AppImages.dashboardIcon));
    menuItems.add(ProfileMenuItems(
        id: 2,
        title: _localizations?.translate(AppStringConstant.myWishlist) ?? '',
        icon: AppImages.wishlistsIcon,
        iconData: Icons.favorite));
    menuItems.add(ProfileMenuItems(
        id: 3,
        title: _localizations?.translate(AppStringConstant.allOrders) ?? '',
        icon: AppImages.ordersIcon));
    menuItems.add(ProfileMenuItems(
        id: 4,
        title: _localizations
                ?.translate(AppStringConstant.myDownloadableProducts) ??
            '',
        icon: AppImages.wishlistsIcon,
        iconData: Icons.download_rounded));
    menuItems.add(ProfileMenuItems(
        id: 5,
        title: _localizations?.translate(AppStringConstant.productReview) ?? '',
        icon: AppImages.addressIcon,
        iconData: Icons.rate_review));
    menuItems.add(ProfileMenuItems(
        id: 6,
        title: _localizations?.translate(AppStringConstant.addressBook) ?? '',
        icon: AppImages.addressIcon));
    menuItems.add(ProfileMenuItems(
        id: 7,
        title: _localizations?.translate(AppStringConstant.accountInfo) ?? '',
        icon: AppImages.accountInfoIcon));
    ///Market Place Code

    if ((AppConstant.isMarketplace  && (sellerMenuData?.sellermenu ?? []).isNotEmpty) || appStoragePref.isSeller() != true)
      menuItems.add(ProfileMenuItems(
        id: 100,
        title: _localizations?.translate(MpStringConstants.sellerAccount) ?? '',
        iconData: Icons.accessibility, icon: '', // need to change icon
      ));
  } else {
    menuItems.add(ProfileMenuItems(
        id: 8,
        title:
            _localizations?.translate(AppStringConstant.signInRegister) ?? '',
        icon: AppImages.loginIcon));
    menuItems.add(ProfileMenuItems(
        id: 16,
        title: (_localizations?.translate(AppStringConstant.ordersAndReturns) ??
            ''),
        icon: "",
        iconData: Icons.undo));
  }
  // menuItems.add();
  menuItems.add(ProfileMenuItems(
      id: 9,
      title: _localizations?.translate(AppStringConstant.settings) ?? '',
      icon: AppImages.settingsIcon // need to change icon
      ));
  menuItems.add(ProfileMenuItems(
      id: 14,
      title: _localizations?.translate(AppStringConstant.preferences) ?? '',
      icon: AppImages.translationIcon // need to change icon
      ));

  menuItems.add(ProfileMenuItems(
      id: 12,
      title: _localizations?.translate(AppStringConstant.others) ?? '',
      icon: AppImages.accountInfoIcon // need to change icon
      ));
  if (appStoragePref.isLoggedIn()) {
    menuItems.add(ProfileMenuItems(
        id: 15,
        title:
            _localizations?.translate(AppStringConstant.compareProduct) ?? '',
        icon: AppImages.accountInfoIcon,
        iconData: Icons.compare_arrows // need to change icon
        ));
  }

  ///Market Place Code
  if (AppConstant.isMarketplace) {
    menuItems.add(ProfileMenuItems(
        id: 111,
        title:
        _localizations?.translate(MpStringConstants.marketPlace) ?? '',
        icon: AppImages.accountInfoIcon,
        iconData: Icons.sell // need to change icon
    ));
  }

  // if (appStoragePref.isLoggedIn()) {
  //   menuItems.add(ProfileMenuItems(
  //       id: 11,
  //       title: _localizations?.translate(AppStringConstant.signOut) ?? '',
  //       icon: AppImages.logoutIcon // need to change icon
  //   ));
  // }

  return SingleChildScrollView(
  child: Column(
  children: [
    ListView.builder(
      shrinkWrap: true,
      itemCount: menuItems.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, i) {
        var menuItem = menuItems[i];
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).dividerColor, width: 1)),
          ),
          child: profileTiles(
              context, logoutFunction, menuItem, _localizations, setState, sellerMenuData),
        );
      })
  ]
  )
  );
}

Widget dropdownProfileTile(
    BuildContext context,
    ProfileMenuItems data,
    Function logoutFunction,
    AppLocalizations? _localizations,
    VoidCallback setState,
    List<ProfileMenuItems> children) {
  return Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      iconColor: Theme.of(context).iconTheme.color,
      title: Text(data.title, style: Theme.of(context).textTheme.displaySmall),
      children: children
          .map((e) => expansionChildren(context, e.title, e.id, e.icon,
          e.iconData, logoutFunction,
              _localizations, setState, e.cmsData, e.isCMS ?? false))
          .toList(),
    ),
  );
}

List<ProfileMenuItems> getPreferencesChildren(
    AppLocalizations? _localizations) {
  List<ProfileMenuItems> preferenceList = [];
  preferenceList.add(ProfileMenuItems(
      id: 17,
      title: _localizations?.translate(AppStringConstant.language) ?? '',
      icon: "")
  );
  preferenceList.add(ProfileMenuItems(
      id: 18,
      title: _localizations?.translate(AppStringConstant.currency) ?? '',
      icon: "")
  );
  if ((GlobalData.homePageData?.websiteData??[]).isNotEmpty && (GlobalData.homePageData?.websiteData??[]).length > 1) {
    preferenceList.add(ProfileMenuItems(
        id: 19,
        title: _localizations?.translate(AppStringConstant.websites) ?? '',
        icon: "")
    );
  }

  return preferenceList;
}

List<ProfileMenuItems> getOtherChildren(AppLocalizations? _localizations) {
  var cmsList = <ProfileMenuItems>[];
  GlobalData.homePageData?.cmsData?.forEach((element) {
    cmsList.add(ProfileMenuItems(
        id: int.parse(element?.id ?? ""),
        title: element.title ?? '',
        icon: "",
        isCMS: true));
  });

  cmsList.add(ProfileMenuItems(
      id: 13,
      title: (_localizations?.translate(AppStringConstant.contactUs) ?? ''),
      icon: ""));
  return cmsList;
}

 iconData(String? code){
  switch(code){
    case "mp_dashboard":
      return Icons.dashboard;
    case "mp_sellerprofile":
      return Icons.quick_contacts_mail_outlined;
    case "mp_sellerorderlist":
      return Icons.event_note_outlined;
    case "mp_newformdata":
      return Icons.add_box_rounded;
    case "mp_productlist":
      return Icons.playlist_add_circle_outlined;
    case "mp_transactionlist":
      return Icons.money;
    case "mp_customerlist":
      return Icons.account_box;
    case "mp_pdfheaderformdata":
      return Icons.event_note_outlined;
    case "mp_notifyadmin":
      return Icons.event_note_outlined;
      // (appStoragePref.isAdmin()) ?
      // Navigator.pushNamed(context, AppRoutes.chatWithSeller) :
      // Navigator.pushNamed(context, AppRoutes.sellerAdminChatScreen,arguments: getSellerData(appStoragePref.getCustomerToken()??"" , appStoragePref.getUserData()?.name??'', ""));
    case "mp_askquestiontoadmin":
      return Icons.chat_outlined;
    default:

  }
}

///Market Place Code
List<ProfileMenuItems> getSellerChildren(AppLocalizations? _localizations,SellerMenuData? sellerMenuData) {
  var menuLength = sellerMenuData?.sellermenu?.length ?? 0;

  print("Seller Menu======${sellerMenuData?.sellermenu?.toList()}");
  print("Seller Menu length======${sellerMenuData?.sellermenu?.length}");


  return [



      if(appStoragePref.isSeller() && !appStoragePref.isDisapproved())
        for(int index = 0 ; index < menuLength; index++)
          ProfileMenuItems(
            id:sellerMenuData?.sellermenu?[index].code ?? "",
            title: sellerMenuData?.sellermenu?[index].label ?? "",
            icon: "",
            iconData: iconData(sellerMenuData?.sellermenu?[index].code)
          ),


    if (!appStoragePref.isSeller() || appStoragePref.isDisapproved())
      ProfileMenuItems(
          id: 112,
          title: _localizations?.translate(MpStringConstants.becomeSeller) ?? '',
          icon: "",
          iconData: Icons.account_circle_rounded),


  ];

}

Widget profileTiles(
    BuildContext context,
    Function logoutFunction,
    ProfileMenuItems item,
    AppLocalizations? _localizations,
    VoidCallback setState,
   SellerMenuData? sellerMenuData,
    {double iconWidth = 20.0,
    double? iconHeight = 20.0}) {
  return ListTile(
    onTap: () {
      callBack(context, item.id, logoutFunction, _localizations, setState);
    },
    leading: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item.iconData != null
            ? Icon(
                item.iconData!,
                size: iconHeight,
                color: Theme.of(context).iconTheme.color,
              )
            : Image.asset(
                item.icon,
                height: iconHeight,
                width: iconWidth,
                color: Theme.of(context).iconTheme.color,
              ),
      ],
    ),
    title: item.id == 12
        ? dropdownProfileTile(context, item, logoutFunction, _localizations,
            setState, getOtherChildren(_localizations))
        : item.id == 14
            ? dropdownProfileTile(
                context,
                item,
                logoutFunction,
                _localizations,
                setState,
                getPreferencesChildren(_localizations),
              )
        : item.id == 100
        ? dropdownProfileTile(
      context,
      item,
      logoutFunction,
      _localizations,
      setState,
      getSellerChildren(_localizations,sellerMenuData),
    )
            : Text(item.title, style: Theme.of(context).textTheme.displaySmall),
  );
}

void callBack(BuildContext context, dynamic id, Function logoutFunction,
    AppLocalizations? _localizations, VoidCallback setState,
    {FooterMenu? cmsData}) async {
  String menuString = '18';
  int menuInt = 18;
  if (menuInt > int.parse(menuString) && cmsData != null) {
    print("dwaasa---$id");
  } else {
    print("dwaasa---$id");
    switch (id) {
      case 1:
        Navigator.of(context).pushNamed(AppRoutes.dashboard).then((value) {setState();});
        break;
      case 2:
        Navigator.of(context).pushNamed(AppRoutes.wishlist);
        break;
      case 3:
        Navigator.of(context).pushNamed(AppRoutes.orderList, arguments: false);
        break;
      case 4:
        Navigator.of(context)
            .pushNamed(AppRoutes.downloadableProducts, arguments: false);
        break;
      case 5:
        Navigator.of(context)
            .pushNamed(AppRoutes.productReview, arguments: false);
        break;
      case 6:
        Navigator.of(context).pushNamed(AppRoutes.addressBook);
        break;
      case 7:
        Navigator.of(context).pushNamed(AppRoutes.accountInfo).then((value) {setState();});
        break;
      case 8:
        Navigator.of(context).pushNamed(AppRoutes.signInSignUp);
        break;
      case 9:
        Navigator.of(context).pushNamed(AppRoutes.settingsScreen);
        break;
      case 11:
        DialogHelper.confirmationDialog(
          Utils.getStringValue(context, AppStringConstant.logoutDescription),
          context,
          AppLocalizations.of(context),
          title: Utils.getStringValue(context, AppStringConstant.logoutTitle),
          onConfirm: () {
            logoutFunction();
          },
        );

        break;
      case 13:
        Navigator.of(context).pushNamed(AppRoutes.contactUs);
        break;
      case 15:
        Navigator.pushNamed(context, AppRoutes.compareProduct);
        break;

      case 16:
        Navigator.pushNamed(context, AppRoutes.ordersAndReturns);
        break;

      case 17:
        // Navigator.of(context).pushNamed(AppRoutes.languageScreen);
        // showLanguageBottomSheet(context);
        languageBottomModelSheet(context);
        break;
      case 18:
        showCurrencyBottomSheet(context);
        // Navigator.of(context).pushNamed(AppRoutes.currencyScreen);
        break;
      case 19:
        showWebsiteBottomSheet(context);
        break;

    /// Market Place Code

      case "mp_dashboard":
        Navigator.pushNamed(context, AppRoutes.sellerDashboard);
        break;
      case "mp_sellerprofile":
        Navigator.pushNamed(context, AppRoutes.sellerProfile);
        break;
      case "mp_sellerorderlist":
        Navigator.pushNamed(context, AppRoutes.sellerOrders);
        break;
      case "mp_newformdata":
        Navigator.pushNamed(context, AppRoutes.addNewProduct, arguments: 0);
        break;
      case "mp_productlist":
        Navigator.pushNamed(context, AppRoutes.sellerProducts);
        break;
      case "mp_transactionlist":
        Navigator.pushNamed(context, AppRoutes.transactionsMp);
        break;
      case "mp_customerlist":
        Navigator.pushNamed(context, AppRoutes.customerMp);
        break;
      case "mp_pdfheaderformdata":
        Navigator.pushNamed(context, AppRoutes.invoicePrintTemplateMp);
        break;
      case "mp_notifyadmin":
        (appStoragePref.isAdmin()) ?
        Navigator.pushNamed(context, AppRoutes.chatWithSeller) :
        Navigator.pushNamed(context, AppRoutes.sellerAdminChatScreen,arguments: getSellerData(appStoragePref.getCustomerToken()??"" , appStoragePref.getUserData()?.name??'', "",""));
        break;
      case "mp_askquestiontoadmin":
        Navigator.pushNamed(context, AppRoutes.askQuestion);
        break;
      case 111:
        Navigator.pushNamed(context, AppRoutes.marketPlace);
        break;
      case 112:
        Navigator.pushNamed(context, AppRoutes.becomeSeller);
        break;
      default:
    }
  }
}

Widget expansionChildren(
    BuildContext context,
    String title,
    dynamic id,
    icon,
    iconData,
    Function logoutFunction,
    AppLocalizations? _localizations,
    VoidCallback setState,
    FooterMenu? cmsData,
    bool isCMS) {
  return ListTile(
    dense: true,
    horizontalTitleGap: 0,
    contentPadding: EdgeInsets.zero,
    onTap: () {
      if (isCMS) {
        Navigator.of(context).pushNamed(AppRoutes.cmsPage,
            arguments: getCmsPageArguments(id.toString() ?? "", title ?? ""));
      } else {
        callBack(context, id, logoutFunction, _localizations, setState,
            cmsData: cmsData);
      }
    },
    leading: iconData != null
        ? Icon(
      iconData!,
      size: 20,
      color: Theme
          .of(context)
          .iconTheme
          .color,
    )
        : SizedBox(
      height: 20,
    ),
    title: Text(title, style: Theme.of(context).textTheme.displaySmall),
  );
}
