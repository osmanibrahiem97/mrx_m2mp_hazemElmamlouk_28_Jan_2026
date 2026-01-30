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
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/become_seller/bloc/become_seller_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/become_seller/bloc/become_seller_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/become_seller/bloc/become_seller_state.dart';

import '../../../mobikul/constants/app_routes.dart';

class BecomeSellerScreen extends StatefulWidget {
  const BecomeSellerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BecomeSellerScreenState();
}

class _BecomeSellerScreenState extends State<BecomeSellerScreen> {
  BecomeSellerBloc? bloc;
  TextEditingController _shopUrlController = TextEditingController();
  final pattern = RegExp(r'^[a-zA-Z0-9.]+$');
  String validationMessage = '';
  late FocusNode _shopUrlFocusNode;
  late bool _loading;
  late GlobalKey<FormState> _formKey;

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      if (pattern.hasMatch(_shopUrlController.text)) {
        bloc?.add(
            SubmitBecomeSellerEvent(_shopUrlController.text.toString() ?? ''));
      } else {
        validationMessage =
            Utils.getStringValue(context, AppStringConstant.invalidShopLink);
      }
    } else {
      _focusErrorNode();
    }
  }

  void validateTextField(String value) {
    setState(() {
      if (value.isEmpty) {
        validationMessage = Utils.getStringValue(
            context, AppStringConstant.becomeSellerTextFieldNullValidation);
      } else if (!pattern.hasMatch(value)) {
        validationMessage =
            Utils.getStringValue(context, AppStringConstant.invalidShopLink);
      } else {
        validationMessage = '';
      }
    });
  }

  void _focusErrorNode() {
    if (_shopUrlController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_shopUrlFocusNode);
    }
  }

  @override
  void initState() {
    _loading = false;
    _formKey = GlobalKey();
    bloc = context.read<BecomeSellerBloc>();
    _shopUrlFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BecomeSellerBloc, BecomeSellerState>(
        builder: (context, currentState) {
      if (currentState is BecomeSellerLoadingState) {
        _loading = true;
      } else if (currentState is SubmitBecomeSellerState) {
        _loading = false;
        _shopUrlController = TextEditingController();

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showSuccess(currentState.data.message ?? '', context);
          // Navigator.pop(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.bottomTabBar, (route) => false);
        });
      } else if (currentState is BecomeSellerErrorState) {
        _loading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(
              currentState.message.toString() == ''
                  ? Utils.getStringValue(
                      context, AppStringConstant.somethingWentWrong)
                  : currentState.message.toString(),
              context);
        });
      } else if (currentState is SubmitBecomeSellerEmptyState) {}

      bloc?.emit(SubmitBecomeSellerEmptyState());
      return _buildContent();
    });
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: commonAppBar(
              Utils.getStringValue(context, MpStringConstants.becomeSeller),
              context,
              isLeadingEnable: false, onPressed: () {
            Navigator.pop(context);
          }),
          body: Padding(
              padding: const EdgeInsets.all(15),
              child: appStoragePref.isPendingSeller()
                  ? _pendingProfileApprovalView()
                  : appStoragePref.isDisapproved()
                      ? _profileDisApprovedView()
                      : _becomeSellerFormView()),
        ),
        Visibility(visible: _loading, child: const Loader())
      ],
    );
  }

  _becomeSellerFormView() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              focusNode: _shopUrlFocusNode,
              controller: _shopUrlController,
              decoration: InputDecoration(
                errorText:
                    validationMessage.isNotEmpty ? validationMessage : null,
                hintText: Utils.getStringValue(
                  context,
                  MpStringConstants.shopUrl,
                ),
                labelText: (Utils.getStringValue(
                          context,
                          MpStringConstants.shopUrl,
                        ) ??
                        "") +
                    ((true ?? false) && (true != '') ? "*" : ""),
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                enabled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    )),
                //
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.5)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return Utils.getStringValue(
                      context, MpStringConstants.enterShopUrlAlter);
                }
                return null;
              },
              onChanged: validateTextField,
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                  onPressed: () {
                    _validateForm();
                  },
                  child: Center(
                      child: Text(
                    Utils.getStringValue(context, AppStringConstant.save)
                        .toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ))),
            ),
            const SizedBox(height: AppSizes.size16),
          ],
        ),
      ),
    );
  }

  _pendingProfileApprovalView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          Utils.getStringValue(
              context, MpStringConstants.profileApprovalPendingText),
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _profileDisApprovedView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          Utils.getStringValue(
              context, MpStringConstants.profileApprovalCancelledText),
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
