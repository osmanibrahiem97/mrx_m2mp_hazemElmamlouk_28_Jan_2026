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

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
// import 'package:test_new/mobikul/app_widgets/app_bar.dart';
// import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
// import 'package:test_new/mobikul/app_widgets/loader.dart';
// import 'package:test_new/mobikul/constants/app_constants.dart';
// import 'package:test_new/mobikul/constants/app_string_constant.dart';
// import 'package:test_new/mobikul/helper/app_localizations.dart';
// import 'package:test_new/mobikul/helper/app_storage_pref.dart';
// import 'package:test_new/mobikul/helper/utils.dart';
// import 'package:test_new/mobikul/helper/validator.dart';
// import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
// import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
// import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_bloc.dart';
// import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_event.dart';
// import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/bloc/store_profile_mp_state.dart';
//
// class ReportSeller extends StatefulWidget {
//   final sellerId;
//
//   const ReportSeller(this.sellerId, {super.key});
//   @override
//   State<StatefulWidget> createState() => _ReportSellerState();
// }
//
// class _ReportSellerState extends State<ReportSeller> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _subjectController = TextEditingController();
//   TextEditingController _reasonController = TextEditingController();
//   int? selectedItem;
//   bool onTapOther = false;
//   bool isLoading = false;
//   bool isSubmit = false;
//   late StoreProfileMpModel storeProfileMpModel;
//   late StoreProfileMpBloc storeProfileMpBloc;
//
//   @override
//   void initState() {
//     storeProfileMpBloc = context.read<StoreProfileMpBloc>();
//     storeProfileMpBloc.add(StoreProfileMpFetchEvent(widget.sellerId ?? 0));
//     storeProfileMpModel = StoreProfileMpModel();
//     storeProfileMpBloc = StoreProfileMpBloc();
//     _setInitialControllerValue();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<StoreProfileMpBloc, StoreProfileMpState>(
//         builder: (context, currentState) {
//       if (currentState is StoreProfileMpInitial) {
//         isLoading = true;
//       } else if (currentState is StoreProfileMpSuccess) {
//         isLoading = false;
//         storeProfileMpModel = currentState.storeProfileMpModel;
//         if (kDebugMode) {
//           print("Store Profile Response ::: ");
//           print(storeProfileMpModel!.averageRating);
//         }
//       } else if (currentState is SubmitSellerReportState) {
//         isSubmit = false;
//         WidgetsBinding.instance?.addPostFrameCallback((_) {
//           if (currentState.data.success == true) {
//             AlertMessage.showSuccess(currentState.data.message ?? '', context);
//           } else {
//             AlertMessage.showError(currentState.data.message ?? '', context);
//           }
//         });
//       } else if (currentState is StoreProfileMpError) {
//         isLoading = false;
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           AlertMessage.showError(currentState.message, context);
//         });
//       }
//       return _buildContent(selectedItem);
//     });
//   }
//
//   Widget _buildContent(selectedItem) {
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Theme.of(context).colorScheme.background,
//           appBar: commonAppBar(
//               Utils.getStringValue(context, MpStringConstants.reportSeller),
//               context,
//               isLeadingEnable: false, onPressed: () {
//             Navigator.pop(context);
//           }),
//           body: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     AppTextField(
//                       controller: _nameController,
//                       isRequired: true,
//                       isPassword: false,
//                       hintText:
//                           Utils.getStringValue(context, AppStringConstant.name),
//                       inputType: TextInputType.name,
//                       validation: (value) {
//                         return Validator.isValidName(value ?? '');
//                       },
//                     ),
//                     const SizedBox(height: 15),
//                     TextFormField(
//                       controller: _emailController,
//                       decoration: formFieldDecoration(
//                           context,
//                           "",
//                           Utils.getStringValue(
//                               context, AppStringConstant.email),
//                           isRequired: true),
//                       autovalidateMode: (_emailController.text.isNotEmpty)
//                           ? AutovalidateMode.always
//                           : AutovalidateMode.onUserInteraction,
//                       validator: (value) {
//                         return Validator.isEmailValid(value ?? '', context);
//                       },
//                       onChanged: (value) async {
//                         if (Validator.isEmailValid(value, context) == null) {
//                         } else {}
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     if (storeProfileMpModel.reportData?.sellerFlagReasons !=
//                         null)
//                       Text(
//                         Utils.getStringValue(
//                             context, MpStringConstants.chooseFlagHeading),
//                         style: Theme.of(context).textTheme.headlineMedium,
//                       ),
//                     if (storeProfileMpModel.reportData?.sellerFlagReasons !=
//                         null)
//                       const SizedBox(height: 10),
//                     if (storeProfileMpModel.reportData?.sellerFlagReasons !=
//                         null)
//                       ListView.builder(
//                         shrinkWrap: true,
//                         itemCount: storeProfileMpModel
//                                 .reportData?.sellerFlagReasons?.length ??
//                             0,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(vertical: 3.0),
//                               child: InkWell(
//                                 onTap: () {
//                                   setState(() {
//                                     selectedItem = index;
//                                   });
//                                   if (kDebugMode) {
//                                     print(selectedItem);
//                                   }
//                                 },
//                                 child: Row(children: [
//                                   IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           selectedItem = index;
//                                         });
//                                       },
//                                       icon: index == selectedItem
//                                           ? Icon(Icons.radio_button_checked,
//                                               color: Theme.of(context)
//                                                   .iconTheme
//                                                   .color)
//                                           : Icon(Icons.radio_button_unchecked,
//                                               color: Theme.of(context)
//                                                   .iconTheme
//                                                   .color
//                                                   ?.withOpacity(0.4))),
//                                   Expanded(
//                                     child: Text(
//                                       storeProfileMpModel
//                                               .reportData
//                                               ?.sellerFlagReasons?[index]
//                                               .reason ??
//                                           "",
//                                       style:
//                                           Theme.of(context).textTheme.subtitle1,
//                                     ),
//                                   ),
//                                 ]),
//                               ));
//                         },
//                       ),
//                     Row(children: [
//                       IconButton(
//                           onPressed: () {
//                             setState(() {
//                               onTapOther = !onTapOther;
//                               selectedItem == null;
//                             });
//                           },
//                           icon: onTapOther == true
//                               ? Icon(Icons.radio_button_checked,
//                                   color: Theme.of(context).iconTheme.color)
//                               : Icon(Icons.radio_button_unchecked,
//                                   color: Theme.of(context)
//                                       .iconTheme
//                                       .color
//                                       ?.withOpacity(0.4))),
//                       Expanded(
//                         child: Text(
//                           "Others",
//                           style: Theme.of(context).textTheme.subtitle1,
//                         ),
//                       ),
//                     ]),
//                     const SizedBox(height: 10),
//                     Visibility(
//                       visible: onTapOther,
//                       child: SizedBox(
//                         height: 100,
//                         width: MediaQuery.of(context).size.width,
//                         child: TextFormField(
//                           controller: _reasonController,
//                           keyboardType: TextInputType.multiline,
//                           maxLines: 5,
//                           decoration: InputDecoration(
//                               labelText: Utils.getStringValue(
//                                   context, MpStringConstants.reasonHint),
//                               labelStyle: Theme.of(context)
//                                   .textTheme
//                                   .subtitle2
//                                   ?.copyWith(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 13),
//                               border: const OutlineInputBorder(),
//                               floatingLabelAlignment:
//                                   FloatingLabelAlignment.start,
//                               alignLabelWithHint: true),
//                           onChanged: null,
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter some text';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: AppSizes.size16 * 1.5),
//                     SizedBox(
//                       height: AppSizes.genericButtonHeight,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(
//                             flex: 1,
//                             child: OutlinedButton(
//                                 onPressed: () {
//                                   _nameController.clear();
//                                   _emailController.clear();
//                                   _reasonController.clear();
//                                 },
//                                 child: Center(
//                                     child: Text(
//                                   Utils.getStringValue(
//                                           context, MpStringConstants.reset)
//                                       .toUpperCase(),
//                                   style: Theme.of(context).textTheme.button,
//                                 ))),
//                           ),
//                           const SizedBox(
//                             width: 15.0,
//                           ),
//                           Expanded(
//                             flex: 1,
//                             child: ElevatedButton(
//                                 onPressed: () {
//                                   // if (_formKey.currentState!.validate()) {
//                                   storeProfileMpBloc
//                                       .add(SubmitSellerReportEvent(
//                                     _nameController.text,
//                                     _emailController.text,
//                                     _reasonController.text,
//                                     onTapOther.toString(),
//                                     _reasonController.text,
//                                     widget.sellerId,
//                                   ));
//                                   print(_nameController.text);
//                                   print(_emailController.text);
//                                   print(_reasonController.text);
//                                   print(onTapOther);
//                                   print(widget.sellerId);
//                                 },
//                                 // },
//                                 child: Center(
//                                     child: Text(
//                                   Utils.getStringValue(
//                                           context, AppStringConstant.submit)
//                                       .toUpperCase(),
//                                   style: const TextStyle(color: Colors.white),
//                                 ))),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Visibility(visible: isLoading, child: const Loader())
//       ],
//     );
//   }
//
//   _setInitialControllerValue() {
//     _nameController.text = appStoragePref.getUserData()?.name ?? "";
//     _emailController.text = appStoragePref.getUserData()?.email ?? "";
//   }
// }
