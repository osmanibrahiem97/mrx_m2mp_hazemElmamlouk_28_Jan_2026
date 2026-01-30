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
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_detail_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_detail_mp_model/transaction_view_mp_item_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/bloc/transaction_detail_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/bloc/transaction_detail_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/bloc/transaction_detail_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/transaction_detail_mp_screen/widgets/transaction_detail_listview_widget.dart';

import '../../mp_constants/mp_arguments_map.dart';
import 'widgets/transaction_detail_header_widget.dart';

class TransactionDetailMpScreen extends StatefulWidget {
  final String transactionId;
  const TransactionDetailMpScreen(this.transactionId, {Key? key}) : super(key: key);

  @override
  State<TransactionDetailMpScreen> createState() =>
      _TransactionDetailMpScreenState();
}

class _TransactionDetailMpScreenState extends State<TransactionDetailMpScreen> {
  TransactionDetailMpBloc? transactionDetailMpBloc;
  bool isLoading = false;
  TransactionDetailMpModel? transactionDetailMpModel;
  List<TransactionViewMpItemModel> itemListData = [];
  bool isFromPagination = false;
  int page = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    transactionDetailMpBloc = context.read<TransactionDetailMpBloc>();
    transactionDetailMpBloc?.add(TransactionDetailMpFetchEvent(widget.transactionId??""));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionDetailMpBloc, TransactionDetailMpState>(
        builder: (context, currentState) {
      if (currentState is TransactionDetailMpInitial) {
        if (!isFromPagination) {
          isLoading = true;
        }
      } else if (currentState is TransactionDetailMpSuccess) {
        isLoading = false;
        isFromPagination = false;
        transactionDetailMpModel = currentState.transactionDetailMpModel;
        if (kDebugMode) {
          print("-------------------");
          print(transactionDetailMpModel!);
        }
        if (page == 1) {
          itemListData = transactionDetailMpModel?.orderList ?? [];
        } else {
          itemListData.addAll(transactionDetailMpModel?.orderList ?? []);
        }
      } else if (currentState is TransactionDetailMpError) {
        isLoading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }

      return Scaffold(
        appBar: commonAppBar(
            '${Utils.getStringValue(context, MpStringConstants.transactionsMpTitle)} ${transactionDetailMpModel?.transactionId ?? ''}',
            context),
        body: isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  width: MediaQuery.of(context).size.width / 1,
                  child: Column(
                    children: [
                      TransactionDetailHeaderWidget(
                          transactionDetailMpModel: transactionDetailMpModel),
                      TransactionDetailListViewWidget(
                          transactionDetailMpModel!),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
