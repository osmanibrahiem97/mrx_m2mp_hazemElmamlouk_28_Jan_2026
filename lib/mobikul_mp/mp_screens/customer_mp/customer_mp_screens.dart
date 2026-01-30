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
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_item_model.dart';
import 'package:test_new/mobikul_mp/mp_models/customer_mp/customer_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/bloc/customer_mp_screen_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/customer_mp/widgets/customer_filter_sheet.dart';

class CustomerMpScreen extends StatefulWidget {
  const CustomerMpScreen({Key? key}) : super(key: key);

  @override
  State<CustomerMpScreen> createState() => _CustomerMpScreenState();
}

class _CustomerMpScreenState extends State<CustomerMpScreen> {
  final ScrollController _scrollController = ScrollController();
  CustomerMpBloc? customerMpBloc;
  bool isLoading = false;
  CustomerMpModel? customerMpModel;
  CustomerMpItemModel? customerMpItemModel;
  List<CustomerMpItemModel> itemlist = [];
  bool isFromPagination = false;
  int page = 1;
  bool isVisible = false;
  late Map<String, dynamic> customerFilterData;
  bool isShowGreenCircle = false;
  @override
  void initState() {
    customerFilterData = Map();
    customerMpBloc = context.read<CustomerMpBloc>();
    customerMpBloc?.add(CustomerFetchEvent(
      "",
      "",
      "",
      "",
      "",
      int.parse(appStoragePref.getWebsiteId().toString()),
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
    customerMpBloc?.add(CustomerFetchEvent(
      "",
      "",
      "",
      "",
      "",
      int.parse(appStoragePref.getWebsiteId().toString()),
    ));
    _scrollController.addListener(() {
      paginationFunction();
    });
    customerMpModel = CustomerMpModel();
    itemlist = customerMpModel?.customerList ?? [];
    _checkIsShowGreenCircle();
    print("TEST LOG ::: isShowGreenCircle=> $isShowGreenCircle");
    super.initState();
  }

  _checkIsShowGreenCircle() {
    if (customerFilterData.isEmpty) {
      setState(() {
        isShowGreenCircle = false;
      });
    } else {
      if (customerFilterData["gender"] == "" &&
          customerFilterData["email"] == "" &&
          customerFilterData["name"] == "" &&
          customerFilterData["billingFull"] == "" &&
          customerFilterData["billingTelephone"] == "") {
        setState(() {
          isShowGreenCircle = false;
        });
      } else {
        setState(() {
          isShowGreenCircle = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerMpBloc, CustomerMpState>(
        builder: (context, currentState) {
      if (currentState is CustomerMpInitial) {
        isLoading = true;
      } else if (currentState is CustomerMpSuccess) {
        isLoading = false;
        itemlist = currentState.customerMpModel.customerList ?? [];
      } else if (currentState is CustomerMpError) {
        isLoading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message ?? '', context);
        });
      }
      return Scaffold(
          appBar: commonAppBar(
              Utils.getStringValue(context, MpStringConstants.customerMpTitle),
              context,
              isLeadingEnable: true,
              leadingIcon: Icons.arrow_back, onPressed: () {
            Navigator.pop(context);
          }, actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      showFilterSheet(context);
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
          body: isLoading == true
              ? const Center(child: Loader(),)
              : itemlist.isEmpty
                  ? const Center(
                      child: Text('No Data Found'),
                    )
                  : SingleChildScrollView(
                      child: ListView.builder(
                          itemCount: itemlist.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                color: Theme.of(context).cardColor,
                                child: ExpansionTile(
                                    initiallyExpanded: true,
                                    title: Text(
                                        '${Utils.getStringValue(context, MpStringConstants.orderCount).toUpperCase()} ${itemlist[index].customerOrderCount ?? ''}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge),
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        Utils.getStringValue(
                                                                context,
                                                                MpStringConstants
                                                                    .name) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(':',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        itemlist[index]
                                                                .customerName ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSizes.spacingGeneric,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        Utils.getStringValue(
                                                                context,
                                                                MpStringConstants
                                                                    .email) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(':',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        itemlist[index]
                                                                .customerEmail ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSizes.spacingGeneric,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        Utils.getStringValue(
                                                                context,
                                                                MpStringConstants
                                                                    .contactNo) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(':',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        itemlist[index]
                                                                .customerTelephone ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSizes.spacingGeneric,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        Utils.getStringValue(
                                                                context,
                                                                MpStringConstants
                                                                    .gender) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(':',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        itemlist[index]
                                                                .customerGender ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSizes.spacingGeneric,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        Utils.getStringValue(
                                                                context,
                                                                MpStringConstants
                                                                    .baseTotal) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(':',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        itemlist[index]
                                                                .customerBaseTotal ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSizes.spacingGeneric,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        Utils.getStringValue(
                                                                context,
                                                                MpStringConstants
                                                                    .address) ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(':',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                        itemlist[index]
                                                                .customerAddress ??
                                                            '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleLarge),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                    ]),
                              ),
                            );
                          }),
                    )
      );
    });
  }

  void showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return CustomerFilterSheet(
          customerMpBloc: customerMpBloc,
          customerFilterData: customerFilterData,
          callBack: (value) {
            customerMpBloc?.add(CustomerFetchEvent(
              value["gender"],
              value["name"],
              value["email"],
              value["billingFull"],
              value["billingTelephone"],
              int.parse(appStoragePref.getWebsiteId().toString()),
            ));
            Navigator.pop(context);
            customerFilterData = value;
            _checkIsShowGreenCircle();
            print("TEST LOG ::: CustomerFilterData => ${customerFilterData}");
          },
        );
      },
    );
  }

  void paginationFunction() {
    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        (customerMpModel?.customerList?.length ?? 0) != itemlist.length) {
      setState(() {
        var totalPages = (customerMpModel?.customerList?.length ?? 10) / 10;
        if (page < totalPages) {
          page++;
          customerMpBloc?.add(CustomerFetchEvent(
            "",
            "",
            "",
            "",
            "",
            int.parse(appStoragePref.getWebsiteId().toString()),
          ));
          isFromPagination = true;
        }
      });
    }
  }
}
