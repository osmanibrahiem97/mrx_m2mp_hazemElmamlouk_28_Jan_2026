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
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_landing_page_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/marketplace_landing_page_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/marketplace_landing_page_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/bloc/marketplace_landing_page_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/layouts/layout_1_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/layouts/layout_2_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/marketplace/layouts/layout_3_view.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  late MarketplaceLandingPageBloc marketplaceLandingPageBloc;
  bool isLoading = false;
  late MarketplaceLandingPageModel marketplaceLandingPageModel;

  @override
  void initState() {
    marketplaceLandingPageBloc = context.read<MarketplaceLandingPageBloc>();
    marketplaceLandingPageBloc.add(const MarketplaceLandingPageFetchEvent());
    marketplaceLandingPageModel = MarketplaceLandingPageModel();
    marketplaceLandingPageBloc = MarketplaceLandingPageBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketplaceLandingPageBloc, MarketplaceLandingPageState>(
        builder: (context, currentState) {
      if (currentState is MarketplaceLandingPageInitial) {
        isLoading = true;
      } else if (currentState is MarketplaceLandingPageSuccess) {
        isLoading = false;
        marketplaceLandingPageModel = currentState.marketplaceLandingPageModel;
      } else if (currentState is MarketplaceLandingPageError) {
        isLoading = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return Scaffold(
          body: isLoading == true
              ? Center(
                  child: Loader(),
                )
              : marketplaceLandingPageModel == null
                  ? const Center(
                      child: Text('No Data Found!'),
                    )
                  : marketplaceLandingPageModel.pageLayout == "1"
                      ? LayoutOneView(
                          marketplaceLandingPageModel:
                              marketplaceLandingPageModel,
                        )
                      : marketplaceLandingPageModel.pageLayout == "2"
                          ? LayoutTwoView(
                              marketplaceLandingPageModel:
                                  marketplaceLandingPageModel,
                            )
                          : marketplaceLandingPageModel.pageLayout == "3"
                              ? LayoutThreeView(
                                  marketplaceLandingPageModel:
                                      marketplaceLandingPageModel,
                                )
                              : Container());
    });
  }
}
