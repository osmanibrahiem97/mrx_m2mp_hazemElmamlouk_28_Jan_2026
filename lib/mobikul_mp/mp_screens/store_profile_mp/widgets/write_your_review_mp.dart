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
import 'package:test_new/mobikul/app_widgets/rating_bar.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/write_your_review/write_your_review_state.dart';

class WriteYourReviewMp extends StatefulWidget {
  final sellerId;
  final shopUrl;

  WriteYourReviewMp({Key? key, required this.sellerId, required this.shopUrl})
      : super(key: key);

  @override
  _WriteYourReviewMpState createState() => _WriteYourReviewMpState();
}

class _WriteYourReviewMpState extends State<WriteYourReviewMp> {
  WriteYourReviewBloc? writeYourReviewBloc;
  AppLocalizations? _localizations;
  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController nickName = TextEditingController();
  TextEditingController summary = TextEditingController();
  TextEditingController review = TextEditingController();
  double priceRating = 0.0;
  double valueRating = 0;
  double quantityRating = 0;

  @override
  void didChangeDependencies() {
    _localizations = AppLocalizations.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    writeYourReviewBloc = context.read<WriteYourReviewBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteYourReviewBloc, WriteYourReviewState>(
        builder: (context, currentState) {
      if (currentState is WriteYourReviewLoadingState) {
        isLoading = true;
      } else if (currentState is SubmitReviewState) {
        isLoading = false;
        nickName = TextEditingController();
        summary = TextEditingController();
        review = TextEditingController();
        nickName.text = appStoragePref.getUserData()?.firstName ?? '';

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showSuccess(currentState.data.message ?? '', context);
        });
        Navigator.pop(context);
      } else if (currentState is WriteYourReviewErrorState) {
        isLoading = false;
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          AlertMessage.showError(
              currentState.message ??
                  Utils.getStringValue(
                      context, AppStringConstant.somethingWentWrong),
              context);
        });
      } else if (currentState is WriteYourReviewEmptyState) {}

      writeYourReviewBloc?.emit(WriteYourReviewEmptyState());
      return _buildUI();
    });
  }

  Widget _buildUI() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: commonAppBar(
            _localizations?.translate(MpStringConstants.writeYourReview) ?? "",
            context,
            isElevated: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.spacingNormal),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: AppSizes.spacingGeneric,
                  ),
                  Text(_localizations?.translate(MpStringConstants.title) ?? "",
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(
                    height: AppSizes.spacingLarge,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                            _localizations
                                    ?.translate(AppStringConstant.price) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(":",
                              style: Theme.of(context).textTheme.bodyLarge)),
                      Expanded(
                        flex: 4,
                        child: RatingBar(
                          starCount: 5,
                          color: AppColors.yellow,
                          rating: priceRating,
                          onRatingChanged: (_rating) {
                            print("_rating-------${_rating}");
                            priceRating = _rating;
                            print("priceRating-------${priceRating}");

                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spacingNormal,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                            _localizations
                                    ?.translate(MpStringConstants.value) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(":",
                              style: Theme.of(context).textTheme.bodyLarge)),
                      Expanded(
                        flex: 4,
                        child: RatingBar(
                          starCount: 5,
                          color: AppColors.yellow,
                          rating: valueRating,
                          onRatingChanged: (_rating) {
                            valueRating = _rating;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spacingNormal,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                            _localizations
                                    ?.translate(AppStringConstant.quantity) ??
                                "",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                      Expanded(
                          flex: 1,
                          child: Text(":",
                              style: Theme.of(context).textTheme.bodyLarge)),
                      Expanded(
                        flex: 4,
                        child: RatingBar(
                          starCount: 5,
                          color: AppColors.yellow,
                          rating: quantityRating,
                          onRatingChanged: (_rating) {
                            quantityRating = _rating;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: AppSizes.spacingNormal,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      AppTextField(
                        controller: nickName,
                        isPassword: false,
                        hintText: _localizations
                                ?.translate(AppStringConstant.nickName) ??
                            "",
                        isRequired: true,
                      ),
                      const SizedBox(
                        height: AppSizes.spacingGeneric,
                      ),
                      AppTextField(
                        controller: summary,
                        isPassword: false,
                        hintText: _localizations
                                ?.translate(AppStringConstant.summary) ??
                            "",
                        isRequired: false,
                      ),
                      const SizedBox(
                        height: AppSizes.spacingGeneric,
                      ),
                      AppTextField(
                        controller: review,
                        isPassword: false,
                        hintText: _localizations
                                ?.translate(AppStringConstant.review) ??
                            "",
                        isRequired: false,
                        minLine: 4,
                        maxLine: 20,
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: AppSizes.spacingNormal,
                  ),
                  SizedBox(
                    height: AppSizes.genericButtonHeight,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true) {
                          writeYourReviewBloc?.add(SubmitWriteYourReviewEvent(
                            widget.shopUrl,
                            nickName.text.toString() ?? '',
                            summary.text.toString() ?? '',
                            widget.sellerId,
                            priceRating * 20,
                            valueRating * 20,
                            review.text.toString() ?? '',
                            appStoragePref.getUserData()?.email ?? '',
                            quantityRating * 20,
                          ));
                        }
                      },
                      child: Center(
                        child: Text(
                          (_localizations?.translate(
                                      MpStringConstants.submitReview) ??
                                  "")
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Visibility(visible: isLoading, child: const Loader())
      ],
    );
  }
}
