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
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/bloc/seller_order_refund_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/bloc/seller_order_refund_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/views/seller_order_refund_id_date_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_order_refund_mp/views/seller_order_refund_item.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/app_bar.dart';
import '../../../mobikul/app_widgets/app_dialog_helper.dart';
import '../../../mobikul/constants/app_constants.dart';
import '../../../mobikul/screens/product_detail/widgets/file_download.dart';
import '../../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import 'bloc/seller_order_refund_screen_events.dart';

class SellerOrderMpRefundScreen extends StatefulWidget {
  final SellerOrderDetailsMpModel _sellerOrderDetailsMpModel;
  SellerOrderMpRefundScreen( this._sellerOrderDetailsMpModel, {Key? key}) : super(key: key);

  @override
  _SellerOrderMpRefundScreenState createState() => _SellerOrderMpRefundScreenState();

}

class _SellerOrderMpRefundScreenState extends State<SellerOrderMpRefundScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool isFromPagination = false;
  SellerOrderDetailsMpModel? _sellerOrderDetailsMpModel;
  CreditMemoListData? creditmemoListDataModel;
  List<CreditMemoListData> creditmemoListData = [];
  int page = 1;
  int? cartCount = 0;
  bool downloadRefund = false;

  SellerOrderRefundScreenBloc? _refundScreenBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _refundScreenBloc = context.read<SellerOrderRefundScreenBloc>();
    _sellerOrderDetailsMpModel = widget._sellerOrderDetailsMpModel;
    creditmemoListData.addAll(_sellerOrderDetailsMpModel?.creditMemoList ?? []);

    _scrollController.addListener(() {
      // if (!widget.isFromDashboard) paginationFunction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
          Utils.getStringValue(context, AppStringConstant.refund).localized(),
          context),

      body: BlocBuilder<SellerOrderRefundScreenBloc, SellerOrderRefundScreenState>(
          builder: (context, currentState) {
        if (currentState is SellerOrderRefundScreenInitial) {
          if (!isFromPagination) {
            isLoading = true;
          }
        } else if (currentState is SellerOrderRefundScreenSuccess) {
          isLoading = false;
          creditmemoListDataModel = currentState.creditmemoListData;

        } else if (currentState is DownloadRefundSuccess) {
          isLoading = false;
          if (currentState?.model?.success ?? false) {
            if ((currentState?.model?.url ?? '').isNotEmpty) {
              DownloadFile().downloadPersonalData(
                currentState?.model?.url ?? "",
                "Invoice-${_sellerOrderDetailsMpModel?.incrementId}-${DateTime.now().microsecond}",
                "",
                context,
              );
            } else {
              WidgetsBinding.instance?.addPostFrameCallback((_) {
                AlertMessage.showError(
                    Utils.getStringValue(context, AppStringConstant.linkError),
                    context);
              });
            }
          } else {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              AppDialogHelper.informationDialog(
                currentState?.model?.message ??
                    Utils.getStringValue(context, AppStringConstant.linkError),
                context,
                AppLocalizations.of(context),
                title: AppStringConstant.error,
              );
            });
          }
          _refundScreenBloc?.emit(RefundScreenEmptyState());
        } else if (currentState is SellerOrderRefundScreenError) {
          isLoading = false;
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AlertMessage.showError(currentState.message, context);
          });
        }
        return _buildUI();
      }
      ),
    );
  }


  Widget _buildUI() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SellerOrderRefundIdContainer(context, _sellerOrderDetailsMpModel, AppLocalizations.of(context)),
              SellerOrderRefundPlaceDateContainer(context, _sellerOrderDetailsMpModel, AppLocalizations.of(context)),

              if(_sellerOrderDetailsMpModel?.otherError!=1 && (_sellerOrderDetailsMpModel?.creditMemoList?.length??0)>0)...[
                ListView.builder(
                    controller: _scrollController,
                    itemCount: creditmemoListData.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SellerOrderRefundItem(context,
                          creditmemoListData[index],
                          _sellerOrderDetailsMpModel?.incrementId??"",
                              (){
                            isLoading  = true;
                            _refundScreenBloc?.add(DownloadRefundEvent(_sellerOrderDetailsMpModel?.incrementId??"", creditmemoListData[index].incrementId??""));

                          },
                          downloadRefund
                      );
                    }),
              ]else...[

                const SizedBox(height: AppSizes.spacingGeneric,),
                Center(
                  child: Text((_sellerOrderDetailsMpModel?.message?.isNotEmpty==true)?(_sellerOrderDetailsMpModel?.message??""):
                  Utils.getStringValue(context, AppStringConstant.noInvoice)),
                )
              ],
            ],
          ),
        )
      ],
    );
  }

}
