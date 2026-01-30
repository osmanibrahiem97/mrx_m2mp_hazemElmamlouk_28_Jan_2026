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
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/ask_questions_mp/bloc/ask_question_mp_screen_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/ask_questions_mp/bloc/ask_question_mp_screen_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/ask_questions_mp/bloc/ask_question_mp_screen_state.dart';

class AskQuestionMpScreen extends StatefulWidget {
  const AskQuestionMpScreen({Key? key}) : super(key: key);

  @override
  State<AskQuestionMpScreen> createState() => _AskQuestionMpScreenState();
}

class _AskQuestionMpScreenState extends State<AskQuestionMpScreen> {
  AskQuestionMpBloc? bloc;

  final _formKey = GlobalKey<FormState>();
  late bool _loading;
  final _subjectController = TextEditingController();
  final _queryController = TextEditingController();

  late FocusNode _subjectFocusNode, _queryFocusNode;

  @override
  void dispose() {
    _subjectController.dispose();
    _queryController.dispose();
    super.dispose();
  }

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      bloc?.add(SubmitAskQuestionEvent(_queryController.text.toString() ?? '',
          _subjectController.text.toString() ?? ''));
    } else {
      _focusErrorNode();
    }
  }

  void _focusErrorNode() {
    if (_subjectController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_subjectFocusNode);
    } else if (_queryController.text.isEmpty) {
      FocusScope.of(context).requestFocus(_queryFocusNode);
    }
  }

  @override
  void initState() {
    _loading = false;
    bloc = context.read<AskQuestionMpBloc>();
    _subjectFocusNode = FocusNode();
    _queryFocusNode = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AskQuestionMpBloc, AskQuestionMpState>(
        builder: (context, currentState) {
      if (currentState is AskQuestionLoadingState) {
        _loading = true;
      } else if (currentState is SubmitAskQuestionState) {
        _loading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showSuccess(
              currentState.data.message.toString() == ''
                  ? Utils.getStringValue(
                      context, MpStringConstants.operationSuccessful)
                  : currentState.data.message.toString(),
              context);
          Navigator.pop(context);
        });
      } else if (currentState is AskQuestionErrorState) {
        _loading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      } else if (currentState is SubmitAskQuestionEmptyState) {}

      bloc?.emit(SubmitAskQuestionEmptyState());
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        appBar: commonAppBar(
          Utils.getStringValue(context, MpStringConstants.askQuestions),
          context,
          isLeadingEnable: true,
          leadingIcon: Icons.arrow_back,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottomNavigationBar: SizedBox(
          height: AppSizes.size90,
          width: AppSizes.deviceWidth,
          child: BottomAppBar(
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: SizedBox(
                height: AppSizes.genericButtonHeight,
                width: AppSizes.deviceWidth,
                child: ElevatedButton(
                    onPressed: () {
                      _validateForm();
                    },
                    child: Center(
                      child: Text(
                        Utils.getStringValue(context, MpStringConstants.submit),
                        style: TextStyle(color: Theme.of(context).textTheme?.labelLarge?.color,),
                      ),
                    )),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 5.0),
                      TextFormField(
                        controller: _subjectController,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.subject),
                            border: const OutlineInputBorder(),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                        onChanged: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Utils.getStringValue(
                                context, MpStringConstants.enterSubjectAlert);
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15.0),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          controller: _queryController,
                          keyboardType: TextInputType.text,
                          maxLines: 12,
                          decoration: InputDecoration(
                              labelText: Utils.getStringValue(
                                  context, MpStringConstants.query),
                              border: const OutlineInputBorder(),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              alignLabelWithHint: true),
                          onChanged: null,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Utils.getStringValue(
                                  context, MpStringConstants.enterQueryAlert);
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Visibility(
                visible: _loading == true,
                child: const Center(
                  child: CircularProgressIndicator(),
                )),

          ],
        ),
      );
    });
  }
}
