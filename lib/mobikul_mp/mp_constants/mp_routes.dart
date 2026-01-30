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
import 'package:test_new/mobikul/app_widgets/lottie_animation.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/customer_mp_screens.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/bloc/invoice_print_template_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/bloc/invoice_print_template_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/invoice_print_template_mp_screen.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_repository.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/transactions_mp_screen.dart';
import '../mp_screens/seller_products_mp/bloc/seller_products_mp_screen_bloc.dart';
import '../mp_screens/seller_products_mp/bloc/seller_products_mp_screen_repository.dart';
import '../mp_screens/seller_products_mp/seller_products_mp_screen.dart';

class MpRoutes extends AppRoutes {
  static const String transactionsMp = "transactionMp";
  static const String customerMp = "customerMp";
  static const String invoicePrintTemplateMp = "invoicePrintTemplateMp";

  static const String sellerProducts = "sellerProducts";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case transactionsMp:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) =>
                TransactionMpBloc(repository: TransactionMpRepositoryImp()),
            child:const TransactionsMpScreen(),
          ),
          settings: settings,
        );
      case customerMp:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) =>
                CustomerMpBloc(repository: CustomerMpRepositoryImp()),
            child: const CustomerMpScreen(
                // settings.arguments as TransactionMpModel,
                ),
          ),
          settings: settings,
        );
      case invoicePrintTemplateMp:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => InvoicePrintTemplateMpBloc(
                repository: InvoicePrintTemplateMpRepositoryImp()),
            child: const InvoicePrintTemplateMpScreen(
                // settings.arguments as TransactionMpModel,
                ),
          ),
          settings: settings,
        );

      case sellerProducts:
        return MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => SellerProductsMpBloc(
                repository: SellerProductsMpRepositoryImp()),
            child: const SellerProductsMpScreen(
                // settings.arguments as TransactionMpModel,
                ),
          ),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Visibility(
          visible: true,
          child: LottieAnimation(
            lottiePath: AppImages.emptyAddressLottie,
            title: "ERROR",
            subtitle: "No option found",
            buttonTitle: "This Feature is not available",
            onPressed: () {},
          ),
        ),
      );
    });
  }
}
