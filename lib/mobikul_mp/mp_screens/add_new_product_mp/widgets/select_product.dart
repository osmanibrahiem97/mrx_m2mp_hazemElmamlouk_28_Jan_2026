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
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/select_products/select_products_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/select_products/select_products_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/select_products/select_products_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/selected_product_card.dart';

class SelectProduct extends StatefulWidget {
  final Map<String, dynamic> info;
  const SelectProduct(this.info, {Key? key}) : super(key: key);

  @override
  State<SelectProduct> createState() => _SelectProductState();
}

class _SelectProductState extends State<SelectProduct> {
  final ScrollController _scrollController = ScrollController();
  SelectProductsMpBloc? selectProductsMpBloc;
  bool isLoading = false;
  SelectProductsMpModel? selectProductsMpModel;
  ProductCollectionData? productCollectionData;
  List<ProductCollectionData> itemlist = [];
  bool isFromPagination = false;
  int page = 1;
  bool isVisible = false;
  List<ProductCollectionData> updateItemList = [];
  List<ProductCollectionData> selectedRelatedItemList = [];
  List<int> selectedIds = [];

  @override
  void initState() {
    setState(() {
      selectedRelatedItemList = widget.info["selectedItemList"];
    });
    selectProductsMpBloc = context.read<SelectProductsMpBloc>();
    selectProductsMpBloc?.add(SelectProductsMpFetchEvent(
      pageNumber: page,
      pageType: widget.info["pageType"],
      width: 1000,
      onlySelected: 0,
      sortData: '',
      filterData: '',
      productId:
      widget.info["productId"] == null ? 0 : widget.info["productId"],
    ));
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
    _scrollController.addListener(() {
      paginationFunction();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectProductsMpBloc, SelectProductsMpState>(
        builder: (context, currentState) {
          if (currentState is SelectProductsMpInitial) {
            if (!isFromPagination) {
              isLoading = true;
            }
          } else if (currentState is SelectProductsMpSuccess) {
            isLoading = false;
            isFromPagination = false;
            selectProductsMpModel = currentState.selectProductsMpModel;
            if (page == 1) {
              itemlist = selectProductsMpModel?.productCollectionData ?? [];
            } else {
              itemlist.addAll(selectProductsMpModel?.productCollectionData ?? []);
            }
            selectedRelatedItemList?.forEach((selectedElement) {
              itemlist?.forEach((element) {
                if (element.entity_id.toString() ==
                    selectedElement.entity_id.toString()) {
                  element.selected = true;
                  ProductCollectionData(
                    selected: element.selected,
                  );
                }
              });
            });
          } else if (currentState is SelectProductsMpError) {
            isLoading = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(currentState.message, context);
            });
          }
          return Scaffold(
            appBar: commonAppBar(
                Utils.getStringValue(context, MpStringConstants.addProducts),
                context,
                isLeadingEnable: false, onPressed: () {
              Navigator.pop(context);
            }),
            body: isLoading == true
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : selectProductsMpModel?.productCollectionData == null
                ? Center(
              child: Text("List is Empty!",
                  style: Theme.of(context).textTheme.bodyLarge),
            )
                : SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ListView.builder(
                    itemCount: selectProductsMpModel
                        ?.productCollectionData?.length ??
                        0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      List<bool> checkedList = List<bool>.filled(
                          selectProductsMpModel
                              ?.productCollectionData?.length ??
                              0,
                          selectProductsMpModel
                              ?.productCollectionData?[index]
                              .selected ??
                              false);
                      ProductCollectionData? item = selectProductsMpModel
                          ?.productCollectionData?[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: AppSizes.deviceWidth / 4,
                                        height: AppSizes.deviceWidth / 4,
                                        child: ImageView(
                                          isBottomPadding: false,
                                          borderRadius:
                                          BorderRadius.circular(5.0),
                                          url: selectProductsMpModel
                                              ?.productCollectionData?[
                                          index]
                                              .thumbnail ??
                                              '',
                                        )),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Text(
                                            selectProductsMpModel
                                                ?.productCollectionData?[
                                            index]
                                                .name ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                            overflow: TextOverflow.clip,
                                            maxLines: 3,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          selectProductsMpModel
                                              ?.productCollectionData?[
                                          index]
                                              .price ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displaySmall,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              Utils.getStringValue(
                                                  context,
                                                  MpStringConstants
                                                      .attributeSet),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 3.0,
                                            ),
                                            Text(
                                              ':',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              selectProductsMpModel
                                                  ?.productCollectionData?[
                                              index]
                                                  .attrinuteSet ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              Utils.getStringValue(
                                                  context,
                                                  MpStringConstants
                                                      .status),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 3.0,
                                            ),
                                            Text(
                                              ':',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              selectProductsMpModel
                                                  ?.productCollectionData?[
                                              index]
                                                  .status ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              Utils.getStringValue(
                                                  context,
                                                  MpStringConstants.type),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 3.0,
                                            ),
                                            Text(
                                              ':',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 6.0,
                                            ),
                                            Text(
                                              selectProductsMpModel
                                                  ?.productCollectionData?[
                                              index]
                                                  .type ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              Utils.getStringValue(
                                                  context,
                                                  MpStringConstants.sku),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 3.0,
                                            ),
                                            Text(
                                              ':',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                            ),
                                            const SizedBox(
                                              width: 6.0,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                selectProductsMpModel
                                                    ?.productCollectionData?[
                                                index]
                                                    .sku ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displaySmall,
                                                overflow:
                                                TextOverflow.clip,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Checkbox(
                                      activeColor: Theme.of(context)
                                          .iconTheme
                                          .color,
                                      value: checkedList[index],
                                      onChanged: (newValue) {
                                        setState(() {
                                          if (item?.selected == true) {
                                            item?.selected = newValue;
                                          }
                                          item?.selected = newValue;
                                          // selectedRelatedItemList[index].selected=newValue;
                                        });
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              // height: 55.0,
              child: SizedBox(
                height:
                selectProductsMpModel?.productCollectionData != null ? 55 : 1,
                child: Visibility(
                  visible: selectProductsMpModel?.productCollectionData != null,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        for (var i = 0;
                        i <
                            selectProductsMpModel!
                                .productCollectionData!.length;
                        i++) {
                          if (selectProductsMpModel
                              ?.productCollectionData?[i].selected ==
                              true) {
                            setState(() {
                              updateItemList.add(
                                  selectProductsMpModel!.productCollectionData![i]);
                              ProductCollectionData(
                                selected: selectProductsMpModel
                                    ?.productCollectionData?[i].selected,
                                attrinuteSet: selectProductsMpModel
                                    ?.productCollectionData?[i].attrinuteSet,
                                name: selectProductsMpModel
                                    ?.productCollectionData?[i].name,
                                price: selectProductsMpModel
                                    ?.productCollectionData?[i].price,
                                sku: selectProductsMpModel
                                    ?.productCollectionData?[i].sku,
                                status: selectProductsMpModel
                                    ?.productCollectionData?[i].status,
                                thumbnail: selectProductsMpModel
                                    ?.productCollectionData?[i].thumbnail,
                                type: selectProductsMpModel
                                    ?.productCollectionData?[i].type,
                                entity_id: selectProductsMpModel
                                    ?.productCollectionData?[i].entity_id,
                              );
                            });
                          }
                        }
                        Navigator.pop(context, updateItemList);
                      },
                      child: Center(
                        child: Text(
                            Utils.getStringValue(
                                context, MpStringConstants.addProducts),
                            style: TextStyle(color: Theme?.of(context).textTheme?.labelLarge?.color)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                  color: Theme.of(context).cardColor,
                ),
              ),
            ),
          );
        });
  }

  void paginationFunction() {
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent &&
        (selectProductsMpModel?.totalCount ?? 0) != itemlist.length) {
      setState(() {
        var totalPages = (selectProductsMpModel?.totalCount ?? 10) / 10;
        if (page < totalPages) {
          page++;
          selectProductsMpBloc?.add(SelectProductsMpFetchEvent(
            pageNumber: page,
            pageType: widget.info["pageType"],
            width: 1000,
            onlySelected: 0,
            sortData: '',
            filterData: '',
            productId: widget.info["productId"] == null
                ? "1"
                : widget.info["productId"],
          ));
          isFromPagination = true;
        }
      });
    }
  }
}
