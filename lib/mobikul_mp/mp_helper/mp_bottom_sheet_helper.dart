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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../mobikul/app_widgets/bottom_sheet.dart';
import '../../mobikul_mp/mp_screens/seller_order_view_refund_mp/bloc/seller_order_view_refund_screen_mp_bloc.dart';
import '../../mobikul_mp/mp_screens/seller_order_view_refund_mp/bloc/seller_order_view_refund_screen_mp_repository.dart';
import '../../mobikul_mp/mp_screens/seller_order_view_refund_mp/seller_order_view_refund_screen_mp.dart';

void viewRefundSellerBottomModelSheet(
    BuildContext context, String? creditmemoId, String? incrementId) {
  showAppModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => BlocProvider(
            create: (context) => SellerOrderViewRefundScreenMpBloc(
                repository: SellerOrderViewRefundScreenRepositoryImp()),
            // child: SellerOrderViewRefundScreenMp(creditmemoId, incrementId),
            child: SellerOrderViewRefundScreenMp(incrementId, creditmemoId),
          ));
}
