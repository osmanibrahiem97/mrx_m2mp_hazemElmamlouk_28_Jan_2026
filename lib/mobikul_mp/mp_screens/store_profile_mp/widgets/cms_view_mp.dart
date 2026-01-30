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
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/helper/utils.dart';

class CmsViewMp extends StatefulWidget {
  final String title, htmlText;
  const CmsViewMp({required this.title, required this.htmlText, Key? key})
      : super(key: key);

  @override
  State<CmsViewMp> createState() => _CmsViewMpState();
}

class _CmsViewMpState extends State<CmsViewMp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: commonAppBar(widget.title, context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Text(
              Utils.parseHtmlString(widget.htmlText),
              style: Theme.of(context).textTheme.bodyMedium,
            )),
          ),
        ));
  }
}
