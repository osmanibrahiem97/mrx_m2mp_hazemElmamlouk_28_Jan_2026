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
import 'package:test_new/mobikul/app_widgets/app_outlined_button.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/loader.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/helper/validator.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_to_us/write_to_us_state.dart';

class WriteToUsView extends StatefulWidget {
  final int sellerId;
  const WriteToUsView(this.sellerId, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WriteToUsViewState();
}

class _WriteToUsViewState extends State<WriteToUsView> {
  WriteToUsBloc? bloc;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _queryController = TextEditingController();

  late FocusNode _nameFocusNode,
      _emailFocusNode,
      _subjectFocusNode,
      _queryFocusNode;

  late AppLocalizations? _localizations;
  late bool _loading;
  late GlobalKey<FormState> _formKey;
  String? emailErrorMessage;

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      bloc?.add(SubmitWriteToUsEvent(_queryController.text.toString() ?? '',
          _subjectController.text.toString() ?? '', widget.sellerId));
    } else {
      _focusErrorNode();
    }
  }

  void _focusErrorNode() {
    if (_nameController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_nameFocusNode);
    } else if (_emailController.text.isEmpty && emailErrorMessage != null) {
      FocusScope.of(context).requestFocus(_emailFocusNode);
    } else if (_subjectController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_subjectFocusNode);
    } else if (_queryController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_queryFocusNode);
    }
  }

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _loading = false;
    _formKey = GlobalKey();
    bloc = context.read<WriteToUsBloc>();
    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _subjectFocusNode = FocusNode();
    _queryFocusNode = FocusNode();
    _setInitialControllerValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteToUsBloc, WriteToUsState>(
        builder: (context, currentState) {
      if (currentState is WriteToUsLoadingState) {
        _loading = true;
        bloc?.emit(SubmitWriteToUsEmptyState());
      } else if (currentState is SubmitWriteToUsState) {
        _loading = false;

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showSuccess(currentState.data.message ?? '', context);
        });
        bloc?.emit(SubmitWriteToUsEmptyState());
      } else if (currentState is WriteToUsErrorState) {
        _loading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(
              currentState.message ??
                  Utils.getStringValue(
                      context, AppStringConstant.somethingWentWrong),
              context);
        });
        bloc?.emit(SubmitWriteToUsEmptyState());
      } else if (currentState is SubmitWriteToUsEmptyState) {}

      bloc?.emit(SubmitWriteToUsEmptyState());
      return _buildContent();
    });
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: commonAppBar(
              Utils.getStringValue(context, MpStringConstants.writeToUs),
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
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      focusNode: _nameFocusNode,
                      controller: _nameController,
                      decoration: formFieldDecoration(context, "",
                          Utils.getStringValue(context, AppStringConstant.name),
                          isRequired: true),
                      autovalidateMode: (_emailController.text.isNotEmpty)
                          ? AutovalidateMode.always
                          : AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      focusNode: _emailFocusNode,
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
                          // var wkToken = await AppSharedPref.getWkToken();
                          // bloc?.add(CheckEmailEvent(value, wkToken));
                        } else {
                          emailErrorMessage = null;
                        }
                      },
                    ),
                    if (emailErrorMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          emailErrorMessage!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.red),
                        ),
                      ),
                    const SizedBox(height: AppSizes.size16),
                    AppTextField(
                      focusNode: _subjectFocusNode,
                      controller: _subjectController,
                      isPassword: false,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.subject),
                      isRequired: false,
                      inputType: TextInputType.text,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Subject';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSizes.size16),
                    AppTextField(
                      focusNode: _queryFocusNode,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.query),
                      controller: _queryController,
                      isRequired: false,
                      isPassword: false,
                      minLine: 3,
                      maxLine: 5,
                      inputType: TextInputType.text,
                      validation: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Query';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSizes.size16 * 1.5),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                          onPressed: () {
                            _validateForm();
                          },
                          child: Center(
                              child: Text(
                            Utils.getStringValue(
                                    context, AppStringConstant.submit)
                                .toUpperCase(),
                            style: TextStyle(color:Theme.of(context).textTheme.labelLarge?.color),
                          ))),
                    ),
                    const SizedBox(height: AppSizes.size16),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(visible: _loading, child: const Loader())
      ],
    );
  }

  _setInitialControllerValue() {
    _nameController.text = appStoragePref.getUserData()?.name ?? "";
    _emailController.text = appStoragePref.getUserData()?.email ?? "";
  }
}
