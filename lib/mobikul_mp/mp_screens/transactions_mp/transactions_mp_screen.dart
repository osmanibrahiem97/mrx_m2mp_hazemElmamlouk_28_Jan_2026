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
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_item_model.dart';
import 'package:test_new/mobikul_mp/mp_models/transaction_mp/transaction_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/bloc/transaction_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/widgets/payment_summary_widget.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/widgets/transaction_filter_sheet.dart';
import 'package:test_new/mobikul_mp/mp_screens/transactions_mp/widgets/transaction_list_widget.dart';

import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/helper/app_storage_pref.dart';
import '../../../mobikul/screens/product_detail/widgets/file_download.dart';

class TransactionsMpScreen extends StatefulWidget {
  const TransactionsMpScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsMpScreen> createState() => _TransactionsMpScreenState();
}

class _TransactionsMpScreenState extends State<TransactionsMpScreen> {
  TransactionMpBloc? transactionMpBloc;
  bool isLoading = false;
  TransactionMpModel? transactionMpModel;
  List<TransactionMpItemModel> itemListData = [];
  bool isFromPagination = false;
  int page = 1;
  var transactionFilterData;
  String transactionId = "";
  String dateFrom = "";
  String dateTo = "";

  bool isShowGreenCircle = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    transactionMpBloc = context.read<TransactionMpBloc>();
    transactionMpBloc
        ?.add(TransactionFetchEvent(transactionId, dateFrom, dateTo, page));

    _checkIsShowGreenCircle();
    print("TEST LOG ::: isShowGreenCircle=> $isShowGreenCircle");
    transactionMpModel = TransactionMpModel();
    super.initState();
  }

  _checkIsShowGreenCircle() {
    if (transactionId == "" && dateFrom == "" && dateTo == "") {
      setState(() {
        isShowGreenCircle = false;
      });
    } else {
      setState(() {
        isShowGreenCircle = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionMpBloc, TransactionMpState>(
        builder: (context, currentState) {
          if (currentState is TransactionMpInitial) {
            isLoading = true;
          } else if (currentState is TransactionMpSuccess) {
            isLoading = false;
            isFromPagination = false;
            transactionMpModel = currentState.transactionMpModel;
            if (kDebugMode) {
              print(transactionMpModel!.totalCommission);
            }
            if (page == 1) {
              itemListData = transactionMpModel?.transactionList ?? [];
            } else {
              itemListData.addAll(transactionMpModel?.transactionList ?? []);
            }
          } else if (currentState is RequestWithdrawalState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (currentState.response.success ?? false) {
                AlertMessage.showSuccess(
                    currentState.response.message ?? "", context);
              } else {
                AlertMessage.showError(
                    currentState.response.message ?? "", context);
              }
            });
          } else if (currentState is TransactionDownloadSuccessState) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if ((currentState.response.url ?? '').isNotEmpty) {
                DownloadFile().downloadPersonalData(
                    currentState.response.url ?? "",
                    "transaction_list_${DateTime.now().microsecond}",
                    "csv",
                    context);
              } else {
                AlertMessage.showError(
                    currentState.response.message ??
                        AppStringConstant.somethingWentWrong,
                    context);
              }
            });
          } else if (currentState is TransactionMpError) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(
                  (currentState.message.isNotEmpty
                      ? currentState.message
                      : Utils.getStringValue(
                      context, AppStringConstant.somethingWentWrong)),
                  context);
            });
          }
          transactionMpBloc?.emit(TransactionMpEmptyState());
          return Scaffold(
            appBar: commonAppBar(
                Utils.getStringValue(
                    context, MpStringConstants.transactionsMpTitle),
                context,
                isLeadingEnable: true, onPressed: () {
              Navigator.pop(context);
            }, actions: [
              IconButton(
                  onPressed: () {
                    transactionMpBloc?.add(TransactionDownloadEvent(
                        dateTo, dateFrom, page, transactionId));
                  },
                  icon: Icon(
                    Icons.download_rounded,
                    color: Theme.of(context).iconTheme.color,
                  )),
              Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        showTransactionSheet(context);
                      },
                      icon: Icon(
                        Icons.filter_alt_rounded,
                        color: Theme.of(context).iconTheme.color,
                      )),
                  Positioned(
                      right: 10,
                      top: 10,
                      child: isShowGreenCircle == true
                          ? const CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.green,
                      )
                          : Container())
                ],
              )
            ]),
            body: Stack(children: [
              (transactionMpModel != null)
                  ? SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1,
                  width: MediaQuery.of(context).size.width / 1,
                  child: Column(
                    children: [
                      PaymentSummaryWidget(transactionMpModel!, () {
                        transactionMpBloc?.add(RequestWithdrawalEvent());
                      }),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (transactionMpModel!.transactionList != null)
                        TransactionListWidget(transactionMpModel!),
                      //Don't remove this space
                      const SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              )
                  : Container(),
              Visibility(
                visible: isLoading,
                child: const Loader(),
              ),
            ]),
          );
        });
  }

  void showTransactionSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return TransactionFilterSheet((value) {
          setState(() {
            transactionFilterData = value;
          });
          if (value.isNotEmpty) {
            transactionId = value["transactionId"] ?? "";
            dateFrom = value["fromDate"] ?? "";
            dateTo = value["toDate"] ?? "";
            if (kDebugMode) {
              print("TEST LOG ::: filter ::: transactionId => $transactionId");
              print("TEST LOG ::: filter ::: dateFrom => $dateFrom");
              print("TEST LOG ::: filter ::: dateTo => $dateTo");
            }
            transactionMpBloc?.add(
                TransactionFetchEvent(transactionId, dateFrom, dateTo, page));
            _checkIsShowGreenCircle();
          }
        }, transactionFilterData);
      },
    );
  }
}
