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
import 'package:test_new/mobikul_mp/mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_events.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/bloc/seller_invoice_screen_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/views/seller_invoice_item.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/views/seller_invoice_order_id_date_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/views/seller_invoice_order_price_details.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_invoice_screen_mp/views/seller_invoice_shipping_payment_info.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_bar.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/app_storage_pref.dart';
import '../../../mobikul/helper/utils.dart';
import '../../../mobikul/models/base_model.dart';
import '../../../mobikul/screens/product_detail/widgets/file_download.dart';
import '../../mp_constants/mp_arguments_map.dart';


class SellerInvoiceScreenMp extends StatefulWidget {

  final Map<String, dynamic> sellerIncreementInvoiceData;
  SellerInvoiceScreenMp(this.sellerIncreementInvoiceData, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SellerInvoiceScreenMpState();
  }
}

class _SellerInvoiceScreenMpState extends State<SellerInvoiceScreenMp> {
  bool isLoading = false;
  bool isVisibleOrderOptions = false;
  BaseModel? _baseModel;
  SellerInvoiceScreenMpModel? _invoiceOrderModel;
  SellerInvoiceScreenMpBloc? _invoiceOrderBloc;
  String? increementId;
  String? invoiceId;
  String? invoiceIncrement;

  @override
  void initState() {
    super.initState();

    increementId = widget.sellerIncreementInvoiceData[sellerIncreementIdKey];
    invoiceId = widget.sellerIncreementInvoiceData[sellerInvoiceIdKey];
    invoiceIncrement = widget.sellerIncreementInvoiceData[invoiceIncrementKey];
    _invoiceOrderBloc = context.read<SellerInvoiceScreenMpBloc>();
    _invoiceOrderBloc?.add(SellerInvoiceDetailsMpFetchEvent(increementId,invoiceId));

  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
         //          "${widget.sort?.elementAt(index).code}-${ConstantsHelper.directionLowToHigh}",
         "${Utils.getStringValue(context, MpStringConstants.invoice)  ?? ""} - #${invoiceIncrement}  ",
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
      body: BlocBuilder<SellerInvoiceScreenMpBloc, SellerInvoiceScreenMpState>(
        builder: (context, state) {
          if (state is SellerInvoiceScreenMpInitial) {
            isLoading = true;
            isVisibleOrderOptions = false;
          } else if (state is SellerInvoiceScreenMpSuccess) {
            isLoading = false;
            _invoiceOrderModel = state.model;
            if (_invoiceOrderModel?.State == "complete" ||
                _invoiceOrderModel?.State == "processing" ||
                _invoiceOrderModel?.State == "closed") {
              isVisibleOrderOptions = true;
            } else {
              isVisibleOrderOptions = false;
            }
          }else if (state is SellerInvoiceMailSentMpSuccess) {
            isLoading = false;
            _baseModel = state.model;
            if (_invoiceOrderModel?.State == "complete" ||
                _invoiceOrderModel?.State == "processing" ||
                _invoiceOrderModel?.State == "closed") {
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
          } else if (state is SellerDownloadInvoiceMpSuccess) {
            isLoading = false;
            DownloadFile().downloadPersonalData(
                state.model?.url ?? "",
                "Invoice-$increementId-$invoiceId-${DateTime.now().microsecond}",
                "pdf",
                context);
          } else if (state is SellerInvoiceScreenMpError) {
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
            visible: _invoiceOrderModel != null,
            child: (_invoiceOrderModel?.success ?? false)
                ? Container(
              width: AppSizes.deviceWidth,
              decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.paddingMedium),
                      topRight: Radius.circular(AppSizes.paddingMedium)),
                  border: Border.all(color: Theme.of(context).cardColor)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      // controller: _scrollController,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SellerInvoiceOrderIdContainer(context, _invoiceOrderModel,
                                  AppLocalizations.of(context),_invoiceOrderBloc, invoiceId, increementId),
                              SellerInvoiceOrderPlaceDateContainer(context, _invoiceOrderModel,
                                  AppLocalizations.of(context)),

                              const SizedBox(
                                height: AppSizes.spacingNormal,
                              ),
                              buyerInfoData(),

                              const SizedBox(
                                height: AppSizes.spacingNormal,
                              ),
                              invoiceItemList(),

                              const SizedBox(
                                height: AppSizes.spacingNormal,
                              ),

                              if (_invoiceOrderModel?.paymentAndShippingHeading?.isNotEmpty ==
                                  true ||
                                  _invoiceOrderModel?.billingAddress?.isNotEmpty == true)
                                sellerInvoiceShippingPaymentInfo(context,
                                    AppLocalizations.of(context), _invoiceOrderModel),

                              const SizedBox(
                                height: AppSizes.spacingNormal,
                              ),

                              sellerInvoiceOrderPriceDetails(_invoiceOrderModel!, context, AppLocalizations.of(context))
                              // sellerOrderPriceDetails(_invoiceOrderModel?.totals ?? InvoiceTotalsModel(),
                              //     context, AppLocalizations.of(context)),

                            ],
                          ),
                      )
                  ),
                ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            _invoiceOrderBloc?.add(DownloadAllInvoiceEvent(increementId, invoiceId));
                            _invoiceOrderBloc?.emit(SellerInvoiceScreenMpInitial());
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                               Icon(
                                Icons.save_alt,
                                size: AppSizes.spacingLarge,
                                color: Theme.of(context).textTheme?.labelLarge?.color,
                              ),


                              const SizedBox(
                                width: AppSizes.spacingSmall,
                              ),

                              Text(
                                Utils.getStringValue(context, MpStringConstants.saveInvoice)
                                    .toUpperCase() ??
                                    '',
                                style:  TextStyle(color:Theme.of(context).textTheme?.labelLarge?.color,fontSize: AppSizes.spacingNormal),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
              ),
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
                  "${Utils.getStringValue(context, MpStringConstants.customerNameColon)}  ${_invoiceOrderModel?.customerName ?? ""}   ",
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
                  "${Utils.getStringValue(context, MpStringConstants.emailColon)}  ${_invoiceOrderModel?.customerEmail ?? ""}   ",
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

  Widget invoiceItemList() {
    return orderHeaderLayout(
        context,
        Utils.getStringValue(context, MpStringConstants.itemsInvoiced),
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: AppSizes.spacingGeneric),
          child: ListView.builder(
              itemCount: _invoiceOrderModel?.itemList?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(

                  child: Column(
                    children: [
/*                      sellerInvoiceOrderItemCard(
                          _invoiceOrderModel?.itemList?[index] ??
                              InvoiceItemListModel(),
                          context,
                          AppLocalizations.of(context)),*/

                      SellerinvoiceItem(
                          _invoiceOrderModel?.itemList?[index] ?? InvoiceItemListModel(),
                          context,
                           orderId,
                          AppLocalizations.of(context)),

                      //(BuildContext context, InvoiceListData? item, String url,
                      //     String orderIncrementId)

                      /* const Divider(
                        thickness: 1,
                        height: 1,
                      ),*/
                    ],
                  ),
                );
              }),
        ));
  }

}
