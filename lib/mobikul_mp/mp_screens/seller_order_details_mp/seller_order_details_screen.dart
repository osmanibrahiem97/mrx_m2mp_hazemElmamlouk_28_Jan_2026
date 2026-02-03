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
import 'package:test_new/mobikul/screens/order_details/bloc/order_detail_screen_bloc.dart';
import 'package:test_new/mobikul/screens/order_details/views/order_heading_view.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_arguments_map.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/bloc/seller_order_detail_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_id_date_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_invoice_shipment_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_item_card.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_price_details.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_details_mp/views/seller_order_shipping_payment_info.dart';

import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_bar.dart';
import '../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../mobikul/app_widgets/app_outlined_button.dart';
import '../../../mobikul/app_widgets/app_text_field.dart';
import '../../../mobikul/app_widgets/dialog_helper.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/constants/app_routes.dart';
import '../../../mobikul/constants/app_string_constant.dart';
import '../../../mobikul/helper/app_localizations.dart';
import '../../../mobikul/helper/utils.dart';
import '../../../mobikul/models/base_model.dart';
import '../../../mobikul/screens/order_details/views/order_shipping_payment_info.dart';
import '../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';

class SellerOrderDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> sellerOrderData;
  SellerOrderDetailsScreen(
    this.sellerOrderData, {
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ViewSellerOrderShipmentState();
  }
}

class _ViewSellerOrderShipmentState extends State<SellerOrderDetailsScreen>
    with WidgetsBindingObserver {
  bool isLoading = false;
  bool isVisibleOrderOptions = false;
  final _formKey = GlobalKey<FormState>();
  SellerOrderDetailsMpModel? _orderModel;
  SellerOrderDetailMpBloc? _orderBloc;
  String? orderId;
  String? sellerId;
  BaseModel? _baseModel;

  final TextEditingController _carrierController = TextEditingController();
  final TextEditingController _trackingNumberController =
      TextEditingController();

  late FocusNode _carrierFocusNode, _trackingNumberFocusNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    orderId = widget.sellerOrderData[sellerIncreementIdKey];
    sellerId = widget.sellerOrderData[sellerIdKey];

    print("USER-ID===> ${orderId}");
    print("USER-Name===> ${sellerId}");

    _carrierFocusNode = FocusNode();
    _trackingNumberFocusNode = FocusNode();

    _orderBloc = context.read<SellerOrderDetailMpBloc>();
    _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));
  }

/*  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("==>  didChangeAppLifecycleState $state");
    if (state == AppLifecycleState.resumed) {
      _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));
    }
  }*/

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // These are the callbacks
    switch (state) {
      case AppLifecycleState.resumed:
        // widget is resumed
        print("==>  didChangeAppLifecycleState $state");
        if (state == AppLifecycleState.resumed) {
          _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));
        }
        break;
      case AppLifecycleState.inactive:
        // widget is inactive
        break;
      case AppLifecycleState.paused:
        // widget is paused
        break;
      case AppLifecycleState.detached:
        // widget is detached
        break;
    //  case AppLifecycleState.hidden:
        // widget is hidden
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _focusErrorNode() {
    if (_carrierController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_carrierFocusNode);
    } else if (_trackingNumberController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_trackingNumberFocusNode);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.itemsOrdered),
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
      body: BlocBuilder<SellerOrderDetailMpBloc, SellerOrderDetailMpState>(
        builder: (context, state) {
          if (state is SellerOrderDetailMpInitial) {
            isLoading = true;
            isVisibleOrderOptions = false;
          } else if (state is SellerOrderDetailMpSuccess) {
            isLoading = false;
            _orderModel = state.model;
            if (_orderModel?.state == "complete" ||
                _orderModel?.state == "processing" ||
                _orderModel?.state == "closed" ||
                _orderModel?.state == "canceled") {
              isVisibleOrderOptions = true;
            } else {
              isVisibleOrderOptions = false;
            }

            isVisibleOrderOptions = !(_orderModel?.invoiceId == "0" &&
                    (_orderModel?.shipmentId == "0" &&
                        _orderModel?.creditMemoList?.first?.incrementId ==
                            null)) &&
                _orderModel?.state != "canceled";

            print("Invoice Id${_orderModel?.invoiceId}");
            print("Shipment Id${_orderModel?.shipmentId}");
            print(
                "CreditMemoList Increement Id${_orderModel?.creditMemoList?.first?.incrementId}  $isVisibleOrderOptions ");

            // setUpFormData();
          } else if (state is CreateShipmentMpSuccess) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  state.shipItemsCreateshipmentMpModel?.message ?? '', context);
            });
            _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));

            // Navigator.of(context).pop()

          }else if (state is OrderSentMailMpSuccess) {
            isLoading = false;
            _baseModel = state.model;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  state.model.message ?? '', context);
            });
            // Navigator.of(context).pop();

          } else if (state is CreateMemoSuccess) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.baseModel.message ?? '', context);
            });
            _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));

            // Navigator.of(context).pop();

          } else if (state is CreateInvoiceMpStateSuccess) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.baseModel.message ?? '', context);
            });
            _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));
            // Navigator.of(context).pop();

          } else if (state is CancelInvoiceMpSuccess) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showSuccess(state.baseModel.message ?? '', context);
            });
            _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));

            // Navigator.of(context).pop();

          } else if (state is ReorderMpSuccessState) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              DialogHelper.confirmationDialog(
                  Utils.getStringValue(
                      context, MpStringConstants.reorderDescription),
                  context,
                  AppLocalizations.of(context),
                  title:
                      Utils.getStringValue(context, MpStringConstants.reorder),
                  onConfirm: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.cart,
                );
              },
                  okButton: Utils.getStringValue(
                      context, MpStringConstants.gotoCart));
            });
            _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));
          } else if (state is SellerOrderDetailMpError) {
            isLoading = false;
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AlertMessage.showError(state.message ?? '', context);
            });
          }
          return buildUI(orderId ?? "", sellerId ?? "");
        },
      ),
    );
  }

  void setUpFormData() {
    _carrierController.text = "";
    _trackingNumberController.text = "";
  }

  Widget buildUI(String orderId, String? sellerId) {
    return Stack(
      children: [
        RefreshIndicator(
          color: Theme.of(context).iconTheme.color,
          onRefresh: () {
            return Future.delayed(Duration.zero).then((value) {
              _orderBloc?.add(SellerOrderDetailFetchEvent(orderId, sellerId));
            });
            },
          child: Visibility(
            visible: _orderModel != null,
            child: (_orderModel?.success ?? false)
                ? Container(
                    width: AppSizes.deviceWidth,
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.paddingMedium),
                            topRight: Radius.circular(AppSizes.paddingMedium)),
                        border: Border.all(color: Theme.of(context).cardColor)),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                                visible: isVisibleOrderOptions,
                                child: ExpansionTile(
                                  iconColor: Theme.of(context).iconTheme.color,
                                  collapsedIconColor:
                                      Theme.of(context).iconTheme.color,
                                  title: Text(
                                      Utils.getStringValue(context,
                                          MpStringConstants.itemsOrdered),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  children: [
                                    ListTile(
                                      // title: orderInvoiceShipmentViewContainer(
                                      title:
                                          sellerOrderInvoiceShipmentViewContainer(
                                              context,
                                              _orderModel,
                                              AppLocalizations.of(context)),
                                    )
                                  ],
                                )),

                            sellerOrderIdContainer(context, _orderModel,
                                AppLocalizations.of(context), _orderBloc, orderId),
                            sellerOrderPlaceDateContainer(context, _orderModel,
                                AppLocalizations.of(context)),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),
                            buyerInfoData(),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),
                            orderedItemList(),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),

                            sellerOrderPriceDetails(_orderModel!, context,
                                AppLocalizations.of(context)),
                            // const SizedBox(
                            //   height: AppSizes.paddingNormal,
                            // ),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),

                            if (_orderModel?.shippingMethod?.isNotEmpty ==
                                    true ||
                                _orderModel?.billingAddress?.isNotEmpty == true)
                              sellerShippingPaymentInfo(context,
                                  AppLocalizations.of(context), _orderModel),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),

                            carrierAndTrackingNumberShipItems(context),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),

                            shipItemsView(context),
                            const SizedBox(
                              height: AppSizes.spacingSmall,
                            ),
                            createInvoice(context),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),

                            creditMemoView(context),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),

                            cancelOrderView(context),

                            const SizedBox(
                              height: AppSizes.spacingNormal,
                            ),
                            // const SizedBox(
                            //   height: AppSizes.paddingNormal,
                            // ),
                            /*if (_orderModel?.canReorder == true &&
                              appStoragePref.isLoggedIn())
                            reorderView(context)*/
                          ],
                        ),
                      ),
                    ))
                : Container()),
    ),
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
                  Utils.getStringValue(context, MpStringConstants.buyerInfo),
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
                  _orderModel?.buyerName ?? "",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
                const SizedBox(
                  height: AppSizes.spacingSmall,
                ),
                Text(
                  _orderModel?.buyerEmail ?? "",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      // color: AppColors.textColorPrimary,
                      fontSize: AppSizes.textSizeMedium),
                ),
              ],
            ),
          ],
        ));
  }

  Widget orderedItemList() {
    return orderHeaderLayout(
        context,
        '${_orderModel?.orderData?.itemList?.length} ${Utils.getStringValue(context, MpStringConstants.itemsOrdered)}',
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppSizes.spacingGeneric),
          child: ListView.builder(
              itemCount: _orderModel?.orderData?.itemList?.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      sellerOrderItemCard(
                          _orderModel?.orderData?.itemList?[index],
                          context,
                          AppLocalizations.of(context)),
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

  Widget reorderView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.size8),
      child: SizedBox(
        width: AppSizes.deviceWidth,
        height: AppSizes.genericButtonHeight,
        child: ElevatedButton(
          onPressed: () {
            // _orderBloc?.add(ReorderEvent(_orderModel?.incrementId ?? ""));
          },
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const Icon(
                Icons.repeat,
                size: AppSizes.size16,
                color: AppColors.white,
              ),
              const SizedBox(
                width: AppSizes.size4,
              ),
              Text(
                MpStringConstants.reorder.toUpperCase(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget creditMemoView(BuildContext context) {
    return Visibility(

        visible: (((_orderModel?.creditMemoButton == null ?? false) &&
            // (_orderModel?.state != ('processing')) &&
            (_orderModel?.state == ('complete')) &&
            (_orderModel?.state != ('closed')) &&
            (_orderModel?.state != ('canceled'))) ||
            ((_orderModel?.invoiceId != null ?? false) && (_orderModel?.invoiceId != "0") && (_orderModel?.creditMemoButton!=null))
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.size8),
          child: SizedBox(
            width: AppSizes.deviceWidth,
            height: AppSizes.genericButtonHeight,
            child: ElevatedButton(
              onPressed: () {
                print("");
                Navigator.pushNamed(context, AppRoutes.sellerNewCreditMemo,
                    arguments: getSellerCreateCreditMemoData(
                        _orderModel?.incrementId ?? "",
                        _orderModel?.invoiceId ?? "0",_orderModel?.invoiceIncrement));
                // _orderBloc?.add(ReorderEvent(_orderModel?.incrementId ?? ""));
              },
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    MpStringConstants.creditMemo.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).textTheme?.labelLarge?.color,
                        ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget cancelOrderView(BuildContext context) {
    return Visibility(
        visible: (((_orderModel?.manageOrder ?? false) &&
            // (_orderModel?.state != ('processing')) &&
            (_orderModel?.state != ('complete')) &&
            (_orderModel?.state != ('closed')) &&
            (_orderModel?.state != ('canceled')) &&
            (_orderModel?.statusLabel != ('Canceled')) &&
            ((_orderModel?.invoiceId == null ?? false) || (_orderModel?.invoiceId == "0"))
        )
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.size8),
          child: SizedBox(
            width: AppSizes.deviceWidth,
            height: AppSizes.genericButtonHeight,
            child: appOutlinedButton(
              textColor: Colors.white,
              context,
              () async {
                AppDialogHelper.confirmationDialog(
                    Utils.getStringValue(context,
                        MpStringConstants.areYouSureYouWantToCancelThisOrder),
                    context,
                    AppLocalizations?.of(context),
                    title: Utils.getStringValue(
                        context, MpStringConstants.areYouSure),
                    onConfirm: () async {
                  _orderBloc?.add(CancelOrderEvent(
                      _orderModel?.incrementId?.toString() ?? ""));
                  _orderBloc?.emit(SellerOrderDetailMpInitial());
                  // AnalyticsEventsFirebase().removeFromCart(product?.lineId.toString() ?? "0", product?.name ?? "0",);
                });
              },
              Utils.getStringValue(
                      context, (MpStringConstants.cancelOrder).toUpperCase())
                  .toUpperCase(),
            ),
          ),
        ));
  }

  Widget shipItemsView(BuildContext context) {
    return Visibility(
        visible: (((_orderModel?.state != ('complete')) &&
                (_orderModel?.state != ('canceled')) &&
                (_orderModel?.state != ('closed'))) && ((_orderModel?.shipmentId == null ?? false) || (_orderModel?.shipmentId == "0") /*&&
                    (_orderModel?.shippingAddress?.isNotEmpty ?? false)*/
            ) && _orderModel?.shipmentButton == true),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.size8),
          child: SizedBox(
            width: AppSizes.deviceWidth,
            height: AppSizes.genericButtonHeight,
            child: appOutlinedButton(
              textColor: Colors.white,
              context,
              () async {
                if (_formKey.currentState?.validate() == true) {
                  /*_orderBloc?.add(SaveShipItemsEvent(
                      _carrierController.text,
                      _trackingNumberController.text) );*/
                  _validateForm();
                }
              },
              Utils.getStringValue(
                      context, (MpStringConstants.shipItems).toUpperCase())
                  .toUpperCase(),
            ),
          ),
        ));
  }

  void _validateForm() async {
    print('Logining.....');
    if (_formKey.currentState?.validate() == true) {
      Utils.hideSoftKeyBoard();
      var carrierTextdata = _carrierController.text.toString();
      var trackingNumberTextdata = _trackingNumberController.text.toString();
      print("$carrierTextdata   ===>>  $trackingNumberTextdata");

      AppDialogHelper.confirmationDialog(
          Utils.getStringValue(
              context, MpStringConstants.areYouSureYouWantToCreateShipment),
          context,
          title: MpStringConstants.areYouSure,
          AppLocalizations?.of(context), onConfirm: () async {
        print(
            "$carrierTextdata  Inside  alert dialog ===>>  $trackingNumberTextdata");

        _orderBloc?.add(CreateShipmentEvent(
            _orderModel?.incrementId?.toString() ?? "",
            carrierTextdata,
            trackingNumberTextdata));

        _orderBloc?.emit(SellerOrderDetailMpInitial());
        // AnalyticsEventsFirebase().removeFromCart(product?.lineId.toString() ?? "0", product?.name ?? "0",);
      });
    } else {
      _focusErrorNode();
    }
  }

  Widget createInvoice(BuildContext context) {
    return Visibility(
        visible: (((_orderModel?.invoiceId == null ?? false) ||
                (_orderModel?.invoiceId == "0")) &&
            // (_orderModel?.statusLabel != ('Canceled')) &&
              ((_orderModel?.state != ('complete')) &&
                (_orderModel?.state != ('canceled')) &&
                (_orderModel?.state != ('closed')))
    ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.size8),
          child: SizedBox(
            width: AppSizes.deviceWidth,
            height: AppSizes.genericButtonHeight,
            child: ElevatedButton(
              onPressed: () async {
                AppDialogHelper.confirmationDialog(
                    MpStringConstants.areYouSureYouWantCreateInvoice,
                    context,
                    AppLocalizations.of(context),
                    title: MpStringConstants.areYouSure, onConfirm: () {
                  _orderBloc?.add(SellerCreateInvoiceEvent(orderId));
                  _orderBloc?.emit(SellerOrderDetailMpInitial());
                });
              },
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    MpStringConstants.createInvoice.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).textTheme?.labelLarge?.color,
                        ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget carrierAndTrackingNumberShipItems(BuildContext context) {
    return Visibility(
        visible: (((_orderModel?.shipmentId == null ?? false) ||
                    (_orderModel?.shipmentId == "0")) &&
                ((_orderModel?.state != ('complete')) &&
                    (_orderModel?.state != ('canceled')) &&
                    (_orderModel?.state !=
                        ('closed'))) && _orderModel?.shipmentButton == true
            /*&&
            (_orderModel?.shippingAddress?.isNotEmpty ?? false)*/
            ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.size8),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.size16),
              AppTextField(
                controller: _carrierController,
                focusNode: _carrierFocusNode,
                isRequired: false,
                isPassword: false,
                hintText:
                    Utils.getStringValue(context, MpStringConstants.carrier),
                inputType: TextInputType.name,
              ),
              SizedBox(height: AppSizes.size16),
              AppTextField(
                controller: _trackingNumberController,
                focusNode: _trackingNumberFocusNode,
                isRequired: true,
                isPassword: false,
                hintText: Utils.getStringValue(
                    context, MpStringConstants.trackingNumber),
                inputType: TextInputType.name,
              ),
            ],
          ),
        ));
  }
}
