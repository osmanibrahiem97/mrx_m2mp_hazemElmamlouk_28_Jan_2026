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
import 'package:test_new/mobikul_mp/mp_screens/seller_products_mp/widgets/seller_product_filter_sheet.dart';
import 'package:test_new/mobikul_mp/mp_widgets/mp_alert_dialog.dart';

import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/app_widgets/lottie_animation.dart';
import '../../../mobikul/constants/app_routes.dart';
import '../../../mobikul/constants/app_string_constant.dart';
import '../../../mobikul/constants/arguments_map.dart';
import '../../mp_models/seller_products_mp/seller_products_list_mp_model.dart';
import 'bloc/seller_products_mp_screen_bloc.dart';
import 'bloc/seller_products_mp_screen_event.dart';
import 'bloc/seller_products_mp_screen_state.dart';

class SellerProductsMpScreen extends StatefulWidget {
  const SellerProductsMpScreen({Key? key}) : super(key: key);

  @override
  State<SellerProductsMpScreen> createState() => _SellerProductsMpScreenState();
}

class _SellerProductsMpScreenState extends State<SellerProductsMpScreen> {
  final ScrollController _scrollController = ScrollController();
  SellerProductsMpBloc? sellerProductsMpBloc;
  bool isLoading = false;
  bool isVisible = false;
  SellerProductsListMpModel? sellerProductsListMpModel;
  List<SellerProductListData> itemListData = [];
  int page = 1;

  bool isFromPagination = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    sellerProductsMpBloc = context?.read<SellerProductsMpBloc>();

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
    sellerProductsMpBloc?.add(SellerProductsMpFetchEvent(page));
    _scrollController.addListener(() {
      paginationFunction();
    });
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppBar(
            Utils.getStringValue(context, MpStringConstants.sellerProducts),
            context,
            isLeadingEnable: true,
            leadingIcon: Icons.arrow_back, onPressed: () {
          Navigator.pop(context);
        }, actions: [
          // IconButton(
          //     onPressed: () {
          //       showFilterSheet(context);
          //     },
          //     icon: Icon(
          //       Icons.filter_alt_rounded,
          //       color: Theme.of(context).iconTheme.color,
          //     ))
        ]),
        body: BlocBuilder<SellerProductsMpBloc, SellerProductsMpState>(
            builder: (context, currentState) {
              if (currentState is SellerProductsMpInitial) {
                if (!isFromPagination) {
                  isLoading = true;
                  // isOrderComplete = false;
                }
              } else if (currentState is SellerProductsMpSuccess) {
                isLoading = false;
                isFromPagination = false;
                sellerProductsListMpModel = currentState.response;
                if (page == 1) {
                  itemListData = sellerProductsListMpModel?.productList ?? [];
                } else {
                  itemListData.addAll(sellerProductsListMpModel?.productList ?? []);
                }
              } else if (currentState is SellerDeleteProductSuccess) {
                isLoading = false;
                isFromPagination = false;
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  AlertMessage.showSuccess(
                      currentState.response.message ?? "", context);
                });

                if (itemListData.isNotEmpty) {
                  sellerProductsListMpModel?.totalCount =
                      (sellerProductsListMpModel?.totalCount ?? 1) - 1;
                }
              } else if (currentState is SellerProductsMpError) {
                isLoading = false;
                WidgetsBinding.instance?.addPostFrameCallback((_) {
                  AlertMessage.showError(
                      currentState.message.isNotEmpty
                          ? currentState.message
                          : Utils.getStringValue(
                          context, AppStringConstant.somethingWentWrong),
                      context);
                });
              } else if (currentState is SellerProductsMpEmpty) {}
              sellerProductsMpBloc?.emit(SellerProductsMpEmpty());
              return _buildUI();
            }),
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            onPressed: () {
              _scrollController.animateTo(
                  _scrollController.position.minScrollExtent,
                  duration: const Duration(milliseconds: 50),
                  curve: Curves.ease);
            },
            backgroundColor: Theme.of(context).iconTheme.color,
            elevation: 5,
            child: Icon(
              Icons.arrow_upward,
              color: Theme.of(context)?.textTheme?.labelLarge?.color,
            ),
          ),
        ));
  }

  Widget _buildUI() {
    return Stack(
      children: [
        if (itemListData.isNotEmpty)
          RefreshIndicator(
            color: Theme.of(context).iconTheme.color,
            onRefresh: () {
              return Future.delayed(Duration.zero).then((value) {
                itemListData.clear();
                page = 1;
                sellerProductsMpBloc?.add(SellerProductsMpFetchEvent(page));
              });
            },
            child: Column(
              children: [
                Visibility(
                    child: Expanded(
                        child: ListView.builder(
                            itemCount: itemListData.length,
                            shrinkWrap: true,
                            controller: _scrollController,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return productItem(itemListData[index], index);
                            }))),
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
                    context, AppStringConstant.noProductAvailable),
                subtitle: Utils.getStringValue(
                    context, AppStringConstant.noProductAvailable),
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

  Widget productItem(SellerProductListData itemData, int index) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.productPage,
              arguments: getProductDataAttributeMap(
                itemData.name,
                itemData.productId,
              ),
            );
          },
          child: Container(
              color: Theme.of(context).cardColor,
              child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppSizes.deviceWidth / 4,
                              width: AppSizes.deviceWidth / 4,
                              child: ImageView(
                                url: itemData.image ?? '',
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                                // width: AppSizes.deviceWidth / 1 -
                                //     AppSizes.deviceWidth / 3,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(itemData.name ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: AppSizes.spacingGeneric,
                                  ),
                                  itemDataRow(
                                      Utils.getStringValue(
                                          context, MpStringConstants.sku),
                                      itemData.sku ?? ""),
                                  itemDataRow(
                                      Utils.getStringValue(
                                          context, MpStringConstants.status),
                                      itemData.status ?? ""),
                                  itemDataRow(
                                      Utils.getStringValue(context,
                                          MpStringConstants.qtyConfirmed),
                                      itemData.qtyConfirmed.toString()),
                                  itemDataRow(
                                      Utils.getStringValue(context,
                                          MpStringConstants.qtyPending),
                                      itemData.qtyPending.toString()),
                                  itemDataRow(
                                      Utils.getStringValue(
                                          context, MpStringConstants.qtySold),
                                      itemData.qtySold.toString()),
                                  itemDataRow(
                                      Utils.getStringValue(context,
                                          MpStringConstants.earnedAmount),
                                      itemData.earnedAmount.toString()),
                                  itemDataRow(
                                      Utils.getStringValue(
                                          context, MpStringConstants.taxClass),
                                      itemData.taxClassId.toString()),
                                  itemDataRow(
                                      Utils.getStringValue(context,
                                          MpStringConstants.specialPrice),
                                      itemData.specialPrice ?? ""),
                                ])),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: OutlinedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => MpAlertDialog(
                                      title: Utils.getStringValue(
                                          context, MpStringConstants.delete),
                                      msg: Utils.getStringValue(
                                          context,
                                          MpStringConstants
                                              .deleteProductAlertMsg),
                                      onConfirm: () {
                                        sellerProductsMpBloc?.add(
                                            SellerProductDeleteEvent(
                                                itemData.productId ?? "",
                                                index));
                                        itemListData.removeAt(index);
                                      },
                                    ),
                                  );
                                },
                                child: Center(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.delete, size: 20),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(Utils.getStringValue(context,
                                            MpStringConstants.delete) ??
                                        '')
                                  ],
                                )),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            if (itemData.productType != "configurable")
                              Expanded(
                                flex: 1,
                                child: OutlinedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (ctx) => MpAlertDialog(
                                              title: Utils.getStringValue(
                                                  context,
                                                  MpStringConstants.edit),
                                              msg: Utils.getStringValue(
                                                  context,
                                                  MpStringConstants
                                                      .editProductAlertMsg),
                                              onConfirm: () {
                                                Navigator.of(context).pushNamed(
                                                  AppRoutes.addNewProduct,
                                                  arguments: int.parse(itemData
                                                          .productId
                                                          .toString()) ??
                                                      0,
                                                );
                                              },
                                            ));
                                  },
                                  child: Center(
                                      child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.edit, size: 20),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(Utils.getStringValue(context,
                                              MpStringConstants.edit) ??
                                          '')
                                    ],
                                  )),
                                ),
                              ),
                          ])
                    ],
                  ))),
        ));
  }

  Widget itemDataRow(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(label, style: Theme.of(context).textTheme.titleMedium),
            ),
            Expanded(
              flex: 1,
              child: Text(':', style: Theme.of(context).textTheme.titleMedium),
            ),
            Expanded(
              flex: 1,
              child: Text(value, style: Theme.of(context).textTheme.titleLarge),
            ),
          ],
        ),
        const SizedBox(
          height: AppSizes.spacingGeneric,
        )
      ],
    );
  }

  void showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const SellerProductFilterSheet();
      },
    );
  }

  void paginationFunction() {
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent &&
        (sellerProductsListMpModel?.totalCount ?? 0) != itemListData.length) {
      setState(() {
        var totalPages = (sellerProductsListMpModel?.totalCount ?? 10) / 10;
        if (page < totalPages) {
          page++;
          sellerProductsMpBloc?.add(SellerProductsMpFetchEvent(page));
          isFromPagination = true;
        }
      });
    }
  }
}
