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
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/image_role.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/media_gallery.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/product_data.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_event.dart';

class EditImageInfoMp extends StatefulWidget {
  final data;

  const EditImageInfoMp(this.data, {Key? key}) : super(key: key);

  @override
  State<EditImageInfoMp> createState() => _EditImageInfoMpState();
}

class _EditImageInfoMpState extends State<EditImageInfoMp> {
  bool isLoading = false;

  ///TextFieldController
  TextEditingController altTextController = TextEditingController();

  List<String>? itemList = [];

  bool? isBase = false;
  bool isSmall = false;
  bool isThumbnail = false;
  bool isSwatch = false;
  String baseImage = '';
  String smallImage = '';
  String swatchImage = '';
  String thumbnail = '';

  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  checkStatus() {
    if (widget.data["model"]?.productData?.baseImage.toString() == widget.data['file'].toString()) {
      setState(() {
        isBase = true;
        baseImage = widget.data['file'];
      });
    }
    if (widget.data["model"]?.productData?.smallImage.toString() == widget.data['file'].toString()) {
      isSmall = true;
      smallImage = widget.data['file'];
    }
    if (widget.data["model"]?.productData?.thumbnail.toString() == widget.data['file'].toString()) {
      isThumbnail = true;
      thumbnail = widget.data['file'];
    }
    if (widget.data["model"]?.productData?.swatchImage.toString() == widget.data['file'].toString()) {
      isSwatch = true;
      swatchImage = widget.data['file'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(
        Utils.getStringValue(context, MpStringConstants.editImageInfo),
        context,
        isLeadingEnable: true,
        leadingIcon: Icons.arrow_back,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: AppSizes.deviceHeight / 2,
                width: AppSizes.deviceWidth / 1,
                child: ImageView(
                    isBottomPadding: false,
                    fit: BoxFit.fitWidth,
                    borderRadius: BorderRadius.circular(0),
                    url: widget.data['model']?.productData
                        ?.mediaGallery[widget.data['index']].url ??
                        '')),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                child: SizedBox(
                  height: AppSizes.deviceWidth / 3.5,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: altTextController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: InputDecoration(
                        labelText: Utils.getStringValue(
                            context, MpStringConstants.altText),
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        border: const OutlineInputBorder(),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        alignLabelWithHint: true),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            if (widget.data['model']?.imageRole != null)
              Container(
                  color: Theme.of(context).cardColor,
                  child: ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                          Utils.getStringValue(context, MpStringConstants.role)
                              .toUpperCase() ??
                              '',
                          style: Theme.of(context).textTheme.titleLarge),
                      children: [

                        CheckboxListTile(
                          activeColor: Theme.of(context).iconTheme.color,
                          title: Text(
                            widget.data['model']?.imageRole?[0].label ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          value: isBase,
                          onChanged: (newValue) {
                            setState(() {
                              if (newValue == true) {
                                isBase = true;
                                baseImage = widget.data['file']??'';
                              } else {
                                isBase = false;
                                baseImage = '';
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          activeColor: Theme.of(context).iconTheme.color,
                          title: Text(
                            widget.data['model']?.imageRole?[1].label ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          value: isSmall,
                          onChanged: (newValue) {
                            setState(() {
                              if (newValue == true) {
                                isSmall = true;
                                smallImage = widget.data['file']??'';
                              } else {
                                isSmall = false;
                                smallImage = '';
                              }
                            });
                          },
                        ),
                        CheckboxListTile(
                          activeColor: Theme.of(context).iconTheme.color,
                          title: Text(
                            widget.data['model']?.imageRole?[2].label ?? '',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          value: isThumbnail,
                          onChanged: (newValue) {
                            setState(() {
                              if (newValue == true) {
                                isThumbnail = true;
                                thumbnail = widget.data['file']??'';
                              } else {
                                isThumbnail = false;
                                thumbnail = '';
                              }
                            });
                          },
                        ),
                        if (widget.data['productId'] != null && (widget.data['productId']??"").toString() != "0")
                          CheckboxListTile(
                            activeColor: Theme.of(context).iconTheme.color,
                            title: Text(
                              widget.data['model']?.imageRole?[3].label ?? '',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            value: isSwatch,
                            onChanged: (newValue) {
                              setState(() {
                                if (newValue == true) {
                                  isSwatch = true;
                                  swatchImage = widget.data['file']??'';
                                } else {
                                  isSwatch = false;
                                  swatchImage = '';
                                }
                              });
                            },
                          ),
                      ])),
            const SizedBox(
              height: 15.0,
            ),
            Container(
                color: Theme.of(context).cardColor,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    child: SizedBox(
                      height: AppSizes.genericButtonHeight - 5.0,
                      child: ElevatedButton(
                        child: Center(
                          child: Text(
                            Utils.getStringValue(
                                context, AppStringConstant.save)
                                .toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          if (isBase??false) {
                            widget.data["model"]?.productData?.baseImage = baseImage;
                          }
                          if (isSmall??false) {
                            widget.data["model"]?.productData?.smallImage = smallImage;
                          }
                          if (isThumbnail??false) {
                            widget.data["model"]?.productData?.thumbnail = thumbnail;
                          }
                          if (isSwatch??false) {
                            widget.data["model"]?.productData?.swatchImage = swatchImage;
                          }
                          var imageList = [
                            baseImage,
                            smallImage,
                            thumbnail,
                            swatchImage,
                          ];
                          Navigator.pop(context, imageList);
                        },
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
