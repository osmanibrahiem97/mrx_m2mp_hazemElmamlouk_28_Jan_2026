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
import 'package:test_new/mobikul/constants/arguments_map.dart';
import 'package:test_new/mobikul/screens/order_details/views/order_heading_view.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_new_creditmemo/bloc/seller_order_new_creditmemo_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_new_creditmemo/views/seller_order_new_creditmemo_id_date_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_new_creditmemo/views/seller_order_new_creditmemo_item.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_bar.dart';
import '../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../mobikul/app_widgets/app_text_field.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/constants/app_routes.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/utils.dart';
import '../../mp_constants/mp_arguments_map.dart';
import '../../mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';
import 'bloc/seller_order_new_creditmemo_screen_mp_bloc.dart';
import 'bloc/seller_order_new_creditmemo_screen_mp_state.dart';

class SellerOrderNewCreditmemoScreenMp extends StatefulWidget {


  final  Map<String,dynamic> sellerOrderNewCreditMemoData;


  SellerOrderNewCreditmemoScreenMp(this.sellerOrderNewCreditMemoData,
      {Key? key,}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _SellerOrderNewCreditmemoScreenMpState();
  }
}

class _SellerOrderNewCreditmemoScreenMpState
    extends State<SellerOrderNewCreditmemoScreenMp> {
  bool isLoading = false;
  bool isVisibleOrderOptions = false;
  SellerOrdersCreditmemoMpModel? _sellerOrdersCreditMemoMpModel;
  SellerOrderNewCreditmemoScreenMpBloc? _sellerOrderNewCreditmemoScreenMpBloc;
  TextEditingController _creditMemoCommentsController = TextEditingController();
  TextEditingController _refundShippingController = TextEditingController();
  TextEditingController _adjustmentRefundController = TextEditingController();
  TextEditingController _adjustmentFeeController = TextEditingController();
  TextEditingController _shippingAmountController = TextEditingController();

  String? increementId;
  String? invoiceId;
  String? sendEmail;

  String? comment;
  String? shippingAmount;
  String? isVisibleOnFront;
  String? adjustmentPositive;
  String? adjustmentNegative;
  String? commentCustomerNotify;
  String? isRefundOnStock;
  String? qtyProductSelected;
  String? productName;
  int? productId;
  bool? isAppendCommentsSelected ;
  bool? isVisibleOnFrontendSelected ;
  bool? isEmailCopySelected ;

  @override
  void initState() {
    super.initState();

    _refundShippingController = TextEditingController(text: "");
    _adjustmentRefundController = TextEditingController(text: "");
    _adjustmentFeeController = TextEditingController(text: "");
    _shippingAmountController = TextEditingController(text: "");

    increementId = widget.sellerOrderNewCreditMemoData[sellerIncreementIdKey];
    invoiceId = widget.sellerOrderNewCreditMemoData[sellerInvoiceIdKey];
    productName = widget.sellerOrderNewCreditMemoData[productName];

    comment = "";
    shippingAmount = _shippingAmountController.value.text ?? "0";
    isVisibleOnFront = "0";
    adjustmentPositive = _adjustmentRefundController.text! ?? "0";
    adjustmentNegative = _adjustmentFeeController.text! ?? "0";
    commentCustomerNotify = "0";
    sendEmail = "0";
    isAppendCommentsSelected = false;
    isVisibleOnFrontendSelected = false;
    isEmailCopySelected = false;
    isRefundOnStock = "0";
    qtyProductSelected = "0";
    productName = "";
    productId = 0;

    print("SELLER-INCREEMENT-ID $increementId");
    print("SELLER-INVOICE-ID $invoiceId");

    _sellerOrderNewCreditmemoScreenMpBloc =
        context.read<SellerOrderNewCreditmemoScreenMpBloc>();
    _sellerOrderNewCreditmemoScreenMpBloc
        ?.add(SellerOrderNewCreditmemoScreenMpFetchEvent(increementId, invoiceId));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          "${Utils.getStringValue(context, MpStringConstants.newCreditMemo) ?? ""} ",
          context,
          actions: [
            // PopupMenuButton(itemBuilder: (context){
            //   return [
            //   // PopupMenuItem<int>(
            //
            //   )
            //       ];
            // })
          ]),
      body: BlocBuilder<SellerOrderNewCreditmemoScreenMpBloc,
          SellerOrderNewCreditmemoScreenMpState>(
        builder: (context, state) {
          if (state is SellerOrderNewCreditmemoScreenMpInitial) {
            isLoading = true;
            isVisibleOrderOptions = false;
          } else if (state is SellerOrderNewCreditmemoScreenMpSuccess) {
            isLoading = false;
            _sellerOrdersCreditMemoMpModel = state.model;
            if (_sellerOrdersCreditMemoMpModel?.status == "complete" ||
                _sellerOrdersCreditMemoMpModel?.status == "processing" ||
                _sellerOrdersCreditMemoMpModel?.status == "closed") {
              isVisibleOrderOptions = true;
            } else {
              isVisibleOrderOptions = false;
            }
          } else if (state is SaveInvoiceMpSuccessState) {
            isLoading = false;
            /*  WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.baseModel.message ?? '', context);
              Navigator.pushNamed(context, AppRoutes.cart);
            });*/
          }  else if (state is RefundOnlineMpSuccessState) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {

              AlertMessage.showSuccess(state.response.message ?? '', context);
              Navigator.of(context).pop();


              Navigator.of(context).pushNamed(
                  AppRoutes.sellerOrderDetails,
                  arguments: getSellerOrderDetail(increementId ?? "",increementId ?? "")
              );
            });


          }  else if (state is CreateCreditMemoSuccessState) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.message ?? '', context);
            });

            _sellerOrderNewCreditmemoScreenMpBloc
                ?.add(SellerOrderNewCreditmemoScreenMpFetchEvent(increementId, invoiceId));
          } else if (state is SellerOrderNewCreditmemoScreenMpError) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          }
          return buildUI();
        },
      ),
    );
  }

  Widget buildUI() {
    return Stack(
      children: [
        Visibility(
            visible: _sellerOrdersCreditMemoMpModel != null,
            child: (_sellerOrdersCreditMemoMpModel?.success ?? false)
                ? Container(
                width: AppSizes.deviceWidth,
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSizes.paddingMedium),
                        topRight: Radius.circular(AppSizes.paddingMedium)),
                    border: Border.all(color: Theme.of(context).cardColor)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SellerOrderShipmentIdContainer(context, _sellerOrdersCreditMemoMpModel, AppLocalizations.of(context)),
                        SellerOrderCreditMemoIdContainer(
                            context,
                            _sellerOrdersCreditMemoMpModel,
                            AppLocalizations.of(context)),
                        SellerOrderCreditMemoPlaceDateContainer(
                            context,
                            _sellerOrdersCreditMemoMpModel,
                            AppLocalizations.of(context)),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),
                        buyerInfoData(),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        paymentInfoData(),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        orderCreditMemoItemList(isRefundOnStock , qtyProductSelected),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.paidAmountHeading,
                            _sellerOrdersCreditMemoMpModel?.paidAmount ??
                                '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.refundAmountHeading,
                            _sellerOrdersCreditMemoMpModel?.refundAmount ??
                                '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.shippingAmountHeading,
                            _sellerOrdersCreditMemoMpModel
                                ?.shippingAmount ??
                                '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.shippingRefundHeading,
                            _sellerOrdersCreditMemoMpModel
                                ?.shippingRefund ??
                                '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.orderGrandTotalHeading,
                            _sellerOrdersCreditMemoMpModel
                                ?.orderGrandTotal ??
                                '',
                            context),

                        const SizedBox(height: AppSizes.size16),
                        AppTextField(
                          hintText: Utils.getStringValue(context,
                              MpStringConstants.creditMemoComments),
                          controller: _creditMemoCommentsController,
                          isRequired: true,
                          isPassword: false,
                          minLine: 5,
                          maxLine: 8,
                          inputType: TextInputType.text,
                        ),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        Text(
                          Utils.getStringValue(
                              context, MpStringConstants.refundTotals),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.subtotalHeading,
                            _sellerOrdersCreditMemoMpModel?.subTotal ?? '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.discountHeading,
                            _sellerOrdersCreditMemoMpModel?.discount ?? '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.totalTaxHeading,
                            _sellerOrdersCreditMemoMpModel?.totalTax ?? '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.refundShippingHeading,
                            _sellerOrdersCreditMemoMpModel?.refundShipping ?? '',
                            context),

                        /* itemRefundShippingView(
                            _sellerOrdersCreditMemoMpModel,
                            _sellerOrdersCreditMemoMpModel
                                ?.refundShippingHeading,
                            _sellerOrdersCreditMemoMpModel
                                ?.refundShipping ??
                                '',
                            '${AppLocalizations.of(context)?.translate(MpStringConstants.refundShipping)}',
                            _refundShippingController,
                            context),
*/
                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemRefundShippingView(
                            _sellerOrdersCreditMemoMpModel,
                            _sellerOrdersCreditMemoMpModel
                                ?.adjustmentRefundHeading,
                            _sellerOrdersCreditMemoMpModel
                                ?.adjustmentRefund ??
                                '',
                            '${AppLocalizations.of(context)?.translate(MpStringConstants.adjustmentRefund)}',
                            _adjustmentRefundController,
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemRefundShippingView(
                            _sellerOrdersCreditMemoMpModel,
                            _sellerOrdersCreditMemoMpModel
                                ?.adjustmentFeeHeading,
                            _sellerOrdersCreditMemoMpModel?.adjustmentFee ??
                                '',
                            '${AppLocalizations.of(context)?.translate(MpStringConstants.adjustmentFee)}',
                            _adjustmentFeeController,
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        itemPaidAmountView(
                            _sellerOrdersCreditMemoMpModel
                                ?.grandTotalHeading,
                            _sellerOrdersCreditMemoMpModel?.grandTotal ?? '',
                            context),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                value: _sellerOrdersCreditMemoMpModel
                                    ?.isAppendCommentsChecked ??
                                    isAppendCommentsSelected,
                                onChanged: (value) {
                                  setState(() {
                                    _sellerOrdersCreditMemoMpModel?.isAppendCommentsChecked = !(_sellerOrdersCreditMemoMpModel?.isAppendCommentsChecked ??
                                        false);
                                    // widget.callBack!();
                                    isAppendCommentsSelected = !isAppendCommentsSelected!;
                                  });
                                }),
                            Expanded(
                              child: Text(
                                  _sellerOrdersCreditMemoMpModel
                                      ?.appendCommentsHeading ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      fontSize: AppSizes.textSizeSmall,
                                      fontWeight: FontWeight.bold)
                                // const TextStyle(fontSize: 12.0, color: Colors.black),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                value: _sellerOrdersCreditMemoMpModel
                                    ?.isVisibleOnFrontendChecked ??
                                    isVisibleOnFrontendSelected,
                                onChanged: (value) {
                                  setState(() {
                                    _sellerOrdersCreditMemoMpModel
                                        ?.isVisibleOnFrontendChecked =
                                    !(_sellerOrdersCreditMemoMpModel
                                        ?.isVisibleOnFrontendChecked ??
                                        false);
                                    // widget.callBack!();
                                    isVisibleOnFrontendSelected = !isVisibleOnFrontendSelected!;
                                  });
                                }),
                            Expanded(
                              child: Text(
                                  _sellerOrdersCreditMemoMpModel
                                      ?.visibleOnFrontendHeading ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      fontSize: AppSizes.textSizeSmall,
                                      fontWeight: FontWeight.bold)
                                // const TextStyle(fontSize: 12.0, color: Colors.black),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                                value: _sellerOrdersCreditMemoMpModel
                                    ?.isEmailCopyOfCreditMemoChecked ??
                                    isEmailCopySelected,
                                onChanged: (value) {
                                  setState(() {
                                    _sellerOrdersCreditMemoMpModel
                                        ?.isEmailCopyOfCreditMemoChecked =
                                    !(_sellerOrdersCreditMemoMpModel
                                        ?.isEmailCopyOfCreditMemoChecked ??
                                        false);
                                    // widget.callBack!();
                                    isEmailCopySelected = !isEmailCopySelected!;
                                  });
                                }),
                            Expanded(
                              child: Text(
                                  _sellerOrdersCreditMemoMpModel
                                      ?.emailCopyHeading ??
                                      '',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                      fontSize: AppSizes.textSizeSmall,
                                      fontWeight: FontWeight.bold)
                                // const TextStyle(fontSize: 12.0, color: Colors.black),
                              ),
                            )
                          ],
                        ),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),


                        SizedBox(
                          child: Visibility(
                            visible: _sellerOrdersCreditMemoMpModel?.refundOnlineEnableFlag ?? false,
                            child:

                            ElevatedButton(
                              onPressed: () async {
                                if(!isEmailCopySelected!) {
                                  sendEmail = "0";
                                } else {
                                  sendEmail = "1";
                                }
                                if(!isVisibleOnFrontendSelected!) {
                                  isVisibleOnFront = "0";
                                } else {
                                  isVisibleOnFront = "1";
                                }
                                AppDialogHelper.confirmationDialog(
                                    MpStringConstants.areYouSureYouWantRefund,
                                    context,
                                    AppLocalizations.of(context),
                                    title: MpStringConstants.areYouSure,
                                    onConfirm: () {
                                      print(
                                          "increementId ==>  $increementId  \n"
                                              "comment ==> $comment \n"
                                              "productName ==> $productName  \n"
                                              "productId ==> $productId   \n"
                                              "currencyWithPrice ==> $qtyProductSelected  \n"
                                              "sendEmail ==> $sendEmail  \n"
                                              "invoiceId ==> $invoiceId  \n"
                                              "shippingAmount ==> $shippingAmount   \n"
                                              "isVisibleOnFront ==> $isVisibleOnFront   \n"
                                              "adjustmentPositive ==> $adjustmentPositive  \n"
                                              "adjustmentNegative ==> $adjustmentNegative  \n"
                                              "commentCustomerNotify ==> $commentCustomerNotify  \n"

                                      );


                                      _sellerOrderNewCreditmemoScreenMpBloc?.add(CreateCreditMemoEvent(
                                          increementId,
                                          _creditMemoCommentsController.text,
                                          "0",
                                          sendEmail,
                                          invoiceId, shippingAmount, isVisibleOnFront,
                                          adjustmentPositive, adjustmentNegative, commentCustomerNotify, productName, productId,qtyProductSelected));

                                      _sellerOrderNewCreditmemoScreenMpBloc?.emit(SellerOrderNewCreditmemoScreenMpInitial());

                                    });
                              },
                              child: Center(
                                child: /*Visibility(
                              visible: _sellerOrdersCreditMemoMpModel?.refundOnlineEnableFlag ?? false,
                              child: */Text(
                                  Utils.getStringValue(context,  _sellerOrdersCreditMemoMpModel?.refundOnlineButtonHeading ?? Utils.getStringValue(context, MpStringConstants.refund)).toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              // ),
                            ),

                          ),
                        ),

                        const SizedBox(
                          height: AppSizes.spacingNormal,
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            AppDialogHelper.confirmationDialog(
                                MpStringConstants
                                    .areYouSureYouWantRefundOffline,
                                context,
                                AppLocalizations.of(context),
                                title: MpStringConstants.areYouSure,
                                onConfirm: () {
                                  print(
                                      "increementId ==>  $increementId  \n"
                                          "comment ==> $comment \n"
                                          "productName ==> $productName  \n"
                                          "productId ==> $productId   \n"
                                          "currencyWithPrice ==> $qtyProductSelected  \n"
                                          "sendEmail ==> $sendEmail  \n"
                                          "invoiceId ==> $invoiceId  \n"
                                          "shippingAmount ==> $shippingAmount   \n"
                                          "isVisibleOnFront ==> $isVisibleOnFront   \n"
                                          "adjustmentPositive ==> $adjustmentPositive  \n"
                                          "adjustmentNegative ==> $adjustmentNegative  \n"
                                          "commentCustomerNotify ==> $commentCustomerNotify  \n"

                                  );

                                  // Navigator.pop(context);

                                  _sellerOrderNewCreditmemoScreenMpBloc?.add(CreateCreditMemoEvent(increementId, comment, "1", sendEmail,
                                      invoiceId, shippingAmount, isVisibleOnFront, adjustmentPositive, adjustmentNegative,
                                      commentCustomerNotify,  productName, productId ,qtyProductSelected));


                                  _sellerOrderNewCreditmemoScreenMpBloc?.emit(SellerOrderNewCreditmemoScreenMpInitial());

                                });
                          },
                          child:Center(
                            child:  Text(
                              Utils.getStringValue(context, _sellerOrdersCreditMemoMpModel?.refundOfflineButtonHeading ?? Utils.getStringValue(context, MpStringConstants.refundOffline)).toUpperCase(),
                              style: TextStyle(
                                color: Theme.of(context).textTheme?.labelLarge?.color,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ))
                : Container()),
        Visibility(
          visible: isLoading,
          child: const Loader(),
        ),
      ],
    );
  }

  Widget buyerInfoData() {
    return Container(
        color: Theme.of(context).cardColor,
        width: AppSizes.deviceWidth,
        padding: const EdgeInsets.symmetric(
            vertical: AppSizes.paddingMedium, horizontal: AppSizes.size8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.getStringValue(
                      context, MpStringConstants.buyerInformation),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorSecondary,
                      fontSize: AppSizes.textSizeMedium),
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                Text(
                  "${Utils.getStringValue(context, MpStringConstants.customerNameColon)}  ${_sellerOrdersCreditMemoMpModel?.customerName ?? ""}   ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                Text(
                  "${Utils.getStringValue(context, MpStringConstants.emailColon)}  ${_sellerOrdersCreditMemoMpModel?.customerEmail ?? ""}   ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
              ],
            ),
          ],
        ));
  }

  Widget paymentInfoData() {
    return Container(
        color: Theme.of(context).cardColor,
        width: AppSizes.deviceWidth,
        padding: const EdgeInsets.symmetric(
            vertical: AppSizes.paddingMedium, horizontal: AppSizes.size8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Utils.getStringValue(
                      context, MpStringConstants.orderInformation),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    // color: AppColors.textColorSecondary,
                      fontSize: AppSizes.textSizeMedium),
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                const Divider(
                  thickness: 1,
                  height: 1,
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                Text(
                  "${_sellerOrdersCreditMemoMpModel?.paymentMethodHeading ?? ""}   ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                Text(
                  "${_sellerOrdersCreditMemoMpModel?.paymentMethod ?? ""}   ",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
              ],
            ),
          ],
        ));
  }

  Widget itemPaidAmountView(String? key, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppSizes.linePadding, left: AppSizes.linePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(key.toString(), style: Theme.of(context).textTheme.bodyMedium
              // ?.apply(color: AppColors.textColorSecondary)
              // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorSecondary)
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
              flex: 1,
              child: Text("-", style: Theme.of(context).textTheme.bodyMedium
                // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
              )),
          Expanded(
            flex: 1,
            child: Text(value, style: Theme.of(context).textTheme.bodyMedium
              // ?.apply(/*fontSize: AppSizes.textSizeSmall*/ color: AppColors.textColorPrimary)
            ),
          )
        ],
      ),
    );
  }

  Widget orderCreditMemoItemList(String? isRefundOnStock, String? qtyRefund) {
    return orderHeaderLayout(
        context,
        "${Utils.getStringValue(context, MpStringConstants.itemsToRefund) ?? ""}",
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.spacingGeneric),
          child: ListView.builder(
              itemCount: _sellerOrdersCreditMemoMpModel?.itemList?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Column(
                    children: [
                      SellerOrderCreditMemoItem(
                          _sellerOrdersCreditMemoMpModel?.itemList![index],
                          context,
                          orderId,
                          AppLocalizations.of(context),
                              (value) {
                            if(value!=null){
                              Map<String, String> mapcreateCreditRequest = {};
                              mapcreateCreditRequest["isReturnToStockChecked"] = value.toString();
                              mapcreateCreditRequest["firstQuantity"] = value.toString();
                              mapcreateCreditRequest["productName"] = value.toString();
                              mapcreateCreditRequest["productId"] = value.toString();

                              isRefundOnStock = value.toString();
                              // qtyRefund = value.toString();
                              qtyRefund = mapcreateCreditRequest["firstQuantity"];

                              print("Checked Return to Stock Status => ${value.toString()}");
                              print("Test Strock Quantity => ${value.toString()}");

                              /*isReturnToStockChecked = widget.createCreditMemoRequestModel["isReturnToStockChecked"] ?? [];
                              qtyToRefund = widget.createCreditMemoRequestModel["firstQuantity"] ?? [];*/
                            }
                            print(value);
                            setState(() {

                            });
                          }),


                      /*   if (value != null)  {
                orderId = value["orderId"]??"";
                dateFromData = value["fromDate"]??"";
                dateToData = value["toDate"]??"";
                statusData = value["status"]??"";
              }*/
                    ],
                  ),
                );
              }),
        ));
  }

  Widget itemDetailQtyToRefundView(NewCreditMemoItemListData? item, String key,
      String value, BuildContext context) {
    final TextEditingController _firstQtyToRefundController =
    TextEditingController();
    _firstQtyToRefundController.text = item?.qtyToRefund ?? "";

    return Padding(
      padding: const EdgeInsets.only(
          top: AppSizes.linePadding, left: AppSizes.linePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(key.toString(), style: Theme.of(context).textTheme.bodyMedium
              // ?.apply(color: AppColors.textColorSecondary)
              // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorSecondary)
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
              flex: 1,
              child: Text("-", style: Theme.of(context).textTheme.bodyMedium
                // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
              )),
          Expanded(
            flex: 1,
            child: AppTextField(
              controller: _firstQtyToRefundController,
              isRequired: true,
              isPassword: false,
              hintText:
              Utils.getStringValue(context, MpStringConstants.qtytoRefund),
              inputType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemRefundShippingView(
      SellerOrdersCreditmemoMpModel? item,
      String? key,
      String? value,
      String? hintTextHeading,
      TextEditingController? selectedController,
      BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(
          top: AppSizes.linePadding, left: AppSizes.linePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(key.toString(), style: Theme.of(context).textTheme.bodyMedium
              // ?.apply(color: AppColors.textColorSecondary)
              // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorSecondary)
            ),
          ),
          const SizedBox(
            width: 14.0,
          ),
          Expanded(
              flex: 1,
              child: Text("-", style: Theme.of(context).textTheme.bodyMedium
                // ?.copyWith(fontSize: AppSizes.textSizeSmall, color: AppColors.textColorPrimary)
              )),
          Expanded(
            flex: 1,
            child: AppTextField(
              controller: selectedController,
              isRequired: true,
              isPassword: false,
              hintText: hintTextHeading,
              inputType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }
}
