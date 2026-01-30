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
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';

class HeaderInfo extends StatelessWidget {
  final SellerDashboardMpModel? sellerDashboardMpModel;

  const HeaderInfo(
    this.sellerDashboardMpModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Icon(
                      Icons.event_note_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getStringValue(
                              context, MpStringConstants.totalPayout) ??
                          '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      sellerDashboardMpModel?.totalPayout ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Icon(
                      Icons.timelapse_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getStringValue(
                              context, MpStringConstants.remainingAmount) ??
                          '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      sellerDashboardMpModel?.remainingAmount ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Icon(
                      Icons.auto_graph_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Utils.getStringValue(
                              context, MpStringConstants.totalSales) ??
                          '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      sellerDashboardMpModel?.totalPayout ?? '',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
