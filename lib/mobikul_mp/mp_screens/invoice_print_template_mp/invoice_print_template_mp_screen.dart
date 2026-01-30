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
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/invoice_print_template_mp/bloc/invoice_print_template_mp_screen_state.dart';
import '../../../mobikul/app_widgets/app_alert_message.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../mp_models/invoice_print_template_mp/invoice_mp_model.dart';
import 'bloc/invoice_print_template_mp_screen_bloc.dart';
import 'bloc/invoice_print_template_mp_screen_event.dart';

class InvoicePrintTemplateMpScreen extends StatefulWidget {
  const InvoicePrintTemplateMpScreen({Key? key}) : super(key: key);

  @override
  State<InvoicePrintTemplateMpScreen> createState() =>
      _InvoicePrintTemplateMpScreenState();
}

class _InvoicePrintTemplateMpScreenState
    extends State<InvoicePrintTemplateMpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  InvoicePrintTemplateMpBloc? _bloc;
  InvoiceMpModel? invoiceMpModel;
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    _bloc = context.read<InvoicePrintTemplateMpBloc>();
    _bloc?.add(const InvoicePrintTemplateMpFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: commonAppBar(
        Utils.getStringValue(
            context, MpStringConstants.invoicePrintTemplateMpTitle),
        context,
        isLeadingEnable: true,
        leadingIcon: Icons.arrow_back,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: _bottomBar(),
      body: _buildMainUi(),
    );
  }

  Widget _buildMainUi() {
    return BlocBuilder<InvoicePrintTemplateMpBloc, InvoicePrintTemplateMpState>(
      builder: (context, currentState) {
        if (currentState is InvoicePrintTemplateMpInitial) {
          isLoading = true;
        } else if (currentState is InvoicePrintTemplateMpSuccess) {
          isLoading = false;
          invoiceMpModel = currentState.data;
          _controller.text = invoiceMpModel?.headerInfo ?? "";
        } else if (currentState is InvoicePrintTemplateMpSaveState) {
          isLoading = false;
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            if (currentState.data.success == true) {
              AlertMessage.showSuccess(
                  currentState.data.message ?? '', context);
              Navigator.pop(context);
            } else {
              AlertMessage.showError(currentState.data.message ?? '', context);
            }
          });
        } else if (currentState is InvoicePrintTemplateMpError) {
          isLoading = false;
          WidgetsBinding.instance?.addPostFrameCallback((_) {
            AlertMessage.showError(currentState.message ?? '', context);
          });
        }
        return (invoiceMpModel != null) ? _buildUI(context) : const Loader();
      },
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: 12,
                      decoration: InputDecoration(
                          labelText: Utils.getStringValue(
                              context, MpStringConstants.pdfHeaderInfo),
                          border: const OutlineInputBorder(),
                          floatingLabelAlignment: FloatingLabelAlignment.start,
                          alignLabelWithHint: true),
                      onChanged: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Utils.getStringValue(
                              context, MpStringConstants.enterSomeTextAlert);
                        }
                        return null;
                      },
                    ),
                  ),
                ))),
        Visibility(
          visible: isLoading,
          child: const Loader(),
        ),
      ],
    );
  }

  Widget _bottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: SizedBox(
        height: AppSizes.genericButtonHeight,
        width: AppSizes.deviceWidth,
        child: ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var pdfHeader = _controller.text
                    .replaceAll('\r', '')
                    .replaceAll(r'\', r'\\')
                    .replaceAll('"', r'\"')
                    .replaceAll('\n', '\\n');

                _bloc?.add(
                    InvoicePrintTemplateMpSaveEvent(pdfHeader));
              }
            },
            child: Center(
              child: Text(
                Utils.getStringValue(context, MpStringConstants.saveInfo),
                style: TextStyle(color:Theme.of(context).textTheme?.labelLarge?.color,),
              ),
            )),
      ),
    );
  }
}
