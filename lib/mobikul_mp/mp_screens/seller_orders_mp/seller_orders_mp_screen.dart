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
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/widgets/customer_filter_sheet.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/bloc/seller_orders_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/bloc/seller_orders_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/bloc/seller_orders_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/views/bottom_seller_orders_filter_screen.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/views/seller_order_item.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_orders_mp/views/bottom_orders_filter_screen.dart';

import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/app_widgets/lottie_animation.dart';
import '../../../mobikul/constants/app_routes.dart';
import '../../../mobikul/constants/app_string_constant.dart';

class SellerOrdersMpScreen extends StatefulWidget {
  const SellerOrdersMpScreen({Key? key}) : super(key: key);

  @override
  State<SellerOrdersMpScreen> createState() => _SellerOrdersMpScreenState();
}

class _SellerOrdersMpScreenState extends State<SellerOrdersMpScreen> {
  final ScrollController _scrollController = ScrollController();
  SellerOrdersMpBloc? _sellerOrdersMpBloc;
  bool isLoading = false;
  bool _loading = false;
  SellerOrderListMpModel? sellerOrderListMpModel;
  List<SellerOrderListData> itemListData = [];
  List<OrderStatusData> orderStatusListData = [];
  var filterData;
  bool isFromPagination = false;
  int page = 1;
  bool isVisible = false;

  String orderId = "";
  String dateFromData = "";
  String dateToData = "";
  String statusData = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _sellerOrdersMpBloc = context.read<SellerOrdersMpBloc>();
    _scrollController?.addListener(() {
      if (_scrollController?.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible == true) {
          setState(() {
            isVisible = false;
          });
        }
      } else {
        if (_scrollController?.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (isVisible == false) {
            setState(() {
              isVisible = true;
            });
          }
        }
      }
    });
    _sellerOrdersMpBloc?.add(SellerOrdersScreenDataFetchEvent(
        orderId, dateFromData, dateToData, statusData, page));

    //(this.orderId, this.dateFrom, this.dateTo,this.status,this.page);

    _sellerOrdersMpBloc?.add(SellerOrdersScreenDataFetchEvent(
        orderId, dateFromData, dateToData, statusData, page));
    _scrollController.addListener(() {
      paginationFunction();
    });
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerOrdersMpBloc, SellerOrdersMpState>(
        builder: (context, currentState) {
      if (currentState is SellerOrdersMpInitial) {
        if (!isFromPagination) {
          isLoading = true;
        }
      } else if (currentState is SellerOrdersMpSuccess) {
        isLoading = false;
        isFromPagination = false;
        sellerOrderListMpModel = currentState.sellerOrderListMpModel;
        print(sellerOrderListMpModel);
        if (page == 1) {
          itemListData = sellerOrderListMpModel?.orderList ?? [];
        } else {
          itemListData.addAll(sellerOrderListMpModel?.orderList ?? []);
        }
        orderStatusListData.addAll(sellerOrderListMpModel?.orderStatus ?? []);
      } else if (currentState is SellerOrdersMpError) {
        isLoading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return Scaffold(
          appBar: commonAppBar(
              Utils.getStringValue(context, MpStringConstants.sellerOrders),
              context,
              isLeadingEnable: true, onPressed: () {
            Navigator.pop(context);
          }, actions: [
            IconButton(
                onPressed: () {
                  showShowOrderFilterSheet(context);
                },
                icon: Icon(
                  Icons.filter_alt_rounded,
                  color: Theme.of(context).iconTheme.color,
                ))
          ]),
          body: _buildUI()
      );
    });
  }

  Widget _buildUI() {
    return Stack(
      children: [
        if (itemListData.isNotEmpty)
          RefreshIndicator(
            color: Theme.of(context).iconTheme.color,
            onRefresh: () {
              return Future.delayed(Duration.zero).then((value) {
                _sellerOrdersMpBloc?.add(SellerOrdersScreenDataFetchEvent(
                    orderId, dateFromData, dateToData, statusData, page));
              });
            },
            child: Column(
              children: [
                Visibility(
                    child: Expanded(
                  child: ListView.builder(
                      // controller: _scrollController,
                      itemCount: itemListData.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return sellerOrderItem(
                          context,
                          itemListData[index],
                          (itemHash) {
                            _sellerOrdersMpBloc?.add(
                                SellerOrdersMpFetchEvent(itemHash as int));
                          },
                        );
                      }),
                )),
                Visibility(
                  visible: itemListData.isNotEmpty && isFromPagination,
                  child: Column(
                    children: [
                      const SizedBox(height: AppSizes.spacingGeneric),
                      SizedBox(
                        height: AppSizes.bottomProgressSize,
                        width: AppSizes.bottomProgressSize,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSizes.spacingGeneric),
                    ],
                  ),
                ),
              ],
            ),
          ),
        Visibility(
          visible: (itemListData.isEmpty && (!isLoading)),
          child: Center(
            child: LottieAnimation(
                lottiePath: AppImages.emptyOrderLottie,
                title: Utils.getStringValue(
                    context, AppStringConstant.noOrderAvailable),
                subtitle: "",
                buttonTitle: Utils.getStringValue(
                    context, AppStringConstant.continueShopping),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.bottomTabBar, (route) => false);
                }),
          ),
        ),
        Visibility(visible: isLoading, child: const Loader())
      ],
    );
  }

  void showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CustomerFilterSheet();
      },
    );
  }

/*

  void showShowOrderFilterSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        // useSafeArea: true,
        context: context,
      builder: (context) {
         return BottomSellerOrdersFilterScreen((orderStatusListData) {
           if(orderStatusListData !=null) {
             transactionId = value["transactionId"]??"";
             dateFrom = value["fromDate"]??"";
             dateTo = value["toDate"]??"";
           }

         });
      }
      );
          // SellerOrdersFilterSheet(orderStatusListData));
  }
*/

  void showShowOrderFilterSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return BottomSellerOrdersFilterScreen((value) {
          setState(() {
            filterData = value;
          });
          if (value != null) {
            orderId = value["orderId"] ?? "";
            dateFromData = value["fromDate"] ?? "";
            dateToData = value["toDate"] ?? "";
            statusData = value["status"] ?? "";

            _sellerOrdersMpBloc?.add(SellerOrdersScreenDataFetchEvent(
                orderId, dateFromData, dateToData, statusData, page));
          }
        }, orderStatusListData, filterData);
      },
    );
  }

/*
  void showShowOrderFilterSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const BottomSellerOrdersFilterScreen(orderStatusListData);
      },
    );
  }*/

  void paginationFunction() {
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        (sellerOrderListMpModel?.totalCount ?? 0) != itemListData.length) {
      setState(() {
        var totalPages = (sellerOrderListMpModel?.totalCount ?? 10) / 10;
        if (page < totalPages) {
          page++;
          _sellerOrdersMpBloc?.add(SellerOrdersMpFetchEvent(page));
          isFromPagination = true;
        }
      });
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        AlertMessage.showWarning(
            Utils.getStringValue(
                context,
                sellerOrderListMpModel?.message ??
                    Utils.getStringValue(
                        context, MpStringConstants.somethingWentWrong)),
            context);
      });
    }
  }
}
