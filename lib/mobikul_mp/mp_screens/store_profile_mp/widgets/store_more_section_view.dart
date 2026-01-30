import 'package:flutter/material.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_arguments_map.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/store_profile_mp/widgets/cms_view_mp.dart';

class StoreMoreSectionView extends StatelessWidget {
  final StoreProfileMpModel storeProfileMpModel;
  final Map<String, dynamic> arguments;
  const StoreMoreSectionView(
      {Key? key, required this.storeProfileMpModel, required this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: storeProfileMpModel.backgroundColor != null
          ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
          : const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        child: Container(
            color: storeProfileMpModel.backgroundColor != null
                ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
                : const Color(0xFFFFFFFF),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  if(storeProfileMpModel.isSellerPoliciesEnabled == true)...[
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          Utils.getStringValue(context, MpStringConstants.policies)
                              .toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CmsViewMp(
                                  title: Utils.getStringValue(
                                      context, MpStringConstants.shippingPolicy),
                                  htmlText: storeProfileMpModel.shippingPolicy ??
                                      Utils.getStringValue(
                                          context, MpStringConstants.noDataFound),
                                )),
                          );
                        },
                        child: ListTile(
                          title: Text(
                              Utils.getStringValue(
                                  context, MpStringConstants.shippingPolicy),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          ),
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CmsViewMp(
                                  title: Utils.getStringValue(
                                      context, MpStringConstants.privacyPolicy),
                                  htmlText: storeProfileMpModel.privacyPolicy ??
                                      Utils.getStringValue(
                                          context, MpStringConstants.noDataFound),
                                )),
                          );
                        },
                        child: ListTile(
                          title: Text(
                              Utils.getStringValue(
                                  context, MpStringConstants.privacyPolicy),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          ),
                        ),
                      ),
                      const Divider(),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CmsViewMp(
                                  title: Utils.getStringValue(
                                      context, MpStringConstants.returnPolicy),
                                  htmlText: storeProfileMpModel.returnPolicy ??
                                      Utils.getStringValue(
                                          context, MpStringConstants.noDataFound),
                                )),
                          );
                        },
                        child: ListTile(
                          title: Text(
                              Utils.getStringValue(
                                  context, MpStringConstants.returnPolicy),
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 12,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                  ],

                  const SizedBox(height: 10.0),
                  Text(
                      Utils.getStringValue(context, MpStringConstants.contactUs)
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.writeToUs,
                          arguments: (arguments[sellerIdKey] ?? 0));
                    },
                    child: ListTile(
                      title: Text(
                          Utils.getStringValue(
                              context, MpStringConstants.writeToUs),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 12,
                      ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            )),
      ),
    );
  }
}
