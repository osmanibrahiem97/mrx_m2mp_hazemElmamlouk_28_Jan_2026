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

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/bottom_sheet.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/constants/arguments_map.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/screens/catalog/widget/catalog_grid_view.dart';
import 'package:test_new/mobikul/screens/dashboard/views/collapse_appbar.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/cms_view_mp.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/seller_reviews.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_about_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_main_profile_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_more_section_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_products_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_rating.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/store_reviews_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/write_your_review_mp.dart';
import '../../../main.dart';
import '../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/app_storage_pref.dart';
import '../../mp_constants/mp_arguments_map.dart';

class StoreProfileMpScreen extends StatefulWidget {
  final Map<String, dynamic> arguments;
  StoreProfileMpScreen(this.arguments, {Key? key}) : super(key: key);

  @override
  State<StoreProfileMpScreen> createState() => _StoreProfileMpScreenState();
}

class _StoreProfileMpScreenState extends State<StoreProfileMpScreen>
    with SingleTickerProviderStateMixin {
  late StoreProfileMpModel storeProfileMpModel;
  late StoreProfileMpBloc storeProfileMpBloc;
  bool isLoading = false;
  // List<CountryListMpModel> itemListData = [];
  bool isFromPagination = false;
  int page = 1;
  TabController? _tabController;

  /// Initial Selected Value
  String dropDownValue = 'Daily';
  late ScrollController _scrollController;

  /// List of items in our dropdown menu
  var items = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];

  @override
  void initState() {
    storeProfileMpBloc = context.read<StoreProfileMpBloc>();
    storeProfileMpBloc.add(StoreProfileMpFetchEvent(
        (widget.arguments[sellerIdKey] ?? 0), 'USD', 1000));
    storeProfileMpModel = StoreProfileMpModel();
    storeProfileMpBloc = StoreProfileMpBloc();
    _tabController = TabController(vsync: this, length: 4);
    _scrollController = ScrollController();

    if ((widget.arguments[reportSellerKey] ?? false)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          Navigator.of(context).pushNamed(AppRoutes.reportSeller, arguments: {
            "sellerId": (widget.arguments[sellerIdKey] ?? 0),
            "model": storeProfileMpModel.reportData,
          });
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreProfileMpBloc, StoreProfileMpState>(
        builder: (context, currentState) {
      if (currentState is StoreProfileMpInitial) {
        // if (!isFromPagination) {
        isLoading = true;
        // }
      } else if (currentState is StoreProfileMpSuccess) {
        isLoading = false;
        //   // isFromPagination = false;
        storeProfileMpModel = currentState.storeProfileMpModel;
        print(storeProfileMpBloc);
        log("jasdjfgd----${storeProfileMpModel.toJson()}");

      } else if (currentState is StoreProfileMpError) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: commonAppBar(   Utils.parseHtmlString(storeProfileMpModel.shopTitle ?? ""),
              context,isElevated: false),
          body: collapseAppBar(
            context,
            StoreMainProfileView(
                storeProfileMpModel: storeProfileMpModel,
                sellerId: (widget.arguments[sellerIdKey] ?? 0)),
            Stack(children: [
              TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    /// About
                    StoreAboutView(storeProfileMpModel: storeProfileMpModel),

                    /// Products
                    StoreProductsView(
                        scrollController: _scrollController,
                        storeProfileMpModel: storeProfileMpModel),

                    /// Reviews
                    StoreReviewsView(
                      storeProfileMpModel: storeProfileMpModel,
                    ),

                    ///More
                    StoreMoreSectionView(
                      storeProfileMpModel: storeProfileMpModel,
                      arguments: widget.arguments,
                    ),
                  ]),
              Visibility(visible: isLoading, child: const Loader())
            ]),
            AppSizes.deviceHeight * .5,
            tabBar: _tabBar(),
          ),
        ),
      );
    });
  }

  _tabBar() {
    return TabBar(
      isScrollable: false,
      indicatorColor: Theme.of(context).textTheme.displayLarge?.color,
      indicatorPadding: EdgeInsets.zero,
      controller: _tabController,
      labelPadding: const EdgeInsets.all(0.0),
      tabs: [
        _getTab(Utils.getStringValue(context, MpStringConstants.about) ?? ''),
        _getTab(
            Utils.getStringValue(context, MpStringConstants.products) ?? ''),
        _getTab(Utils.getStringValue(context, MpStringConstants.reviews) ?? ''),
        _getTab(Utils.getStringValue(context, MpStringConstants.more) ?? ''),
      ],
    );
  }

  Tab _getTab(title) {
    return Tab(
      child: Container(
        width: AppSizes.deviceWidth / 3,
        height: AppSizes.deviceHeight / 8,
        padding:
            const EdgeInsets.symmetric(horizontal: AppSizes.paddingGeneric),
        color: Theme.of(context).cardColor,
        child: Center(
            child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        )),
      ),
    );
  }
}
