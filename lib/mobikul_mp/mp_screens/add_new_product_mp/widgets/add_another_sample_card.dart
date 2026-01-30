/*
* Webkul Software.
*
@package Mobikul Application Code.
* @Category Mobikul
* @author Webkul <support@webkul.com>
* @Copyright (c) Webkul Software Private Limited (https://webkul.com)
* @license https://store.webkul.com/license.html
* @link https://store.webkul.com/license.html
*
*/
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../mobikul/app_widgets/app_text_field.dart';
import '../../../../mobikul/constants/app_string_constant.dart';
import '../../../../mobikul/helper/utils.dart';
import '../../../mp_constants/mp_string_constants.dart';
import '../../../mp_widgets/mp_alert_dialog.dart';
import '../bloc/add_new_product_mp_bloc.dart';
import '../bloc/add_new_product_mp_event.dart';

class AddAnotherSampleCard extends StatefulWidget {
  final addAnotherSampleModel;
  AddNewProductMpBloc? addNewProductMpBloc;
  final Function(int)? onRemove;
  final int? index;



  AddAnotherSampleCard({Key? key, this.addAnotherSampleModel,this.addNewProductMpBloc,this.onRemove,this.index})
      : super(key: key);
  @override
  State<AddAnotherSampleCard> createState() => _AddAnotherSampleCardState();
}

class _AddAnotherSampleCardState extends State<AddAnotherSampleCard> {
  TextEditingController titleOfSampleController = TextEditingController();
  TextEditingController urlofSampleController = TextEditingController();
  TextEditingController anotherSampleFileController = TextEditingController();

  String? selectedSampleTypeValue = "\"url\"" ;
  String? fileEncoded;
  String? fileName;
  ///SAMPLE TYPE
  List<dynamic> sampleTypeValueList = [
    {
      'label': 'Sample Type - Link',
      'value': "\"url\""
      //'url',
    } ,
    {
      'label': 'Sample Type - Upload',
      'value': "\"file\"",
    }
  ];
  final ImagePicker _picker = ImagePicker();
  File? productImage;

  @override
  void initState() {
    super.initState();

    print("Seprate Sample Data-----${widget.addAnotherSampleModel}");

    anotherSampleFileController.text = widget.addAnotherSampleModel["file"].length > 0 ? widget.addAnotherSampleModel["file"][0]["file"] : "";
    // (widget.addAnotherSampleModel["file"][0]["file"]);

    print("asdf---${widget.addAnotherSampleModel["file"]}");

    titleOfSampleController.text = (widget.addAnotherSampleModel["title"]).toString().replaceAll("\"", "");
    urlofSampleController.text = (widget.addAnotherSampleModel["sample_url"]).toString().replaceAll("\"", " ");
    // urlofSampleController.text = TextEditingController(text: widget.addAnotherSampleModel["sample_url"]).toString().replaceAll("\"", " "))
    //(widget.addAnotherSampleModel["sample_url"]).toString().replaceAll("\"", " ");
    if(widget.addAnotherSampleModel["type"] == "url"){
      selectedSampleTypeValue = "\"${widget.addAnotherSampleModel["type"]}\"";
      print("type--widget.addAnotherSampleModel${widget.addAnotherSampleModel["type"]}");
    } else{
      // var data =
      selectedSampleTypeValue = widget.addAnotherSampleModel["type"];
      print("gsjfgf----${selectedSampleTypeValue}");
      print("asdfa---${widget.addAnotherSampleModel.toString()}");
      print("widget.addAnotherSampleModel${widget.addAnotherSampleModel["type"]}");

      // selectedSampleTypeValue = "\"${widget.addAnotherSampleModel["type"]}\"";
    }


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {

                      // widget.addAnotherSampleModel?["isVisible"] =
                      // item?.isVisible = !item.isVisible;
                    });
                  },
                  icon: const Icon(Icons.notes)),
              SizedBox(
                width: 100,
                height: 45,
                child: TextField(
                  controller: titleOfSampleController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabled: false),
                  onChanged: (value){
                    setState(() {
                      if (widget.onRemove != null) {
                        widget.onRemove!(widget.index ?? 0);
                      }
                      print("---------123${value}");


                      // widget.addAnotherSampleModel?['title'] = "\"${value}\"";

                    });
                  },
                ),
              )
            ],
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) =>
                        MpAlertDialog(
                          title: Utils.getStringValue(context,
                              MpStringConstants.removeItemDialogTitle),
                          barrierDismissible: false,
                          onConfirm: () {
                            if (widget.onRemove != null) {
                              widget.onRemove!(widget.index ?? 0);
                            }
                            // addAnotherSampleItemList.removeAt(index);
                          },
                          onCancel: () {
                            Navigator.pop(context);
                          },
                          msg: Utils.getStringValue(context,
                              MpStringConstants.removeItemDialogMsg),
                        ));
              },
              icon: const Icon(Icons.highlight_remove_outlined,
                  color: Colors.red)),
        ]),

        Visibility(
            visible: true,
            //item!.isVisible,
            child: Column(children: [
              AppTextField(
                isPassword: false,
                controller: titleOfSampleController,
                isRequired: false,
                hintText:
                Utils.getStringValue(context, MpStringConstants.title_),
                onChange: (value){
                  widget.addAnotherSampleModel?['title'] = "\"${value}\"";

                  // anotherSampleTitleController.text = value;
                },

              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                    value: selectedSampleTypeValue,
                    onChanged: (value) {
                      setState(() {
                        selectedSampleTypeValue = value!;
                        widget.addAnotherSampleModel["type"] = selectedSampleTypeValue;
                      });
                    },
                    hint: const Text(
                      "",
                    ),
                    items: sampleTypeValueList
                        .map(
                          (item) =>
                          DropdownMenuItem<String>(
                            value: item['value'],
                            child: Text(item['label'],
                                style:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge),
                            onTap: () {
                              setState(() {
                                selectedSampleTypeValue = item['value'];
                              });
                              if (kDebugMode) {
                                print(
                                    'TEST LOG ::: selectedSampleTypeValue => $selectedSampleTypeValue');
                              }
                            },
                          ),
                    )
                        .toList(),
                  ),
                ),
              ),
              Visibility(
                  visible: selectedSampleTypeValue == "\"file\"",
                  child: const SizedBox(height: 10)),
              Visibility(
                visible: selectedSampleTypeValue == "\"file\"",
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 1,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: SizedBox(
                              height: 50,
                              child: TextField(
                                  controller: anotherSampleFileController,
                                  decoration: InputDecoration(
                                    hintText: Utils.getStringValue(
                                      context,
                                      MpStringConstants.sampleFile,
                                    ),
                                    border: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  )),
                            ),
                          )),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: ElevatedButton(
                            onPressed: () {
                              _showChoiceBottomSheet(context, (value) {
                                if (kDebugMode) {
                                  widget.addNewProductMpBloc?.add(
                                      SampleFileUploadMpEvent(fileName!,"samples",fileEncoded!));
                                  anotherSampleFileController.text = fileName ?? "";
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(4.0),
                                    bottomRight: Radius.circular(4.0),
                                  ),
                                )),
                            child: Center(
                                child: Text(
                                  Utils.getStringValue(
                                    context,
                                    MpStringConstants.upload,
                                  ),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ))),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Visibility(
                visible: selectedSampleTypeValue == "\"url\"",
                child: Column(
                  children: [
                    AppTextField(
                      isPassword: false,
                      controller: urlofSampleController,
                      isRequired: false,
                      hintText:
                      Utils.getStringValue(context, MpStringConstants.url),
                      onChange: (value){
                        widget.addAnotherSampleModel["sample_url"] = "\"${value.toString()}\"";

                        // anotherSampleUrlController.text = value;
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              // const SizedBox(height: 10),
            ]))
      ],
    );
  }

  ///CHOOSE IMAGE METHODS
  void _showChoiceBottomSheet(BuildContext context, addImageCallback) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 17, 0, 10),
                child: Text(
                  Utils.getStringValue(context, AppStringConstant.chooseOption),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.folder),
                title: Text(
                    Utils.getStringValue(context, AppStringConstant.gallery),
                    style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  // isLoading = true;
                  Navigator.of(context).pop();
                  _openGallery(context, addImageCallback);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: Text(
                  Utils.getStringValue(context, AppStringConstant.camera),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                onTap: () {
                  // isLoading = true;
                  Navigator.of(context).pop();
                  _openCamera(context, addImageCallback);
                },
              )
            ],
          );
        });
  }

  void _openCamera(BuildContext context, addImageCallback) async {
    // Navigator.of(context).pop;
    final XFile? photo = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 60);
    setState(() {
      productImage = File(photo?.path ?? "");
      final bytes = productImage?.readAsBytesSync();
      String img64 = base64Encode(bytes!);
      fileName = photo?.name ?? '';
      fileEncoded = img64;
      addImageCallback!(img64);
    });
  }

  void _openGallery(BuildContext context, addImageCallback) async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 60);
    setState(() {
      productImage = File(image?.path ?? "");
      final bytes = productImage?.readAsBytesSync();
      String img64 = base64Encode(bytes!);
      fileName = image?.name ?? '';
      fileEncoded = img64;
      addImageCallback!(img64);
      // Navigator.of(context).pop();
    });
  }
}