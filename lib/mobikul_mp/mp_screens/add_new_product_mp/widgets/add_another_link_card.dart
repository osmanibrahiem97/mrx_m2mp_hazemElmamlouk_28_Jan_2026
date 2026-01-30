import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_another_link/add_another_link_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_another_sample/add_another_sample_model.dart';
import 'package:test_new/mobikul_mp/mp_widgets/mp_alert_dialog.dart';

import '../../../../mobikul/constants/app_string_constant.dart';
import '../bloc/add_new_product_mp_bloc.dart';
import '../bloc/add_new_product_mp_event.dart';

class AddAnotherLinkCard extends StatefulWidget {
  final addAnotherLinkModel;
  final Function(int)? onRemove;
  final int? index;
  AddNewProductMpBloc? addNewProductMpBloc;
  String? filePath;

  AddAnotherLinkCard({Key? key, this.addAnotherLinkModel, this.onRemove, this.index,this.addNewProductMpBloc,this.filePath})
      : super(key: key);

  @override
  State<AddAnotherLinkCard> createState() => _AddAnotherLinkCardState();
}

class _AddAnotherLinkCardState extends State<AddAnotherLinkCard> {
  ///ADD ANOTHER LINK
  TextEditingController downloadableTitleController = TextEditingController();
  TextEditingController downloadablePriceController = TextEditingController();
  String? fileEncoded;
  String? fileName;


  ///FILE TYPE
  String? selectedFileTypeValue = "\"url\"";
  List<dynamic> fileTypeValueList = [
    {
      'label': 'File Type - Link',
      'value': "\"url\"",
    },
    {
      'label': 'File Type - Upload',
      'value': "\"file\"",
    }
  ];
  TextEditingController urlController = TextEditingController(text: "");

  ///SAMPLE TYPE
  String? selectedSampleTypeValue = "\"url\"";
  String? imageName;
  String? imageEncoded;

  List<dynamic> sampleTypeValueList = [
    {
      'label': 'Sample Type - Link',
      'value':"\"url\""
      //'url',
    },
    {
      'label': 'Sample Type - Upload',
      'value': "\"file\"",
    }
  ];

  ///ADD ANOTHER SAMPLE
  List<AddAnotherSampleModel> addAnotherSampleItemList = [];
  AddAnotherSampleModel? addAnotherSampleModel;
  TextEditingController sampleUrlController = TextEditingController();

  ///SHAREABLE TYPE
  String? selectedShareableTypeValue = "1";
  List<dynamic> shareableTypeValueList = [
    {
      'label': 'Shareable - Yes',
      'value': "1",
    },
    {
      'label': 'Shareable - No',
      'value': "2",
    },
    {
      'label': 'Sample',
      'value': "3",
    }
  ];
  bool _unlimitedValue = false;
  TextEditingController maxDownloadableController = TextEditingController();
  TextEditingController titleOfSampleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  ///ADD ANOTHER SAMPLE
  TextEditingController anotherSampleTitleController = TextEditingController();
  TextEditingController anotherSampleUrlController = TextEditingController();
  TextEditingController anotherSampleFileController = TextEditingController();

  ///  ADD ANOTHER FILE
  TextEditingController fileController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  File? productImage;

  setMaxDownloadData(String? data){
    if(data == "1"){
      _unlimitedValue = true;
      print("ahfdf----${_unlimitedValue}");

    } else {
      _unlimitedValue = false;
      print("ahfdf----${_unlimitedValue}");


    }
  }


  @override
  void initState() {

    /// Set isUnlimited or Not
    _unlimitedValue = (widget.addAnotherLinkModel["is_unlimited"].toString() == "\"1\"") ? true : false;
    print("dahdf-----${_unlimitedValue}");

    super.initState();

                 /// Start Add File Data ///
    fileController.text = (widget.addAnotherLinkModel["file"].length > 0) ? widget.addAnotherLinkModel["file"][0]["file"] : "";
        widget.filePath ?? "";
    anotherSampleFileController.text = (widget.addAnotherLinkModel["sample"]["file"].length > 0) ? widget.addAnotherLinkModel["sample"]["file"][0]["file"] : "";

    downloadableTitleController.text = (widget.addAnotherLinkModel["title"] ?? '').toString().replaceAll("\"", "");
    downloadablePriceController.text = (widget.addAnotherLinkModel["price"] ?? '').toString().replaceAll("\"", "");
    selectedFileTypeValue = (widget.addAnotherLinkModel["type"] ?? '');
    urlController.text = (widget.addAnotherLinkModel["link_url"] ?? '').toString().replaceAll("\"", "");
    anotherSampleUrlController.text = (widget.addAnotherLinkModel["sample_url"] ?? '').toString().replaceAll("\"", "");
    anotherSampleUrlController.text = widget.addAnotherLinkModel["sample_file"] ?? "";
    // maxDownloadableController.text = widget.addAnotherLinkModel["number_of_downloads"];
    ///   Link_type  For Edit///

    print("dscjsgjswidget.addAnotherLinkModel---${widget.addAnotherLinkModel["type"]}");
    if(widget.addAnotherLinkModel["type"] != null){
      if(widget.addAnotherLinkModel["type"] == "url"){
        selectedFileTypeValue = "\"${widget.addAnotherLinkModel["type"]}\"";
        print("selectedFileTypeValue------${selectedFileTypeValue}");

      } else {
        selectedFileTypeValue = "${widget.addAnotherLinkModel["type"]}";
        print("selectedFileTypeValue------${selectedFileTypeValue}");
      }

    } else if(widget.addAnotherLinkModel["link_type"] == "url"){
      selectedFileTypeValue = "\"${widget.addAnotherLinkModel["link_type"]}\"";
      print("selectedFileTypeValue------${selectedFileTypeValue}");

    } else{
      selectedFileTypeValue = "${widget.addAnotherLinkModel["link_type"]}";
      print("selectedFileTypeValue------${selectedFileTypeValue}");
    }


    if(widget.addAnotherLinkModel["sample"]["type"] != null){
      if(widget.addAnotherLinkModel["sample"]["type"] == "url"){
        selectedSampleTypeValue = "\"${widget.addAnotherLinkModel["sample"]["type"]}\"";
        print("selectedFileTypeValue------${selectedFileTypeValue}");

      } else {
        selectedSampleTypeValue = "${widget.addAnotherLinkModel["sample"]["type"]}";
        print("selectedFileTypeValue------${selectedFileTypeValue}");
      }

    } else
    if(widget.addAnotherLinkModel["sample_type"] == "url"){
      selectedSampleTypeValue = "\"${widget.addAnotherLinkModel["sample_type"]}\"";
      print("selectedFileTypeValue------${selectedFileTypeValue}");

    } else{
      selectedSampleTypeValue = "${widget.addAnotherLinkModel["sample_type"]}";
      print("selectedFileTypeValue------${selectedFileTypeValue}");
    }

    ///  End Add File Data ///


  }

  @override
  void dispose() {
    downloadableTitleController.dispose();
    downloadablePriceController.dispose();
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    // widget.addAnotherLinkModel?.isVisible =
                    //     !widget.addAnotherLinkModel?.isVisible;
                    print("Add Link Visibility ${widget.addAnotherLinkModel?.isVisible}");
                  });
                },
                icon: const Icon(Icons.notes)),
            SizedBox(
              width: 100,
              height: 45,
              child: TextField(
                  controller: downloadableTitleController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      enabled: false)),
            )
          ],
        ),
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => MpAlertDialog(
                    title: Utils.getStringValue(
                        context, MpStringConstants.removeItemDialogTitle),
                    barrierDismissible: false,
                    onConfirm: () {
                      if (widget.onRemove != null) {
                        widget.onRemove!(widget.index ?? 0);
                      }
                      // addAnotherLinkItemList?.removeAt(index);
                    },
                    onCancel: () {
                      Navigator.pop(context);
                    },
                    msg: Utils.getStringValue(
                        context, MpStringConstants.removeItemDialogMsg),
                  ));
            },
            icon:
            const Icon(Icons.highlight_remove_outlined, color: Colors.red)),
      ]),
      Visibility(
          visible: true,
          child: Column(children: [
            AppTextField(
              isPassword: false,
              controller: downloadableTitleController,
              isRequired: false,
              hintText: Utils.getStringValue(context, MpStringConstants.title_),
              onChange: (value) {
                setState(() {
                  widget.addAnotherLinkModel["title"] = "\"${value}\"";
                });
              },
            ),
            const SizedBox(height: 10),
            AppTextField(
              isPassword: false,
              controller: downloadablePriceController,
              isRequired: false,
              hintText: Utils.getStringValue(context, MpStringConstants.price),
              onChange: (value) {
                setState(() {
                  widget.addAnotherLinkModel["price"] = "\"${value}\"";
                });
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
                  value: selectedFileTypeValue,
                  onChanged: (value) {
                    setState(() {
                      selectedFileTypeValue = value ?? "";
                      widget.addAnotherLinkModel["type"] = selectedFileTypeValue;
                      // print("type --${widget.addAnotherLinkModel["type"]}");
                      print("dropdown value------${selectedFileTypeValue}");
                    });
                  },
                  hint: const Text(
                    "",
                  ),
                  items: fileTypeValueList
                      .map(
                        (item) => DropdownMenuItem<String>(
                      value: item['value'],
                      child: Text(item['label'],
                          style: Theme.of(context).textTheme.titleLarge),
                      onTap: () {
                        setState(() {
                          selectedFileTypeValue = item['value'];
                        });

                        if (kDebugMode) {
                          print(
                              'TEST LOG ::: selectedFileTypeValue => $selectedFileTypeValue');
                        }
                      },
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: selectedFileTypeValue == "\"url\"",
              child: AppTextField(
                isPassword: false,
                controller: urlController,
                isRequired: false,
                hintText: Utils.getStringValue(context, MpStringConstants.url),
                onChange: (value){
                  setState(() {
                    widget.addAnotherLinkModel["link_url"] = "\"${value.toString()}\"";
                    //value.toString();
                  });
                },
              ),
            ),

            Visibility(
                visible:selectedFileTypeValue == "\"file\"",
                child:const SizedBox(height: 10)
            ),

            Visibility(
              visible: selectedFileTypeValue == "\"file\"",
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
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
                                controller: fileController,
                                decoration: InputDecoration(
                                  hintText: Utils.getStringValue(
                                    context,
                                    MpStringConstants.file,
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
                              print("Call After Choice Data----");
                              if (kDebugMode) {
                                widget.addNewProductMpBloc?.add(
                                    DownlodableFileUploadMpEvent(fileName!,"links",fileEncoded!,widget.index,widget.addAnotherLinkModel["link_id"].toString() ?? "0"));
                                fileController.text = fileName ?? "";
                              }
                            });

                            // widget.addAnotherLinkModel[]
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
                      widget.addAnotherLinkModel["sample"]["type"] = selectedSampleTypeValue;
                      print("widget.addAnotherLinkModel------${widget.addAnotherLinkModel}");
                    });
                  },
                  hint: const Text(
                    "",
                  ),
                  items: sampleTypeValueList
                      .map(
                        (item) => DropdownMenuItem<String>(
                      value: item['value'],
                      child: Text(item['label'],
                          style: Theme.of(context).textTheme.titleLarge),
                      onTap: () {
                        setState(() {
                          selectedSampleTypeValue = item['value'] ?? "";
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
                width: MediaQuery.of(context).size.width / 1,
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
                                    DownlodableSampleFileUploadMpEvent(fileName!,"link_samples",fileEncoded!,widget.index,widget.addAnotherLinkModel["link_id"].toString() ?? "0"));
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
              child: AppTextField(
                isPassword: false,
                controller: anotherSampleUrlController,
                isRequired: false,
                hintText:
                Utils.getStringValue(context, MpStringConstants.sampleUrl),
                onChange: (value){
                  setState(() {
                    widget.addAnotherLinkModel["sample"]["link_url"] = "\"${value.toString()}\"";
                    widget.addAnotherLinkModel["sample"]["url"] = "\"${value.toString()}\"";
                  });
                },
              ),
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
                  value: selectedShareableTypeValue.toString(),
                  onChanged: (value) {
                    setState(() {
                      selectedShareableTypeValue = value.toString();
                    });
                  },
                  hint: const Text(
                    "",
                  ),
                  items: shareableTypeValueList
                      .map(
                        (item) => DropdownMenuItem<String>(
                      value: item['value'],
                      child: Text(item['label'],
                          style: Theme.of(context).textTheme.titleLarge),
                      onTap: () {
                        setState(() {
                          selectedShareableTypeValue = item['value'];
                        });
                        if (kDebugMode) {
                          print(
                              'TEST LOG ::: selectedShareableTypeValue => $selectedShareableTypeValue');
                        }
                      },
                    ),
                  )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Switch(
                  value: _unlimitedValue,
                  activeColor: Theme.of(context).iconTheme.color,
                  onChanged: (newValue) {
                    setState(() {
                      _unlimitedValue = newValue;
                    });
                  },
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  Utils.getStringValue(context, MpStringConstants.unlimited),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            if (!_unlimitedValue)...[
              const SizedBox(height: 10),
              AppTextField(
                isPassword: false,
                controller: maxDownloadableController,
                isRequired: false,
                hintText:
                Utils.getStringValue(context, MpStringConstants.maxDownloads),
                onChange: (value){
                  setState(() {
                    widget.addAnotherLinkModel["number_of_downloads"] =  "\"${maxDownloadableController.text}\"" ?? "";
                  });
                },
              ),
            // const SizedBox(height: 15),
             ],
          ]))
    ]);
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
      // // Navigator.of(context).pop();
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
