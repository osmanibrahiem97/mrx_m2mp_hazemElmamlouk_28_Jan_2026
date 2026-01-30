import 'package:flutter/material.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';

class StoreAboutView extends StatelessWidget {
  final StoreProfileMpModel storeProfileMpModel;
  const StoreAboutView({Key? key, required this.storeProfileMpModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return storeProfileMpModel.description == ""
        ? Container(
      color: storeProfileMpModel.backgroundColor != null
          ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
          : const Color(0xFFFFFFFF),
          child: SingleChildScrollView(
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                      Utils.getStringValue(context, MpStringConstants.noAbout)),
                ),
              ),
            ),
        )
        : Container(
      color: storeProfileMpModel.backgroundColor != null
          ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
          : const Color(0xFFFFFFFF),
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1,
                    color:storeProfileMpModel.backgroundColor != null
                        ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
                        : const Color(0xFFFFFFFF),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          Utils.parseHtmlString(
                            storeProfileMpModel.description ?? 'Data Not Found!',
                          ),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
  }
}
