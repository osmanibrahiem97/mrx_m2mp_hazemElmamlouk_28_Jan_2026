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
import 'package:test_new/mobikul/models/productDetail/report_data_model.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_product/report_bloc/report_product_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_product/report_bloc/report_product_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/report_product/report_bloc/report_product_state.dart';

import '../../../mobikul/helper/app_localizations.dart';

class ReportProductScreen extends StatefulWidget {
  final data;

  const ReportProductScreen(this.data, {super.key});
  @override
  State<StatefulWidget> createState() => _ReportProductScreenScreenState();
}

class _ReportProductScreenScreenState extends State<ReportProductScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  int? selectedItem;
  int? entityId;
  bool onTapOther = false;
  bool isLoading = false;
  bool isSubmit = false;
  ReportProductBloc? reportMpBloc;

  @override
  void initState() {
    reportMpBloc = context.read<ReportProductBloc>();
    print("-----widget.data${widget.data["model"].text}");
    print("widget---${widget.data["model"].flagReasons}");
    print("Others--${widget.data["otherFieldPlaceholder"]}");
    reportMpBloc?.add(ReportProductInitialEvent());


    // if( ((widget.data as Map<String,dynamic>)['model'] as ReportDataModel).productOtherReasonLabel?.isNotEmpty ?? false){
    //   _reasonController.text = ((widget.data as Map<String,dynamic>)['model'] as ReportDataModel).productOtherReasonLabel ?? '';
    // }
    _setInitialControllerValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProductBloc, ReportProductState>(
        builder: (context, currentState) {
      if (currentState is ReportProductLoadingState) {
        isSubmit = true;


      } else if (currentState is SubmitReportProductState) {
        isSubmit = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (currentState.data.success == true) {
            AlertMessage.showSuccess(currentState.data.message ?? '', context);
            Navigator.pop(context);
          } else {
            AlertMessage.showError(currentState.data.message ?? '', context);
          }
        });
      } else if (currentState is ReportProductErrorState) {
        isSubmit = false;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      } else if (currentState is ReportProductInitialState){
        onTapOther = widget.data["model"].acceptOtherReasons ?? false;

        print("asdhad----${onTapOther}");
        print("asdadada----${widget.data["model"].acceptOtherReasons}");


      }else if (currentState is SubmitReportProductEmptyState) {}
      reportMpBloc?.emit(SubmitReportProductEmptyState());
      return _buildContent();
    });
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: commonAppBar(
              Utils.getStringValue(context, MpStringConstants.reportProduct),
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
                      hintText:
                          Utils.getStringValue(context, AppStringConstant.name),
                      inputType: TextInputType.name,
                      validation: (value) {
                        return Validator.isValidName( AppLocalizations.of(context)
                            ?.translate(value ?? "") ??
                            '',context);
                      },
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
                      Text(
                        Utils.getStringValue(
                            context, MpStringConstants.chooseFlagHeading),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 10),
                    // if (widget.data["model"] != null &&  widget.data["model"].productFlagReasons !=null)
                    if (widget.data["model"] != null &&  widget.data["model"].flagReasons !=null)

                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:widget.data["model"].flagReasons.length ?? 0,
                        // widget.data["model"].productFlagReasons.length ?? 0,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 3.0),
                              child: Visibility(
                                visible: widget.data["model"].flagReasons[index].status,
                                child: InkWell(
                                  onTap: () {
                                    if (onTapOther == true) {
                                      setState(() {
                                        selectedItem = index;
                                        onTapOther = false;
                                        entityId = widget.data["model"].flagReasons[index].entity_id;
                                      });
                                      print(entityId);
                                    } else {
                                      setState(() {
                                        selectedItem = index;
                                        entityId = widget.data["model"]
                                            .flagReasons[index].entity_id;
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
                                                  .flagReasons[index]
                                                  .entity_id;
                                            });
                                            print(entityId);
                                          } else {
                                            setState(() {
                                              selectedItem = index;
                                              entityId = widget
                                                  .data["model"]
                                                  .flagReasons[index]
                                                  .entity_id;
                                            });
                                            print("ASdasdasddd");

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
                                        widget.data["model"].flagReasons[index].reason
                                                .toString() ??
                                            "",
                                        style:
                                            Theme.of(context).textTheme.titleLarge,
                                      ),
                                    ),
                                  ]),
                                ),
                              ));
                        },
                      ),
                    Visibility(
                      visible: widget.data["model"].acceptOtherReasons ?? false,
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
                            widget.data["otherFieldPlaceholder"] ?? "",
                            // "Others",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: ((onTapOther) && (widget.data["model"].acceptOtherReasons ?? false)),
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
                                  style: Theme.of(context).textTheme.displaySmall,
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
                                    print(selectedItem);
                                    print("sdakdgaddf");
                                    if ((onTapOther == true) || (selectedItem != null && selectedItem != "")) {
                                      reportMpBloc?.add(
                                          SubmitReportProductEvent(
                                              reasonId: entityId ?? 0,
                                              isOtherReason: onTapOther,
                                              productId: (widget
                                                  .data["productId"] ?? 0),
                                              otherReason:
                                              _reasonController.text.isEmpty
                                                  ? ""
                                                  : _reasonController.text,
                                              customerEmail: _emailController
                                                  .text,
                                              customerName: _nameController
                                                  .text));
                                    } else {
                                      AlertMessage.showWarning(MpStringConstants.pleaseSelectFlagReason ?? '', context);

                                    }
                                  }
                                },
                                child: Center(
                                    child: Text(
                                  Utils.getStringValue(
                                          context, AppStringConstant.submit)
                                      .toUpperCase(),
                                  style: const TextStyle(color: Colors.white),
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
