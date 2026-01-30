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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/helper/validator.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/seller_flag_reasons_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_seller_profile/report_bloc/report_seller_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_seller_profile/report_bloc/report_seller_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_seller_profile/report_bloc/report_seller_state.dart';

class ReportSellerProfileScrern extends StatefulWidget {
  final Map<String, dynamic> data;

  const ReportSellerProfileScrern(this.data, {super.key});
  @override
  State<StatefulWidget> createState() => _ReportSellerProfileScrernState();
}

class _ReportSellerProfileScrernState extends State<ReportSellerProfileScrern> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  int? selectedItem;
  int? entityId;
  bool onTapOther = false;
  bool isLoading = false;
  bool isSubmit = false;
  ReportSellerBloc? reportSellerMpBloc;
  SellerFlagReasonsMpModel? sellerFlagReasonsMpModel;

  @override
  void initState() {
    print("======${widget.data}");
    reportSellerMpBloc = context.read<ReportSellerBloc>();
    _setInitialControllerValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportSellerBloc, ReportSellerState>(
        builder: (context, currentState) {
      if (currentState is ReportSellerLoadingState) {
        isSubmit = true;
      } else if (currentState is SubmitReportSellerState) {
        isSubmit = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (currentState.data.success == true) {
            AlertMessage.showSuccess(currentState.data.message ?? '', context);
            Navigator.pop(context);
          } else {
            AlertMessage.showError(currentState.data.message ?? '', context);
          }
        });
      } else if (currentState is ReportSellerErrorState) {
        isSubmit = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      } else if (currentState is SubmitReportSellerEmptyState) {}
      reportSellerMpBloc?.emit(SubmitReportSellerEmptyState());
      return _buildContent();
    });
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: commonAppBar(
              Utils.getStringValue(context, MpStringConstants.reportSeller),
              context,
              isLeadingEnable: false, onPressed: () {
            Navigator.pop(context);
          }),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppTextField(
                      controller: _nameController,
                      isRequired: true,
                      isPassword: false,
                      // hintText:
                      //     Utils.getStringValue(context, AppStringConstant.name),
                      inputType: TextInputType.name,
                      // validation: (value) {
                      //   return Validator.isValidName(value ?? '');
                      // },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: _emailController,
                      decoration: formFieldDecoration(
                          context,
                          "",
                          Utils.getStringValue(
                              context, AppStringConstant.email),
                          isRequired: true),
                      autovalidateMode: (_emailController.text.isNotEmpty)
                          ? AutovalidateMode.always
                          : AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        return Validator.isEmailValid(value ?? '', context);
                      },
                      onChanged: (value) async {
                        if (Validator.isEmailValid(value, context) == null) {
                        } else {}
                      },
                    ),
                    const SizedBox(height: 20),
                      Visibility(
                        visible: ((widget.data["model"].showReportOtherReason  ?? false ) || (widget.data["model"].sellerFlagReasons?.length > 0)),
                        child: Text(
                          Utils.getStringValue(
                              context, MpStringConstants.chooseFlagHeading),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: 10),
                    if (widget.data["model"] != null)
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            widget.data["model"].sellerFlagReasons.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: InkWell(
                                onTap: () {
                                  if (onTapOther == true) {
                                    setState(() {
                                      selectedItem = index;
                                      onTapOther = false;
                                      entityId = widget.data["model"]
                                          .sellerFlagReasons[index].entity_id;
                                    });
                                    print(entityId);
                                  } else {
                                    setState(() {
                                      selectedItem = index;
                                      entityId = widget.data["model"]
                                          .sellerFlagReasons[index].entity_id;
                                    });
                                    print(entityId);
                                  }

                                  if (kDebugMode) {
                                    print(selectedItem);
                                  }
                                },
                                child: Row(children: [
                                  IconButton(
                                      onPressed: () {
                                        if (onTapOther == true) {
                                          setState(() {
                                            selectedItem = index;
                                            onTapOther = false;
                                            entityId = widget
                                                .data["model"]
                                                .sellerFlagReasons[index]
                                                .entity_id;
                                          });
                                          print(entityId);
                                        } else {
                                          setState(() {
                                            selectedItem = index;
                                            entityId = widget
                                                .data["model"]
                                                .sellerFlagReasons[index]
                                                .entity_id;
                                          });
                                          print(entityId);
                                        }

                                        if (kDebugMode) {
                                          print(selectedItem);
                                        }
                                      },
                                      icon: index == selectedItem
                                          ? Icon(Icons.radio_button_checked,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color)
                                          : Icon(Icons.radio_button_unchecked,
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color
                                                  ?.withOpacity(0.4))),
                                  Expanded(
                                    child: Text(
                                      widget.data["model"]
                                              .sellerFlagReasons[index].reason
                                              .toString() ??
                                          "",
                                      style:
                                          Theme.of(context).textTheme.titleLarge,
                                    ),
                                  ),
                                ]),
                              ));
                        },
                      ),
                    Visibility(
                      visible: widget.data["model"].showReportOtherReason  ?? false,
                      child: Row(children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                onTapOther = !onTapOther;
                              });
                              if (onTapOther) {
                                setState(() {
                                  selectedItem = -1;
                                });
                              }
                              {}
                            },
                            icon: onTapOther == true
                                ? Icon(Icons.radio_button_checked,
                                    color: Theme.of(context).iconTheme.color)
                                : Icon(Icons.radio_button_unchecked,
                                    color: Theme.of(context)
                                        .iconTheme
                                        .color
                                        ?.withOpacity(0.4))),
                        Expanded(
                          child: Text(
                            widget.data["model"].sellerOtherReportLabel ?? "",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: onTapOther,
                      child: SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          controller: _reasonController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                              labelText: Utils.getStringValue(
                                  context, MpStringConstants.reasonHint),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13),
                              border: const OutlineInputBorder(),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              alignLabelWithHint: true),
                          onChanged: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.size16 * 1.5),
                    SizedBox(
                      height: AppSizes.genericButtonHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                                onPressed: () {
                                  _nameController.clear();
                                  _emailController.clear();
                                  _reasonController.clear();
                                },
                                child: Center(
                                    child: Text(
                                  Utils.getStringValue(
                                          context, MpStringConstants.reset)
                                      .toUpperCase(),
                                  // style: Theme.of(context).textTheme.button,
                                ))),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    reportSellerMpBloc?.add(
                                        SubmitReportSellerEvent(
                                            reasonId: entityId ?? 0,
                                            isOtherReason: onTapOther,
                                            sellerId: widget.data["sellerId"],
                                            otherReason:
                                                _reasonController.text.isEmpty
                                                    ? ""
                                                    : _reasonController.text,
                                            customerEmail: _emailController.text,
                                            customerName: _nameController.text));
                                    print(_nameController.text);
                                    print(_emailController.text);
                                    print(
                                      _reasonController.text.isEmpty
                                          ? ""
                                          : _reasonController.text,
                                    );
                                    print(onTapOther);
                                    print(entityId);
                                    print(widget.data["sellerId"]);
                                  }
                                },
                                child: Center(
                                    child: Text(
                                  Utils.getStringValue(
                                          context, AppStringConstant.submit)
                                      .toUpperCase(),
                                  style:  TextStyle(color: Theme?.of(context).textTheme?.labelLarge?.color),
                                ))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(visible: isSubmit, child: const Loader())
      ],
    );
  }

  _setInitialControllerValue() {
    _nameController.text = appStoragePref.getUserData()?.name ?? "";
    _emailController.text = appStoragePref.getUserData()?.email ?? "";
  }
}
