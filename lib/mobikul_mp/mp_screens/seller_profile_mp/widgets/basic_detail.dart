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
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/country_list_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_state.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({
    super.key,
  });

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  ///TextFieldController
  TextEditingController shopTitleController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();
  TextEditingController taxOrVatNumberController = TextEditingController();
  TextEditingController shopLocalityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  late SellerProfileMpModel sellerProfileMpModel;
  late SellerProfileMpBloc sellerProfileMpBloc;

  ///Choose Country
  String? selectedCountry;
  List<dynamic> countryList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sellerProfileMpBloc = context.read<SellerProfileMpBloc>();
    sellerProfileMpBloc.add(const SellerProfileMpFetchEvent());
    sellerProfileMpModel = SellerProfileMpModel();
    sellerProfileMpBloc = SellerProfileMpBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SellerProfileMpBloc, SellerProfileMpState>(
        builder: (context, currentState) {
      if (currentState is SellerProfileMpInitial) {
      } else if (currentState is SellerProfileMpSuccess) {
        sellerProfileMpModel = currentState.sellerProfileMpModel;
        if (kDebugMode) {
          print(
              "Controller Information ---> \nShop Title : ${sellerProfileMpModel.shopTitle ?? ''}\nContact Number : ${sellerProfileMpModel.contactNumber ?? ''}\nTax/Vat Number : ${sellerProfileMpModel.taxvat ?? ''}\nShop Locality : ${sellerProfileMpModel.companyLocality ?? ''}\nCountry : ${sellerProfileMpModel.shopTitle ?? ''}\nCompany Description : ${sellerProfileMpModel.companyDescription ?? ''}");
        }
        shopTitleController.text = sellerProfileMpModel.shopTitle ?? '';
        contactNoController.text = sellerProfileMpModel.contactNumber ?? '';
        taxOrVatNumberController.text = sellerProfileMpModel.taxvat ?? '';
        shopLocalityController.text =
            sellerProfileMpModel.companyLocality ?? '';
        countryController.text = sellerProfileMpModel.country ?? '';
        descriptionController.text = Utils.parseHtmlString(
            sellerProfileMpModel.companyDescription ?? '');
        countryList = sellerProfileMpModel.countryList ?? [];
        selectedCountry = sellerProfileMpModel.country ?? '';
      } else if (currentState is SellerProfileMpError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AlertMessage.showError(currentState.message, context);
        });
      }
      return Container(
        color: Theme.of(context).cardColor,
        child: ExpansionTile(
            initiallyExpanded: false,
            title: Text(
                Utils.getStringValue(context, MpStringConstants.basicDetail)
                        .toUpperCase() ??
                    '',
                style: Theme.of(context).textTheme.titleLarge),
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        isPassword: false,
                        controller: shopTitleController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.shopTitle),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: contactNoController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.contactNumber),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: taxOrVatNumberController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.taxOrVatNumber),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        isPassword: false,
                        controller: shopLocalityController,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.shopLocality),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        Utils.getStringValue(
                            context, MpStringConstants.country_),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: DropdownButtonFormField<String>(
                            borderRadius: BorderRadius.circular(5.0),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                            ),
                            value: selectedCountry,
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value!;
                              });
                            },
                            iconEnabledColor: Colors.grey,
                            iconDisabledColor: Colors.grey,
                            items: countryList
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item.value.toString(),
                                    child: Text(item.label,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                  ),
                                )
                                .toList(),
                            validator: (value) {
                              if (value == null) {
                                // if ((accountInfoModel?.isPrefixVisible ?? false) &&
                                //     (accountInfoModel?.prefixHasOptions ?? false) &&
                                //     (accountInfoModel?.isPrefixRequired ?? false))
                                return Utils.getStringValue(
                                    context, AppStringConstant.required);
                                // add validation with return statement
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                          height: AppSizes.deviceWidth / 3.5,
                          width: AppSizes.deviceWidth / 3.5,
                          child: ImageView(
                            isBottomPadding: false,
                            fit: BoxFit.fill,
                            url: sellerProfileMpModel.flagImageUrl ?? '',
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          controller: descriptionController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 12,
                          decoration: InputDecoration(
                              labelText: Utils.getStringValue(
                                  context, MpStringConstants.description),
                              border: const OutlineInputBorder(),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              alignLabelWithHint: true),
                        ),
                      ),
                    ]),
              )
            ]),
      );
    });
  }
}
