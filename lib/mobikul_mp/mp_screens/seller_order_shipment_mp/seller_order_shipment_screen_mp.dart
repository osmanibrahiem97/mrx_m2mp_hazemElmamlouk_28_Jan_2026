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

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/constants/arguments_map.dart';
import 'package:test_new/mobikul/screens/downloadable_products/bloc/downloadable_products_screen_state.dart';
import 'package:test_new/mobikul/screens/order_details/views/order_heading_view.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/bloc/seller_order_shipment_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/views/seller_order_shipment_id_date_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/views/seller_order_shipment_item.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/views/seller_order_shipment_payment_info.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_shipment_mp/views/seller_order_shipment_price_details.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_bar.dart';
import '../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/app_storage_pref.dart';
import '../../../mobikul/helper/utils.dart';
import '../../../mobikul/screens/product_detail/widgets/file_download.dart';
import '../../mp_constants/mp_arguments_map.dart';
import '../../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';
import 'bloc/seller_order_shipment_screen_mp_bloc.dart';
import 'bloc/seller_order_shipment_screen_mp_state.dart';


class SellerOrderShipmentScreenMp extends StatefulWidget {

  final Map<String, dynamic> sellerShipmentData;
  SellerOrderShipmentScreenMp(this.sellerShipmentData, {Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _SellerOrderShipmentScreenMpState();
  }
}

class _SellerOrderShipmentScreenMpState extends State<SellerOrderShipmentScreenMp> {
  bool isLoading = false;
  bool isVisibleOrderOptions = false;
  SellerOrdersShipmentMpModel? _sellerOrdersShipmentMpModel;
  SellerOrderShipmentScreenMpBloc? _sellerOrderShipmentScreenMpBloc;
  String? shipmentId;
  String? increementId;
  String? dateTo;
  String? dateFrom;
  String? shipmentIncrement;

  @override
  void initState() {
    super.initState();

    increementId = widget.sellerShipmentData[sellerIncreementIdKey];
    shipmentId = widget.sellerShipmentData[sellerShipmentIdKey];

    shipmentIncrement = widget.sellerShipmentData[shipmentIncrementKey];

    dateTo = "";
    dateFrom = "";

    _sellerOrderShipmentScreenMpBloc = context.read<SellerOrderShipmentScreenMpBloc>();
    _sellerOrderShipmentScreenMpBloc?.add(SellerOrderShipmentDetailsMpFetchEvent(increementId, shipmentId));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          "${Utils.getStringValue(context, MpStringConstants.shipment)  ?? ""} - #${shipmentIncrement}  ",
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
      body: BlocBuilder<SellerOrderShipmentScreenMpBloc, SellerOrderShipmentScreenMpState>(
        builder: (context, state) {
          if (state is SellerOrderShipmentScreenMpInitial) {
            isLoading = true;
            isVisibleOrderOptions = false;
          } else if (state is SellerOrderShipmentScreenMpSuccess) {
            isLoading = false;
            _sellerOrdersShipmentMpModel = state.model;
            if (_sellerOrdersShipmentMpModel?.State == "complete" ||
                _sellerOrdersShipmentMpModel?.State == "processing" ||
                _sellerOrdersShipmentMpModel?.State == "closed") {
              isVisibleOrderOptions = true;
            } else {
              isVisibleOrderOptions = false;
            }
          } else if (state is SendtrackingInformationSuccess) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  state.model?.message ?? '', context);
            });
          } else if (state is SellerOrderShipmentScreenSuccess) {
            isLoading = false;
            DownloadFile().downloadPersonalData(
                "${state.model.url}",
                "Shipment-$increementId-$shipmentId-${DateTime.now().microsecond}",
                "pdf",
                context);
          } else if (state is SellerOrderShipmentScreenMpError) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          } else if( state is SellerOrderSentMailMpSuccess){
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  state.model?.message ?? '', context);
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
            visible: _sellerOrdersShipmentMpModel != null,
            child: (_sellerOrdersShipmentMpModel?.success ?? false)
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
                    SellerOrderShipmentIdContainer(context, _sellerOrdersShipmentMpModel, AppLocalizations.of(context),_sellerOrderShipmentScreenMpBloc),
                    SellerOrderShipmentPlaceDateContainer(context, _sellerOrdersShipmentMpModel,
                        AppLocalizations.of(context)),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),
                    buyerInfoData(),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),
                    orderShipmentItemList(),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),

                    if (_sellerOrdersShipmentMpModel?.paymentAndShippingHeading?.isNotEmpty ==
                        true ||
                        _sellerOrdersShipmentMpModel?.billingAddress?.isNotEmpty == true)
                      SellerOrderShipmentPaymentInfo(context,
                          AppLocalizations.of(context), _sellerOrdersShipmentMpModel),

                    if(_sellerOrdersShipmentMpModel?.shippingMethod?.isNotEmpty==true || _sellerOrdersShipmentMpModel?.shippingMethod?.isNotEmpty==true)
                      orderShippingAndTrackingMethod(context, AppLocalizations.of(context), _sellerOrdersShipmentMpModel),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        print("CHECK=> increementId $dateTo  check SHipmentId $dateFrom");
                        _sellerOrderShipmentScreenMpBloc?.add(DownloadAllShipmentEvent(dateTo, dateFrom, shipmentId, increementId));
                        _sellerOrderShipmentScreenMpBloc?.emit(SellerOrderShipmentScreenMpInitial());
                      },
                      child: Center(
                        child: Text(
                          Utils.getStringValue(context, MpStringConstants.printShipment)
                              .toUpperCase(),
                          style: TextStyle(
                              color: Theme.of(context).textTheme?.labelLarge?.color,
                            fontWeight:  FontWeight.normal
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: AppSizes.spacingNormal,
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        AppDialogHelper.confirmationDialog(
                            MpStringConstants.areYouSureYouWantSendshipment,
                            context,
                            AppLocalizations.of(context),
                            title: MpStringConstants.areYouSure,
                            onConfirm: () {
                              print("CHECK=> increementId $increementId  check SHipmentId $shipmentId");
                              _sellerOrderShipmentScreenMpBloc?.add(SendShipmentEvent(increementId, shipmentId));
                              _sellerOrderShipmentScreenMpBloc?.emit(SellerOrderShipmentScreenMpInitial());
                            });
                      },
                      child: Center(
                        child: Text(
                          Utils.getStringValue(context, MpStringConstants.sendTrackingInformation)
                              .toUpperCase(),
                          style: TextStyle(
                              color: Theme.of(context).textTheme?.labelLarge?.color,
                            fontWeight:  FontWeight.normal,
                          ),
                        ),
                      ),
                    ),

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
                  "${Utils.getStringValue(context, MpStringConstants.customerNameColon)}  ${_sellerOrdersShipmentMpModel?.customerName ?? ""}   ",
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
                  "${Utils.getStringValue(context, MpStringConstants.emailColon)}  ${_sellerOrdersShipmentMpModel?.customerEmail ?? ""}   ",
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

  Widget orderShipmentItemList() {
    return orderHeaderLayout(
        context,
        "${_sellerOrdersShipmentMpModel?.itemList?.length} ${Utils.getStringValue(context, MpStringConstants.itemS)  ?? ""}",
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.spacingGeneric),
          child: ListView.builder(
              itemCount: _sellerOrdersShipmentMpModel?.itemList?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(

                  child: Column(
                    children: [
                      SellerOrderShipmentItem(
                          _sellerOrdersShipmentMpModel?.itemList?[index] ?? ShipmentItemListData(),
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
