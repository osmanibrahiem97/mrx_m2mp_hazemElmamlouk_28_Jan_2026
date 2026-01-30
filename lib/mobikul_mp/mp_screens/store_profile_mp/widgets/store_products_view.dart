import 'package:flutter/material.dart';
import 'package:test_new/main.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/constants/arguments_map.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul/screens/catalog/widget/catalog_grid_view.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';

class StoreProductsView extends StatelessWidget {
  final StoreProfileMpModel storeProfileMpModel;
  final ScrollController scrollController;
  const StoreProductsView(
      {Key? key,
      required this.storeProfileMpModel,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return storeProfileMpModel?.recentProductList == null
        ? Container(
      color: storeProfileMpModel.backgroundColor != null
          ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
          : const Color(0xFFFFFFFF),
          child: SingleChildScrollView(
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(Utils.getStringValue(
                      context, MpStringConstants.noProducts)),
                ),
              ),
            ),
        )
        : Container(
      color: storeProfileMpModel.backgroundColor != null
        ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
        : const Color(0xFFFFFFFF),
          child: SingleChildScrollView(
              controller: scrollController,
              // physics: const NeverScrollableScrollPhysics(),
              child: Container(
                color: storeProfileMpModel.backgroundColor != null
                    ? Color(int.parse(storeProfileMpModel.backgroundColor!.replaceAll('#', '0xFF')))
                    : const Color(0xFFFFFFFF),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Utils.getStringValue(
                              context, MpStringConstants.recentlyAdded)),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(navigatorKey.currentContext!,
                                  AppRoutes.catalogMp,
                                  arguments: getCatalogMap(
                                    storeProfileMpModel?.sellerId.toString() ??
                                        "",
                                    Utils.parseHtmlString(
                                        storeProfileMpModel?.shopTitle ?? ""),
                                    "",
                                    false,
                                  ));
                            },
                            child: Text(
                              Utils.getStringValue(
                                      context, AppStringConstant.viewAll),
                              style: TextStyle(color: Theme.of(context).textTheme!.labelLarge?.color),
                            ),
                          )
                        ],
                      ),
                    ),
                    CatalogGridView(
                      isStoreView:true,
                      products: storeProfileMpModel.recentProductList,
                    ),
                  ],
                ),
              ),
            ),
        );
  }
}
