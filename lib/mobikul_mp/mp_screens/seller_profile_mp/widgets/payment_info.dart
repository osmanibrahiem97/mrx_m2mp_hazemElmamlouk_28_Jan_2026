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
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_state.dart';

class PaymentInfo extends StatefulWidget {
  const PaymentInfo({
    super.key,
  });

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  ///TextFieldController
  TextEditingController paymentDetailController = TextEditingController();

  late SellerProfileMpModel sellerProfileMpModel;
  late SellerProfileMpBloc sellerProfileMpBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
              "Controller Information ---> \nPayment Detail : ${sellerProfileMpModel.paymentDetails ?? ''}");
          paymentDetailController.text =
              sellerProfileMpModel.paymentDetails ?? '';
        }
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
                Utils.getStringValue(context, MpStringConstants.paymentInfo)
                        .toUpperCase() ??
                    '',
                style: Theme.of(context).textTheme.titleLarge),
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          controller: paymentDetailController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          decoration: InputDecoration(
                              labelText: Utils.getStringValue(
                                  context, MpStringConstants.metaKeyword),
                              border: const OutlineInputBorder(),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.start,
                              alignLabelWithHint: true),
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return Utils.getStringValue(context,
                          //         MpStringConstants.metaKeywordErrorMsg);
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ]),
              )
            ]),
      );
    });
  }
}
