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
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/views/seller_order_view_refund_id_date_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/views/seller_order_view_refund_item.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/views/seller_order_view_refund_payment_info.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_view_refund_mp/views/seller_order_view_refund_price_details.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_bar.dart';
import '../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/utils.dart';
import '../../../mobikul/models/base_model.dart';
import '../../mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';
import '../../mp_models/seller_order_view_refund_mp/seller_orders_view_refund_mp_model.dart';
import 'bloc/seller_order_view_refund_screen_mp_bloc.dart';
import 'bloc/seller_order_view_refund_screen_mp_events.dart';
import 'bloc/seller_order_view_refund_screen_mp_state.dart';


class SellerOrderViewRefundScreenMp extends StatefulWidget {
  String? creditmemoId;
  String? incrementId;
  SellerOrderViewRefundScreenMp(this.incrementId, this.creditmemoId, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SellerOrderViewRefundScreenMpState();
  }
}

class _SellerOrderViewRefundScreenMpState extends State<SellerOrderViewRefundScreenMp> {
  bool isLoading = false;
  bool isVisibleOrderOptions = false;
  BaseModel? _baseModel;
  SellerOrdersViewRefundMpModel? _sellerOrdersViewRefundMpModel;
  SellerOrderViewRefundScreenMpBloc? _sellerOrderViewRefundScreenMpBloc;

  @override
  void initState() {
    super.initState();

    _sellerOrderViewRefundScreenMpBloc = context.read<SellerOrderViewRefundScreenMpBloc>();
    _sellerOrderViewRefundScreenMpBloc?.add(SellerOrderViewRefundDetailsMpFetchEvent(widget.creditmemoId, widget.incrementId));

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.viewMemo)  ?? "",
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
      body: BlocBuilder<SellerOrderViewRefundScreenMpBloc, SellerOrderViewRefundScreenMpState>(
        builder: (context, state) {
          if (state is SellerOrderViewRefundScreenMpInitial) {
            isLoading = true;
            isVisibleOrderOptions = false;
          } else if (state is SellerOrderViewRefundScreenMpSuccess) {
            isLoading = false;
            _sellerOrdersViewRefundMpModel = state.model;
            if (_sellerOrdersViewRefundMpModel?.orderStatus == "complete" ||
                _sellerOrdersViewRefundMpModel?.orderStatus == "processing" ||
                _sellerOrdersViewRefundMpModel?.orderStatus == "pending" ||
                _sellerOrdersViewRefundMpModel?.orderStatus == "closed") {
              isVisibleOrderOptions = true;
            } else {
              isVisibleOrderOptions = false;
            }
          } else if (state is SellerRefundSentScreenMpSuccess) {
            isLoading = false;
            _baseModel = state.model;
            if (_sellerOrdersViewRefundMpModel?.orderStatus == "complete" ||
                _sellerOrdersViewRefundMpModel?.orderStatus == "processing" ||
                _sellerOrdersViewRefundMpModel?.orderStatus == "pending" ||
                _sellerOrdersViewRefundMpModel?.orderStatus == "closed") {
              isVisibleOrderOptions = true;

              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showSuccess(
                    _baseModel!.message ?? '', context);
              });
            } else {
              isVisibleOrderOptions = false;
            }
          } else if (state is SaveInvoiceMpSuccessState) {
            isLoading = false;
          /*  WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.baseModel.message ?? '', context);
              Navigator.pushNamed(context, AppRoutes.cart);
            });*/
          } else if (state is SellerOrderViewRefundScreenMpError) {
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
            visible: (_sellerOrdersViewRefundMpModel != null && isVisibleOrderOptions) ,
            child: (_sellerOrdersViewRefundMpModel?.success ?? false)
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
                    SellerOrderViewRefundIdContainer(context, _sellerOrdersViewRefundMpModel, AppLocalizations.of(context), _sellerOrderViewRefundScreenMpBloc, widget.creditmemoId,
                        widget.incrementId),
                    SellerOrderViewRefundPlaceDateContainer(context, _sellerOrdersViewRefundMpModel,
                        AppLocalizations.of(context)),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),
                    buyerInfoData(),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),

                    if (_sellerOrdersViewRefundMpModel?.paymentAndShippingHeading?.isNotEmpty ==
                        true ||
                        _sellerOrdersViewRefundMpModel?.billingAddress?.isNotEmpty == true)
                      SellerOrderViewRefundPaymentInfo(context,
                          AppLocalizations.of(context), _sellerOrdersViewRefundMpModel),

                    if(_sellerOrdersViewRefundMpModel?.shippingMethod?.isNotEmpty==true || _sellerOrdersViewRefundMpModel?.shippingMethod?.isNotEmpty==true)
                      orderShippingAndTrackingMethod(context, AppLocalizations.of(context), _sellerOrdersViewRefundMpModel),


                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),

                    if ((_sellerOrdersViewRefundMpModel?.itemList ?? []).isNotEmpty)
                      orderViewRefundItemList(),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),

                    SellerOrderViewRefundPriceDetails(_sellerOrdersViewRefundMpModel ?? SellerOrdersViewRefundMpModel(), context, AppLocalizations.of(context))

                  ],
                ),
              ),
              )
            )
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
                  Utils.getStringValue(context, MpStringConstants.buyerInformation),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(
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
                  "${Utils.getStringValue(context, MpStringConstants.customerNameColon)}  ${_sellerOrdersViewRefundMpModel?.customerName ?? ""}   ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),

                Text(
                  "${Utils.getStringValue(context, MpStringConstants.emailColon)}  ${_sellerOrdersViewRefundMpModel?.customerEmail ?? ""}   ",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                    // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
              ],
            ),
          ],
        ));
  }

  Widget orderViewRefundItemList() {
    return orderHeaderLayout(
        context,
        Utils.getStringValue(context, MpStringConstants.itemsRefunded)  ?? "",
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.spacingGeneric),
          child: ListView.builder(
              itemCount: _sellerOrdersViewRefundMpModel?.itemList?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(

                  child: Column(
                    children: [
                      // SellerOrderShipmentItem(
                      SellerOrderViewRefundItem(
                          _sellerOrdersViewRefundMpModel?.itemList?[index] ?? ViewRefundItemListData(),
                          context,
                           orderId,
                          AppLocalizations.of(context)),
                    ],
                  ),
                );
              }),
        ));
  }
}
