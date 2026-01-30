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

// ignore_for_file: must_be_immutable
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_new/mobikul/app_widgets/app_alert_message.dart';
import 'package:test_new/mobikul/app_widgets/app_bar.dart';
import 'package:test_new/mobikul/app_widgets/app_date_picker.dart';
import 'package:test_new/mobikul/app_widgets/app_text_field.dart';
import 'package:test_new/mobikul/app_widgets/bottom_sheet.dart';
import 'package:test_new/mobikul/app_widgets/image_view.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/constants/app_routes.dart';
import 'package:test_new/mobikul/constants/app_string_constant.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/helper/utils.dart';
import 'package:test_new/mobikul_mp/mp_constants/mp_string_constants.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_another_link/add_another_link_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_another_sample/add_another_sample_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/image_role.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/product_data.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_bloc.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_event.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/bloc/add_new_product_mp_state.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/add_another_link_card.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/add_another_sample_card.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/nested_listview.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/new_NestedChecekboxList.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/selected_product_card_element_view.dart';
import 'package:test_new/mobikul_mp/mp_screens/add_new_product_mp/widgets/seller_new_product_save_request.dart';
import 'package:test_new/mobikul_mp/mp_widgets/mp_alert_dialog.dart';
import '../../../mobikul/app_widgets/loader.dart';
import '../../../mobikul/models/productDetail/link_data.dart';
import '../../mp_models/add_new_product_mp_model/add_another_link/file_data_model.dart';
import '../../mp_models/add_new_product_mp_model/categories.dart';
import '../../mp_models/add_new_product_mp_model/media_gallery.dart';
import '../../mp_models/add_new_product_mp_model/select_products/product_collection_data.dart';
import '../../mp_models/add_new_product_mp_model/upload_file_data_model/upload_file_data_model.dart';

class AddNewProductMpScreen extends StatefulWidget {
  int productId = 0;
  Function(String)? deleteImageCallBack;

  AddNewProductMpScreen(this.productId, {Key? key}) : super(key: key);

  @override
  State<AddNewProductMpScreen> createState() => _AddNewProductMpScreenState();
}

class _AddNewProductMpScreenState extends State<AddNewProductMpScreen> {
  int mProductId = 0;
  AddNewProductMpBloc? addNewProductMpBloc;
  bool isLoading = false;
  AddNewProductMpModel? addNewProductMpModel;
  bool isImageAddedNewly = false;
  bool isImagesListUpdated = false;
  String? selectedSampleTypeValue = "\"url\"";
  //'url';
  TextEditingController anotherSampleUrlController = TextEditingController();
  TextEditingController anotherSampleFileController = TextEditingController();
  String? selectedShareableTypeValue = "1";
  TextEditingController downloadableTitleController = TextEditingController();
  TextEditingController downloadablePriceController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  bool _unlimitedValue = false;

  var uploadedFileData;
  var uploadSampleFileData;
  var sampleFileUploadData;

  ///TextFieldController
  TextEditingController attributeSetController = TextEditingController();
  TextEditingController productTypeController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productShortDescriptionController =
  TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController specialPriceController = TextEditingController();
  TextEditingController specialPriceFromController = TextEditingController();
  TextEditingController specialPriceToController = TextEditingController();
  TextEditingController isFeaturedProductController = TextEditingController();
  TextEditingController purchaseLimitController = TextEditingController();
  TextEditingController stockCountController = TextEditingController();
  TextEditingController stockAvailabilityController = TextEditingController();
  TextEditingController visibilityController = TextEditingController();
  TextEditingController taxClassController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController metaTitleController = TextEditingController();
  TextEditingController metaKeywordController = TextEditingController();
  TextEditingController metaDescriptionController = TextEditingController();

  ///AttributeSet
  String? selectedAttributeValue = '';
  List<dynamic> attributeList = [];

  ///ProductType
  String? selectedProductType = '';
  List<dynamic> productTypeList = [];

  ///isFeaturedProduct
  String? isFeaturedProduct = 'yes';
  List<dynamic> featuredProductOptions = [
    AppStringConstant.no,
    AppStringConstant.yes
  ];

  ///StockAvailability
  String? selectedStockAvailability = '1';
  List<dynamic> stockAvailabilityList = [];

  ///Visibility
  String? selectedVisibilityType = '1';
  List<dynamic> visibilityTypeList = [];

  ///ProductType
  String? selectedTaxClass = '2';
  List<dynamic> selectedTaxClassList = [];

  ///Weight Switch button
  bool _weightSwitchValue = false;

  ///Downloadable Switch button
  bool _downloadableSwitchValue = false;

  ///EXPANDED DOWNLOADABLE
  TextEditingController titleOfLinkController = TextEditingController();
  bool _canPurchaseSeparatelyValue = false;

  ///ADD ANOTHER LINK
  List<AddAnotherLinkModel>? addAnotherLinkItemList = [];
  AddAnotherLinkModel? addAnotherLinkModel;

  FileModel? fileDataModel;
  List<dynamic>? fileUploadData;

  ///FILE TYPE
  String? selectedFileTypeValue = "\"url\"";
  List<dynamic> fileTypeValueList = [
    {
      'label': 'File Type - Link',
      'value': "\"url\"",
    } ,
    {
      'label': 'File Type - Upload',
      'value': "\"file\"",
    }
  ];

  ///SAMPLE TYPE
  List<dynamic> sampleTypeValueList = [
    {
      'label': 'Sample Type - Link',
      'value': "\"url\""
    } /*,
    {
      'label': 'Sample Type - Upload',
      'value': '2',
    }*/
  ];

  ///ADD ANOTHER SAMPLE
  List<AddAnotherSampleModel>? addAnotherSampleItemList = [];
  AddAnotherSampleModel? addAnotherSampleModel;
  UploadDownloadableProductFileModel? uploadDownloadableProductFileModel;

  TextEditingController sampleUrlController = TextEditingController();

  ///SHAREABLE TYPE
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
  TextEditingController titleOfSampleController = TextEditingController();
  TextEditingController titleController = TextEditingController();

  ///ADD ANOTHER SAMPLE
  TextEditingController anotherSampleTitleController = TextEditingController();

  ///CHOOSE IMAGE
  File? productImage;
  final ImagePicker _picker = ImagePicker();
  List<dynamic>? filePath;

  List<ProductCollectionData> selectedRelatedItemList = [];
  List<ProductCollectionData> selectedUpSellItemList = [];
  List<ProductCollectionData> selectedCrossSellItemList = [];


  List selectedRelatedIdsList = [];
  List selectedUpSellIdsList = [];
  List selectedCrossSellIdsList = [];
  List<Map<String, dynamic>> selectedCategoriesList = [];
  late List<String> selectedCategoryIdsList;

  late GlobalKey<FormState> _formKey;
  String? imageEncoded;
  String? imageName;
  bool? isBase;
  bool? isSmall;
  bool? isThumbnail;
  bool? isSwatch;
  List<Map<String, dynamic>>? selectedImages = [];
  List<Map<String, dynamic>>? updateImageList = [];
  List<Map<String, dynamic>>? newImageList = [];

  List<Map<String, dynamic>>? updatedProductImages = [];
  List<Map<String, dynamic>>? newlyAddedProductImages = [];
  List<Map<String, dynamic>>? deletedProductImages = [];


  ///  DownloadFile Upload
  List<Map<String, dynamic>>? downlodableProductUpload = [];


  var selectedImageRoles;
  List<Categories>? itemList = [];

  ///SellerNewProductSaveRequestModel
  SellerNewProductSaveRequestModel? sellerNewProductSaveRequestModel;

  SelectProductsMpModel? selectProductsMpModel;
  // List<Map<String, dynamic>> myList = [];
  List<dynamic> myList = [];

  // List<dynamic> fileData = [];

  List<dynamic> listForSampleData = [];

  List<LinkData>? linkData = [];
  List<dynamic>? fileData = [];
  List<dynamic>? sampleFileData = [];
  List<dynamic>? sampleData = [];

  ///Link data
  List<Widget> linkDataWidgetList = [];

  List<Widget> listSampleDatList = [];


  @override
  void initState() {
    selectedCategoryIdsList = [];
    mProductId = widget.productId;
    addNewProductMpBloc = context.read<AddNewProductMpBloc>();
    addNewProductMpBloc?.add(AddNewProductMpFetchEvent(mProductId ?? 0));
    _formKey = GlobalKey();
    selectProductsMpModel = SelectProductsMpModel();
    super.initState();
  }

  void _getSelectedItems(
      List<Categories> itemList, List<String> selectedItems) {
    selectedItems.forEach((selectedCategoryId) {
      for (var item in itemList) {
        if (item.categoryId == selectedCategoryId) {
          item.isChecked = item.categoryId == selectedCategoryId;
          var res = {
            "categoryId": item.categoryId ?? '',
            "categoryTitle": item.name ?? '',
          };
          selectedCategoriesList.add(res);
        }
        if ((item.children ?? []).isNotEmpty) {
          _getSelectedItems((item.children ?? []), selectedItems);
        }
      }
    });
  }

  void _getSelectedItemsUpdate(
      List<AssignedCategory> itemList, List<String> selectedItems) {
    selectedItems.forEach((selectedCategoryId) {
      for (var item in itemList) {
        if (item.id == selectedCategoryId) {
          item.isChecked = item.id == selectedCategoryId;
          var res = {
            "id": item.id ?? '',
            "name": item.name ?? '',
          };
          selectedCategoriesList.add(res);
        }
        if ((item.children ?? []).isNotEmpty) {
          _getSelectedItemsUpdate((item.children ?? []), selectedItems);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: commonAppBar(
            (mProductId == 0)
                ? Utils.getStringValue(
                context, MpStringConstants.addNewProducts)
                : Utils.getStringValue(context, MpStringConstants.editProduct),
            context,
            isLeadingEnable: false, onPressed: () {
          Navigator.pop(context);
        }),
        body: _buildMainUi());
  }

  Widget _buildMainUi() {
    return BlocBuilder<AddNewProductMpBloc, AddNewProductMpState>(
      builder: (context, currentState) {
        if(currentState is! AddNewProductMpEmptyState) {
          print("Current State ::: $currentState");
          print("AddNewProdcut ======> ${addNewProductMpModel?.toJson()}");
        }
        if (currentState is AddNewProductMpInitial) {
          isLoading = true;
        } else if (currentState is AddNewProductMpSuccess) {
          isLoading = false;
          addNewProductMpModel = currentState.addNewProductMpModel;
          selectedProductType = addNewProductMpModel?.allowedTypes?.first.value;
          selectedAttributeValue = addNewProductMpModel?.allowedAttributes?[0].value ?? "0";
          _getSelectedItems(addNewProductMpModel?.categories?.children ?? [],
              addNewProductMpModel?.productData?.categoryIds ?? []);
          _getSelectedItemsUpdate(addNewProductMpModel?.assignedCategories ?? [],
              addNewProductMpModel?.productData?.categoryIds ?? []);
          attributeList = addNewProductMpModel?.allowedAttributes ?? [];
          productTypeList = addNewProductMpModel?.allowedTypes ?? [];
          stockAvailabilityList =
              addNewProductMpModel?.inventoryAvailabilityOptions ?? [];
          visibilityTypeList = addNewProductMpModel?.visibilityOptions ?? [];
          selectedTaxClassList = addNewProductMpModel?.taxOptions ?? [];
          selectedTaxClass = addNewProductMpModel?.productData?.taxClassId ?? '2';
          selectedCategoryIdsList = addNewProductMpModel?.productData?.categoryIds ?? [];
          if (mProductId == 0) {
            if (kDebugMode) {
              print('Hello! You are in Add New Product');
              ProductData mProductData = ProductData(
                name: "",
                mediaGallery: [],
              );
              addNewProductMpModel?.productData = mProductData;
            }
          } else {
            if (kDebugMode) {
              print('Hello! You are in Edit New Product');
            }

            ///Set ProductData
            // selectedAttributeValue =
            //     addNewProductMpModel?.productData?.attributeSetId ?? '4';
            // selectedProductType =
            //     addNewProductMpModel?.productData?.type ?? 'simple';

            selectedProductType = addNewProductMpModel?.productData?.type ?? addNewProductMpModel?.allowedTypes?.first.value;


            productNameController.text =
                addNewProductMpModel?.productData?.name ?? "";
            productDescriptionController.text =
                addNewProductMpModel?.productData?.description ?? "";
            productShortDescriptionController.text =
                addNewProductMpModel?.productData?.shortDescription ?? "";
            skuController.text = addNewProductMpModel?.productData?.sku ?? "";
            priceController.text =
                addNewProductMpModel?.productData?.price ?? "";
            specialPriceController.text =
                addNewProductMpModel?.productData?.specialPrice ?? "";
            specialPriceFromController.text =
                (addNewProductMpModel?.productData?.specialFromDate ?? "").split(' ').first.toString();;
            specialPriceToController.text =
                (addNewProductMpModel?.productData?.specialToDate ?? "").split(' ').first.toString();;
            isFeaturedProduct = (addNewProductMpModel
                ?.productData?.isFeaturedProduct
                .toString() ==
                "1")
                ? AppStringConstant.yes
                : AppStringConstant.no;
            purchaseLimitController.text =
                addNewProductMpModel?.productData?.mpProductCartLimit ?? '';
            stockCountController.text =
                addNewProductMpModel?.productData?.qty.toString() ?? '';
            selectedStockAvailability =
            addNewProductMpModel?.productData?.isInStock == true
                ? '1'
                : '0';
            selectedVisibilityType =
                addNewProductMpModel?.productData?.visibility ?? '1';
            _weightSwitchValue =
            addNewProductMpModel?.productData?.productHasWeight == 1
                ? true
                : false;
            weightController.text =
                addNewProductMpModel?.productData?.weight.toString() ?? "";
            metaTitleController.text =
                addNewProductMpModel?.productData?.metaTitle ?? '';
            metaKeywordController.text =
                addNewProductMpModel?.productData?.metaKeyword ?? '';
            metaDescriptionController.text =
                addNewProductMpModel?.productData?.metaDescription ?? '';
            selectedRelatedIdsList =
                addNewProductMpModel?.productData?.related ?? [];
            selectedUpSellIdsList =
                addNewProductMpModel?.productData?.upsell ?? [];
            selectedCrossSellIdsList =
                addNewProductMpModel?.productData?.crossSell ?? [];
            // selectedImages=
            //     addNewProductMpModel?.productData?.mediaGallery ?? [];

            ///  Data save
            var data = jsonEncode(addNewProductMpModel?.productData?.linkData);
            print("-------??${data}");
            var mapData = jsonDecode(data);
            print("=======${mapData}");
            var lengthData = mapData?.length ?? 0;
            for (int i = 0; i < lengthData; i++) {
              print("--sdjv${mapData[i]["file"][0]["file"].toString()}");

              print("------eee${mapData[i]["title"]}");
              var member = {
                "link_id": "\"${mapData[i]["link_id"]}\"",
                "sort_order": "\"1\"",
                "is_delete": false,
                "title": "\"${mapData[i]["title"]}\"",
                "price": "\"${mapData[i]["price"]}\"",
                "type": "\"${mapData[i]["type"]}\"",
                "file": [
                  {
                    "file": "\"${mapData[i]["file"][0]["file"]}\"",
                    "size": "\"${mapData[i]["file"][0]["size"]}\"",
                    "status": "\"${mapData[i]["file"][0]["status"]}\"",
                    "name": "\"${mapData[i]["file"][0]["name"]}\"",
                  }
                ],
                "link_url": "\"${mapData[i]["link_url"]}\"",
                // "sample_type": "\"${mapData[i]["sample_type"]}\"",
                // "sample_file": "\"${mapData[i]["sample_file"]}\"",
                "sample": {
                  "url": "\"${mapData[i]["url"]}\"",
                  "type": "\"${mapData[i]["type"]}\"",
                  "file": [
                    {
                      "file": "\"${mapData[i]["sample"]["file"][0]["file"]}\"",
                      "size": "\"${mapData[i]["sample"]["file"][0]["size"]}\"",
                      "status": "\"${mapData[i]["sample"]["file"][0]["status"]}\"",
                      "name": "\"${mapData[i]["sample"]["file"][0]["name"]}\"",
                    }
                  ]
                  // "sample_file": "\"${mapData[i]["sample_file"]}\"",
                  // "link_url": "\"${mapData[i]["link_url"]}\"",
                },
                "is_shareable": "\"${selectedShareableTypeValue}\"",
                "is_unlimited": _unlimitedValue != true ? "\"1\"" : "\"0\"",

              };
              myList.add(member);
              // myList = mapData;
            }

            /// Data

            print("asdhffd0-------${addNewProductMpModel?.productData?.samplesData?.toSet()}");
            var sampleData =
            jsonEncode(addNewProductMpModel?.productData?.samplesData);
            print("Sample Data-------??${sampleData}");
            var mapSampeleData = jsonDecode(sampleData);
            print("=======${mapSampeleData}");
            var lengthSampleData = mapSampeleData?.length ?? 0;
            for (int i = 0; i < lengthSampleData; i++) {
              // print("------eee${mapData[i]["title"]}");

              var sampleData = {
                "sample_id": "\"${mapSampeleData[i]["sample_id"]}\"",
                "sort_order": "\"1\"",
                "is_delete": false,
                "file": [
                  {
                    "file": "\"${mapData[i]["sample"]["file"][0]["file"]}\"",
                    "size": "\"${mapData[i]["sample"]["file"][0]["size"]}\"",
                    "status": "\"${mapData[i]["sample"]["file"][0]["status"]}\"",
                    "name": "\"${mapData[i]["sample"]["file"][0]["name"]}\"",
                  }
                ],
                "title": "\"${mapSampeleData[i]["title"]}\"",
                "type": "\"${mapSampeleData[i]["type"]}\"",
                "sample_url": "\"${mapSampeleData[i]["sample_url"]}\"",
              };

              listForSampleData.add(sampleData);

              print("asdjfgd---${listForSampleData.toString()}");
              // myList = mapData;
            }

            // selectedImages=
            //     addNewProductMpModel?.productData?.mediaGallery ?? [];
          }
        } else if (currentState is SelectProductsMpSuccess) {
          isLoading = false;
          selectProductsMpModel = currentState.selectProductsMpModel;
          var itemList = selectProductsMpModel?.productCollectionData;
          selectedRelatedItemList?.forEach((selectedElement) {
            itemList?.forEach((element) {
              if (element.entity_id.toString() ==
                  selectedElement.entity_id.toString()) {
                element.selected = true;
                ProductCollectionData(
                  selected: element.selected,
                );
                selectedRelatedItemList =
                    selectProductsMpModel?.productCollectionData ?? [];
                print("TEST LOG PRODUCT LIST ::: $selectedRelatedItemList");
              }
            });
          });
        } else if (currentState is ProductImageUploadMpSuccess) {
          print("ProductImageUploadMpSuccess called");
          isLoading = false;
          if (currentState.productImageUploadModel.success ?? false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (addNewProductMpModel?.productData?.mediaGallery == null ||
                  (addNewProductMpModel?.productData?.mediaGallery ?? [])
                      .isEmpty) {
                addNewProductMpModel?.productData?.baseImage =
                    currentState.productImageUploadModel.name ?? '';
                addNewProductMpModel?.productData?.smallImage =
                    currentState.productImageUploadModel.name ?? '';
                addNewProductMpModel?.productData?.swatchImage =
                    currentState.productImageUploadModel.name ?? '';
                addNewProductMpModel?.productData?.thumbnail =
                    currentState.productImageUploadModel.name ?? '';
              }
              MediaGallery mediaGalleryItem = MediaGallery(
                removed: false,
                position: "1",
                file: currentState.productImageUploadModel.name,
                url: currentState.productImageUploadModel.url,
              );
              print("mediaGalleryItem ---> ${mediaGalleryItem.toJson()}");
              final productData = addNewProductMpModel?.productData;

              if (productData == null) return;

              // ✅ Ensure list exists
              productData.mediaGallery ??= <MediaGallery>[];

               // ✅ Now safely add
              productData.mediaGallery!.add(mediaGalleryItem);

              print(
                "Updated media gallery list ---> ${productData.mediaGallery!.length}",
              );
              print("Updated media gallery list ---> ${addNewProductMpModel?.productData?.mediaGallery?.length}");
              var res = {
                "removed": false,
                "position": "1",
                "disabled": false,
                "file": '"${currentState.productImageUploadModel.name}"',
              };
              if (mProductId == 0) {
                setState(() {
                  // selectedImages?.add(res);
                  print("updatedProductImages add res---> $res");
                  updatedProductImages?.add(res);
                });
                if (kDebugMode) {
                  print(
                      "TEST LOG UPDATED PRODUCT LIST => $updatedProductImages");
                }
              } else {
                setState(() {
                  isImageAddedNewly = true;
                  if (isImageAddedNewly == true) {
                    newlyAddedProductImages?.add(res);
                    updatedProductImages?.add(res);
                  } else if (isImagesListUpdated == true) {
                    deletedProductImages?.add(res);
                  }
                  ;
                });
                print("TEST LOG UPDATED MEDIA LIST => $updateImageList");
                print(
                    "TEST LOG NEWLY ADDED PRODUCT LIST => $newlyAddedProductImages");
                print("TEST LOG DELETED MEDIA LIST => $deletedProductImages");
              }

              // AlertMessage.showSuccess(
              //     currentState.productImageUploadModel.message ?? '', context);
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(
                  currentState.productImageUploadModel.message ?? '', context);
            });
          }
        } else if (currentState is SellerNewProductSaveRequestState) {
          isLoading = false;
          if (currentState.saveproductModel.success ?? false) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showSuccess(
                  currentState.saveproductModel.message ?? '', context);
              setState(() {
                isImageAddedNewly = false;
                newlyAddedProductImages?.clear();
              });
              /*setState(() {
                widget.productId =
                    currentState.saveproductModel?.productId ?? 0;
                print(
                    "TEST LOG ::: PRODUCT ID FROM RESPONSE => ${currentState.saveproductModel?.productId}");
                print(
                    "TEST LOG ::: VALUE SET IN WIDGET.PRODUCTID => ${widget.productId}");
              });*/
            });
            mProductId = currentState.saveproductModel?.productId ?? 0;
            widget.productId = currentState.saveproductModel?.productId ?? 0;
            myList.clear();
            listForSampleData.clear();
            // Navigator.of(context).pop();
            // addNewProductMpBloc?.add(AddNewProductMpFetchEvent(
            //     currentState.saveproductModel?.productId ?? 0));
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              AlertMessage.showError(
                  currentState.saveproductModel.message ??
                      'Something went wrong',
                  context);
            });
          }
        } else if (currentState is AddNewProductMpError) {
          isLoading = false;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            AlertMessage.showError(
                currentState.message ?? 'Something went wrong', context);
          });
        } else if (currentState is DownlodableFileUploadMpSuccess){
          isLoading = false;
          var editIndex = currentState.index ?? 0;
          print("fggd  selected index ----${currentState.index}");
          uploadDownloadableProductFileModel = currentState.uploadDownloadableProductFileModel;
          String? statusFile = "new";
          print("sdhfdhasdgf----${currentState.linkId}");

          uploadedFileData = {
            "file":"\"${uploadDownloadableProductFileModel?.file}\"" ?? "",
            "name":"\"${uploadDownloadableProductFileModel?.name}\"" ?? "",
            "size":"\"${uploadDownloadableProductFileModel?.size}\"" ?? "",
            "status":"\"${statusFile}\"" ?? "",
          };

          print("gsfgff----${uploadDownloadableProductFileModel?.toJson()}");

          fileData?.clear();

          fileData?.add(uploadedFileData);
          myList[editIndex]["file"] = fileData;
          myList[editIndex]["link_id"] = currentState.linkId.toString();

          print("After Link Data ---${myList}");


        } else if (currentState is DownlodableSampleFileUploadMpSuccess){
          isLoading = false;
          uploadDownloadableProductFileModel = currentState.uploadDownloadableProductFileModel;
          var editIndex = currentState.index ?? 0;

          String sampleType = "new";
          uploadedFileData = {
            "file":"\"${uploadDownloadableProductFileModel?.file}\"" ?? "",
            "name":"\"${uploadDownloadableProductFileModel?.name}\"" ?? "",
            "size":"\"${uploadDownloadableProductFileModel?.size}\"" ?? "",
            "status":"\"${sampleType}\"" ?? "",
          };
          sampleFileData?.clear();
          sampleFileData?.add(uploadedFileData);

          myList[editIndex]["sample"]["file"] = sampleFileData;
          myList[editIndex]["link_id"] = currentState.linkId.toString();

          print("--sampleFileData--${sampleFileData}");
          print("--sampleFileData--${myList[editIndex]["sample"]["file"]}");


        } else if (currentState is SampleFileUploadMpSuccess){
          isLoading = false;
          uploadDownloadableProductFileModel = currentState.uploadDownloadableProductFileModel;
          String sampleType = "new";
          uploadedFileData = {
            "file":"\"${uploadDownloadableProductFileModel?.file}\"" ?? "",
            "name":"\"${uploadDownloadableProductFileModel?.name}\"" ?? "",
            "size":"\"${uploadDownloadableProductFileModel?.size}\"" ?? "",
            "status":"\"${sampleType}\"" ?? "",
          };
          sampleData?.clear();
          sampleData?.add(uploadedFileData);
          print("Sample Success called");
        }else if (currentState is AddNewProductMpEmptyState) {}

        addNewProductMpBloc?.emit(AddNewProductMpEmptyState());
        return (addNewProductMpModel != null)
            ? _buildUI(context)
            : const Loader();
      },
    );
  }

  Widget _buildUI(BuildContext context) {
    return Stack(
      children: <Widget>[
        Visibility(
          visible: addNewProductMpModel != null,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///BasicView
                        _basicView(),

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///ProductCategory
                        if( addNewProductMpModel?.categories != null)...[
                          _productCategoryView(),
                        ] else... [
                          _productCategoryViewForAssigned(),
                        ],

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///ProductPurchaseLimit
                       if((addNewProductMpModel?.addProductLimitStatus ?? "" != null) && (addNewProductMpModel?.addProductLimitStatus ?? "") != "" && (addNewProductMpModel?.addProductLimitStatus ?? "") != false)...[
                        _productPurchaseLimitView(),
                        ],

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///Stock
                        _stockView(),

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///Weight
                        Visibility(
                          visible: (selectedProductType != "virtual" &&
                              selectedProductType != "downloadable"),
                          child: _weightView(),
                        ),

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///Images
                        _imagesView(),

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///Downloadable
                        Visibility(
                          visible: selectedProductType != "virtual",
                          child: _downloadableView(),
                        ),

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///Downloadable
                        _seoView(),

                        const SizedBox(height: AppSizes.spacingGeneric),

                        ///RelatedProducts
                        const SizedBox(height: AppSizes.spacingGeneric),
                        if ((addNewProductMpModel?.addRelatedProductStatus ?? "") != null && (addNewProductMpModel?.addRelatedProductStatus ?? "") != "" && (addNewProductMpModel?.addRelatedProductStatus ?? "") != false) ...[
                          ///RelatedProducts
                          _relatedProductsView(),

                          const SizedBox(height: AppSizes.spacingGeneric),
                        ],

                        const SizedBox(height: AppSizes.spacingGeneric),

                        if ((addNewProductMpModel?.addUpsellProductStatus ??
                            "") !=
                            "" &&
                            (addNewProductMpModel?.addUpsellProductStatus ??
                                "") !=
                                null && (addNewProductMpModel?.addUpsellProductStatus ??
                            "") !=
                            false) ...[
                          ///UpSellProducts
                          _upSellProductsView(),

                          const SizedBox(height: AppSizes.spacingGeneric),
                        ],

                        const SizedBox(height: AppSizes.spacingGeneric),

                        if ((addNewProductMpModel?.addCrosssellProductStatus ??
                            "") !=
                            "" &&
                            (addNewProductMpModel?.addCrosssellProductStatus ??
                                "") !=
                                null && (addNewProductMpModel?.addCrosssellProductStatus ??
                            "") !=
                            false) ...[
                          ///CrossSellProducts
                          _crossSellProductsView(),
                          const SizedBox(height: AppSizes.spacingGeneric),
                        ],

                        const SizedBox(height: AppSizes.spacingGeneric),

                        const SizedBox(height: AppSizes.size16),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: AppSizes.genericButtonHeight + 10,
                  padding: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      var validate = _formKey.currentState?.validate();
                      print("TEST LOG SAVE BUTTON PRODUCT ID=> $mProductId");
                      if (validate == true) {
                        var productDescriptionControllerData = productDescriptionController.text
                            .replaceAll('\r', '')
                            .replaceAll(r'\', r'\\')
                            .replaceAll('"', r'\"')
                            .replaceAll('\n', '\\n');

                        var metaKeyword = metaKeywordController.text
                            .replaceAll('\r', '')
                            .replaceAll(r'\', r'\\')
                            .replaceAll('"', r'\"')
                            .replaceAll('\n', '\\n');
                        var shortDescription = productShortDescriptionController.text
                            .replaceAll('\r', '')
                            .replaceAll(r'\', r'\\')
                            .replaceAll('"', r'\"')
                            .replaceAll('\n', '\\n');
                        var metaDescription = metaDescriptionController.text
                            .replaceAll('\r', '')
                            .replaceAll(r'\', r'\\')
                            .replaceAll('"', r'\"')
                            .replaceAll('\n', '\\n');
                        addNewProductMpBloc
                            ?.add(SellerNewProductSaveRequestEvent(
                          sellerNewProductSaveRequestModel =
                              SellerNewProductSaveRequestModel(
                                customerToken: appStoragePref.getCustomerToken(),
                                productId:
                                mProductId == 0 ? '' : mProductId.toString(),
                                sku: skuController.text.toString(),
                                urlKey: skuController.text.toString(),
                                qty: int.parse(
                                    ((stockCountController.text.isNotEmpty)
                                        ? stockCountController.text
                                        : "0")
                                        .toString()),
                                type: selectedProductType,
                                name: productNameController.text.toString(),
                                price: priceController.text.toString(),
                                status: true,
                                isFeaturedProduct:
                                isFeaturedProduct.toString() == 'yes' ? 1 : 0,
                                weight: weightController.text.toString(),
                                storeId: int.parse(
                                    appStoragePref.getStoreId().toString()),
                                metaTitle: metaTitleController.text.toString(),
                                thumbnail:
                                addNewProductMpModel?.productData?.thumbnail ??
                                    "",
                                baseImage:
                                addNewProductMpModel?.productData?.baseImage ??
                                    "",
                                isInStock:
                                selectedStockAvailability.toString() == "1"
                                    ? true
                                    : false,
                                linksTitle: titleOfLinkController.text,
                                visibility: selectedVisibilityType,
                                taxClassId: int.parse(selectedTaxClass.toString()),
                                smallImage:
                                addNewProductMpModel?.productData?.smallImage ??
                                    "",
                                description:productDescriptionControllerData ?? "",
                                swatchImage: addNewProductMpModel
                                    ?.productData?.swatchImage ??
                                    "",
                                metaKeyword: metaKeyword.toString() ?? "",
                                samplesTitle: titleOfSampleController.text,
                                isDownloadable: _downloadableSwitchValue,
                                attributeSetId:
                                int.parse(selectedAttributeValue.toString()),
                                specialFromDate:
                                specialPriceFromController.text.toString(),
                                metaDescription:metaDescription.toString() ?? "",
                                shortDescription:shortDescription.toString() ?? "",
                                productHasWeight: _weightSwitchValue,
                                mpProductCartLimit:
                                    (purchaseLimitController.text.isNotEmpty)
                                        ? purchaseLimitController.text.toString()
                                        : "0"
                                        .toString(),
                                //purchaseLimitController.text.toString(),
                                purchasedSeparately: false,
                                upsell: selectedUpSellIdsList,
                                related: selectedRelatedIdsList,
                                linksData: myList,
                                //getLinkData(addAnotherLinkItemList),
                                crossSell: selectedCrossSellIdsList,
                                websiteIds:
                                addNewProductMpModel?.productData?.websiteIds ??
                                    [appStoragePref.getWebsiteId() ?? '0'],
                                categoryIds: selectedCategoryIdsList ?? [],
                                samplesData: listForSampleData,
                                //getSampleData(
                                // addAnotherSampleItemList),
                                customAttribute: [],
                                customOptionData: [],
                                mediaGallery: mProductId == 0
                                    ? updatedProductImages
                                    : isImageAddedNewly == true
                                    ? newlyAddedProductImages
                                    : isImagesListUpdated == true
                                    ? deletedProductImages
                                    : updatedProductImages,
                                specialPrice: specialPriceController.text,
                                specialToDate: specialPriceToController.text,
                                purchaseSeparately:
                                _canPurchaseSeparatelyValue == true ? "1" : "0",
                              ),
                          mProductId ?? 0,
                        ));
                      }
                      if (kDebugMode) {
                        print("kDebugMode true");
                        getLinkData(addAnotherLinkItemList);
                        print(
                            "----Sample Data list --${listForSampleData.toString()}");
                        print('TEST LOG ::: productId => $mProductId');
                        print('TEST LOG ::: sku => ${skuController.text}');
                        print(
                            'TEST LOG ::: name => ${productNameController.text}');
                        print(
                            'TEST LOG ::: baseImage => ${addNewProductMpModel?.productData?.baseImage ?? ""}');
                        print(
                            'TEST LOG ::: categoryIds => ${selectedCategoryIdsList ?? []}');
                        print(
                            'TEST LOG ::: selectedRelatedIdsList => ${selectedRelatedIdsList ?? []}');

                        print("=======>teas data===${addAnotherLinkItemList}");
                        print(
                            "=======>teas data===${addAnotherLinkModel?.toJson()}");

                        print("My list data for file type-----${myList}");
                      }
                    },
                    child: Center(
                        child: Text(
                          Utils.getStringValue(
                              context,
                              Utils.getStringValue(
                                  context, AppStringConstant.save))
                              .toUpperCase(),
                          style:  TextStyle(color: Theme.of(context)?.textTheme?.labelLarge?.color),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Loader(),
        ),
      ],
    );
  }

  _basicView() {
    String localizedPrice = Utils.getStringValue(context, MpStringConstants.price__);
    String localizedSpecialPrice = Utils.getStringValue(context, MpStringConstants.specialPrice__);
// Append the currency symbol (if any)
    String priceSymbol = "$localizedPrice(${appStoragePref.getCurrencyCode() ?? ''})";
    String specialPriceSymbol = "$localizedSpecialPrice(${appStoragePref.getCurrencyCode() ?? ''})";
    return Container(
      color: Theme
          .of(context)
          .cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.basicDetail)
                  .toUpperCase() ??
                  '',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ///Attribute Set
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Utils.getStringValue(
                                context, MpStringConstants.attributeSet)),
                            const Icon(Icons.star, color: Colors.red, size: 5),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                              value: selectedAttributeValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedAttributeValue = value!;
                                });
                              },
                              hint: Text(
                                addNewProductMpModel
                                    ?.allowedAttributes?[0].label ??
                                    "",
                              ),
                              items: attributeList
                                  .map(
                                    (item) =>
                                    DropdownMenuItem<String>(
                                      value: item.value,
                                      child: Text(item.label,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleLarge),
                                      onTap: () {
                                        setState(() {
                                          selectedAttributeValue = item.value!;
                                        });
                                        if (kDebugMode) {
                                          print(
                                              'TEST LOG ::: selectedAttributeValue => $selectedAttributeValue');
                                        }
                                      },
                                    ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),

                    ///Product Type
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Utils.getStringValue(
                                context, MpStringConstants.productType)),
                            const Icon(Icons.star, color: Colors.red, size: 5),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                              hint: Text(
                                addNewProductMpModel?.allowedTypes?[0].label ??
                                    "",
                              ),
                              value: selectedProductType,
                              onChanged: (value) {
                                setState(() {
                                  selectedProductType = value!;
                                });
                                print(
                                    "TEST LOG SELECTED PRODUCT TYPE => $selectedProductType");
                              },
                              items: productTypeList
                                  .map(
                                    (item) =>
                                    DropdownMenuItem<String>(
                                      value: item.value,
                                      child: Text(item.label,
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleLarge),
                                      onTap: () {
                                        setState(() {
                                          selectedProductType = item.value!;
                                        });
                                        if (kDebugMode) {
                                          print(
                                              'TEST LOG ::: selectedProductType => $selectedProductType');
                                        }
                                      },
                                    ),
                              )
                                  .toList(),

                              // validator: (value) {
                              //   if (value == null) {
                              //     return Utils.getStringValue(
                              //         context, AppStringConstant.required);
                              //   }
                              // },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    ///ProductName
                    AppTextField(
                      isPassword: false,
                      controller: productNameController,
                      isRequired: true,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.productName),
                      validationMessage: AppStringConstant.required,
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),

                    ///ProductDescription
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${Utils.getStringValue(
                                context, MpStringConstants.description)}*'),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: AppSizes.deviceWidth / 2.3,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: TextFormField(
                            controller: productDescriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 12,
                            decoration: InputDecoration(
                                labelText: Utils.getStringValue(
                                    context, MpStringConstants.insertTextHere),
                                labelStyle:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium,
                                border: const OutlineInputBorder(),
                                floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                                alignLabelWithHint: true),
                            validator: (description) {
                              if (description?.isEmpty ?? false) {
                                return "${AppLocalizations.of(context)
                                    ?.translate(AppStringConstant.required)}";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),

                    ///ProductShortDescription
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Utils.getStringValue(
                            context, MpStringConstants.shortDescription)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: AppSizes.deviceWidth / 2.3,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: TextFormField(
                            controller: productShortDescriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 12,
                            decoration: InputDecoration(
                                labelText: Utils.getStringValue(
                                    context, MpStringConstants.insertTextHere),
                                labelStyle:
                                Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium,
                                border: const OutlineInputBorder(),
                                floatingLabelAlignment:
                                FloatingLabelAlignment.start,
                                alignLabelWithHint: true),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    ///Sku
                    // if (addNewProductMpModel?.skuType == "static")
                    AppTextField(
                      isPassword: false,
                      controller: skuController,
                      isRequired: true,
                      hintText:
                      Utils.getStringValue(context, MpStringConstants.sku),
                      validationMessage: AppStringConstant.required,
                    ),

                    // if (addNewProductMpModel?.skuType == "static")
                    const SizedBox(
                      height: 10.0,
                    ),

                    ///Price
                    AppTextField(
                      isPassword: false,
                      controller: priceController,
                      isRequired: true,
                      inputType: TextInputType.number,
                      hintText: Utils.getStringValue(
                          context, priceSymbol),
                      validationMessage: AppStringConstant.required,
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    ///Special Price
                    AppTextField(
                      isPassword: false,
                      controller: specialPriceController,
                      inputType: TextInputType.number,
                      hintText: Utils.getStringValue(
                          context, specialPriceSymbol),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    ///Special Price From
                    AppDatePicker(
                      controller: specialPriceFromController,
                      isPassword: false,
                      isRequired: (specialPriceController.text.isNotEmpty),
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.specialPriceFrom),
                    ),

                    const SizedBox(
                      height: 10.0,
                    ),

                    ///Special Price To
                    AppDatePicker(
                      controller: specialPriceToController,
                      isPassword: false,
                      isRequired: (specialPriceController.text.isNotEmpty),
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.specialPriceTo),
                    ),

                    const SizedBox(
                      height: 15.0,
                    ),

                    ///Is Featured Product:
                    Text(Utils.getStringValue(
                        context, MpStringConstants.isFeaturedProduct_)),
                    const SizedBox(
                      height: 10,
                    ),
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
                          value: isFeaturedProduct,
                          onChanged: (value) {
                            setState(() {
                              isFeaturedProduct = value!;
                            });
                          },
                          hint: Text(
                            featuredProductOptions[0] ?? "",
                          ),
                          items: featuredProductOptions
                              .map(
                                (item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item,
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge),
                                  onTap: () {
                                    setState(() {
                                      isFeaturedProduct = item!;
                                    });
                                    if (kDebugMode) {
                                      print(
                                          'TEST LOG ::: isFeaturedProduct => $isFeaturedProduct');
                                    }
                                  },
                                ),
                          )
                              .toList(),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                  ]),
            )
          ]),
    );
  }

  _productCategoryView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.productCategory)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            if (addNewProductMpModel?.categories != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: OutlinedButton(
                  onPressed: () {
                    showAppModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => NestedCheckboxList(
                            categories: addNewProductMpModel!.categories!,
                            onSelected: (value) {
                              selectedCategoriesList = value ?? [];
                              selectedCategoriesList.forEach((item) {
                                selectedCategoryIdsList.add(item['categoryId']);
                              });
                            }));
                  },
                  child: Text(
                      Utils.getStringValue(
                          context, MpStringConstants.addCategory)
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
            if (selectedCategoriesList.isNotEmpty)
              ListView.builder(
                itemCount: selectedCategoriesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: SizedBox(
                      height: 35,
                      width: AppSizes.deviceWidth,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                selectedCategoriesList[index]
                                ['categoryTitle'] ??
                                    '',
                                style: Theme.of(context).textTheme.titleLarge),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategoriesList.removeAt(index);
                                  });
                                },
                                child: const Icon(Icons.remove_circle_outline,
                                    size: 20, color: Colors.red)),
                          ]),
                    ),
                  );
                },
              ),
            if (selectedCategoriesList.isNotEmpty) const SizedBox(height: 15),
          ]),
    );
  }

  _productCategoryViewForAssigned() {
    return Container(
      color: Theme
          .of(context)
          .cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.productCategory)
                  .toUpperCase() ??
                  '',
              style: Theme
                  .of(context)
                  .textTheme
                  .titleLarge),
          children: [
            if (addNewProductMpModel?.assignedCategories != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: OutlinedButton(
                  onPressed: () {
                    print("dgdgajs-----");
                    showAppModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) =>
                            NewNestedCheckboxList(
                                categories: addNewProductMpModel?.assignedCategories ?? [],
                                selectedCategoryList: selectedCategoriesList,
                                onSelected: (value) {
                                  selectedCategoriesList = value ?? [];
                                  selectedCategoriesList.forEach((item) {
                                    selectedCategoryIdsList.add(
                                        item['id']);
                                  });
                                }));
                  },
                  child: Text(
                      Utils.getStringValue(
                          context, MpStringConstants.addCategory)
                          .toUpperCase(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge),
                ),
              ),
            if (selectedCategoriesList.isNotEmpty)
              ListView.builder(
                itemCount: selectedCategoriesList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: SizedBox(
                      height: 35,
                      width: AppSizes.deviceWidth,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                selectedCategoriesList[index]
                                ['name'] ??
                                    '',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleLarge),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategoriesList.removeAt(index);
                                    print('  selected categories list length is ${selectedCategoriesList.length}');
                                  });
                                },
                                child: const Icon(Icons.remove_circle_outline,
                                    size: 20, color: Colors.red)),
                          ]),
                    ),
                  );
                },
              ),
            if (selectedCategoriesList.isNotEmpty) const SizedBox(height: 15),
          ]),
    );
  }

  _productPurchaseLimitView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(
                  context, MpStringConstants.productPurchaseLimit)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 4.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///PurchaseLimit
                    AppTextField(
                      isPassword: false,
                      controller: purchaseLimitController,
                      isRequired: false,
                      inputType: TextInputType.number,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.purchaseLimit),
                    ),
                    const SizedBox(height: 3),
                    Text(
                        Utils.getStringValue(
                            context, MpStringConstants.purchaseLimitBottomHint),
                        style: const TextStyle(fontSize: 8))
                  ]),
            )
          ]),
    );
  }

  _stockView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.stock)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ///StockCount
                    AppTextField(
                      isPassword: false,
                      controller: stockCountController,
                      isRequired: true,
                      inputType: TextInputType.number,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.stockCount),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    ///Stock Availability
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Utils.getStringValue(
                                context, MpStringConstants.stockAvailability)),
                            const Icon(Icons.star, color: Colors.red, size: 5),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // height: AppSizes.genericButtonHeight,
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
                              hint: Text(addNewProductMpModel
                                  ?.inventoryAvailabilityOptions?[0]
                                  .label ??
                                  ""),
                              value: selectedStockAvailability,
                              onChanged: (value) {
                                setState(() {
                                  selectedStockAvailability = value!;
                                });
                              },
                              items: stockAvailabilityList
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                  value: item.value.toString(),
                                  child: Text(item.label,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  onTap: () {
                                    setState(() {
                                      selectedStockAvailability =
                                          item.value.toString();
                                    });
                                    if (kDebugMode) {
                                      print(
                                          'TEST LOG ::: selectedStockAvailability => $selectedStockAvailability');
                                    }
                                  },
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    ///Visibility
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Utils.getStringValue(
                                context, MpStringConstants.visibility)),
                            const Icon(Icons.star, color: Colors.red, size: 5),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                              hint: Text(addNewProductMpModel
                                  ?.visibilityOptions?[0].label ??
                                  ""),
                              value: selectedVisibilityType,
                              onChanged: (value) {
                                setState(() {
                                  selectedVisibilityType = value!;
                                });
                                print(
                                    "TEST LOG SELECTED VISIBILITY TYPE => $selectedVisibilityType");
                              },
                              items: visibilityTypeList
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                  value: item.value.toString(),
                                  child: Text(item.label,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  onTap: () {
                                    setState(() {
                                      selectedVisibilityType =
                                          item.value.toString();
                                    });
                                    if (kDebugMode) {
                                      print(
                                          'TEST LOG ::: selectedVisibilityType => $selectedVisibilityType');
                                    }
                                  },
                                ),
                              )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    ///TaxClass
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Utils.getStringValue(
                                context, MpStringConstants.taxClass)),
                            const Icon(Icons.star, color: Colors.red, size: 5),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                              hint: Text(
                                  addNewProductMpModel?.taxOptions?[0].label ??
                                      ""),
                              value: selectedTaxClass,
                              onChanged: (value) {
                                setState(() {
                                  selectedTaxClass = value!;
                                });
                              },
                              items: selectedTaxClassList
                                  .map(
                                    (item) => DropdownMenuItem<String>(
                                  value: item.value,
                                  child: Text(item.label,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                  onTap: () {
                                    setState(() {
                                      selectedTaxClass =
                                          item.value.toString();
                                    });
                                    if (kDebugMode) {
                                      print(
                                          'TEST LOG ::: selectedTaxClass => $selectedTaxClass');
                                    }
                                  },
                                ),
                              )
                                  .toList(),
                              // validator: (value) {
                              //   if (value == null) {
                              //     return Utils.getStringValue(
                              //         context, AppStringConstant.required);
                              //     // add validation with return statement
                              //   }
                              // },
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
            )
          ]),
    );
  }

  _weightView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.weight)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Switch(
                          activeColor: Theme.of(context).iconTheme.color,
                          value: _weightSwitchValue,
                          onChanged: (newValue) {
                            setState(() {
                              _weightSwitchValue = newValue;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          Utils.getStringValue(
                              context, MpStringConstants.haveWeight),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    if (_weightSwitchValue == true)

                    ///Weight
                      AppTextField(
                        isPassword: false,
                        controller: weightController,
                        isRequired: true,
                        inputType: TextInputType.number,
                        hintText: Utils.getStringValue(
                            context, MpStringConstants.weightHint),
                      ),
                    if (_weightSwitchValue == true)
                      const SizedBox(
                        height: 20,
                      ),
                  ]),
            )
          ]),
    );
  }

  _imagesView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.images)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            if ((addNewProductMpModel?.productData?.mediaGallery ?? [])
                .isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                  addNewProductMpModel?.productData?.mediaGallery?.length ??
                      0,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        SizedBox(
                            height: AppSizes.deviceWidth / 2,
                            width: AppSizes.deviceWidth / 2,
                            child: ImageView(
                                isBottomPadding: false,
                                fit: BoxFit.fitWidth,
                                url: addNewProductMpModel?.productData
                                    ?.mediaGallery?[index].url ??
                                    '')),
                        Positioned(
                            right: 8.0,
                            left: 8.0,
                            top: 8.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final value = await Navigator.pushNamed(
                                        context, AppRoutes.editImageInfoMp,
                                        arguments: {
                                          "model": addNewProductMpModel,
                                          "index": index,
                                          "id": addNewProductMpModel
                                              ?.productData
                                              ?.mediaGallery?[index]
                                              .id ??
                                              '',
                                          "file": addNewProductMpModel
                                              ?.productData
                                              ?.mediaGallery?[index]
                                              .file ??
                                              '',
                                          "productId": mProductId,
                                        });
                                    setState(() {
                                      selectedImageRoles = value;
                                      if (kDebugMode) {
                                        print(
                                            "TEST LOG VALUE :: ${addNewProductMpModel?.productData?.baseImage}");
                                        print("TEST LOG VALUE :: $value");
                                      }
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).cardColor,
                                    radius: 17,
                                    child: Center(
                                      child: Icon(
                                        Icons.edit,
                                        size: 17,
                                        color:
                                        Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (mProductId == 0) {
                                      setState(() {
                                        isImagesListUpdated = true;
                                        addNewProductMpModel
                                            ?.productData?.mediaGallery
                                            ?.removeAt(index);
                                        var res = {
                                          "removed": true,
                                          "position": "1",
                                          "disabled": false,
                                          "file":
                                          '"${addNewProductMpModel?.productData?.mediaGallery?[index].file ?? ''}"',
                                          "value_id": addNewProductMpModel
                                              ?.productData
                                              ?.mediaGallery?[index]
                                              .valueId ??
                                              '',
                                        };
                                        updatedProductImages?.removeAt(index);
                                        deletedProductImages?.add(res);
                                        addNewProductMpModel
                                            ?.productData?.mediaGallery
                                            ?.removeAt(index);

                                        print(
                                            "TEST LOG UPDATED PRODUCT LIST => $updatedProductImages");
                                        print(
                                            "TEST LOG DELETED PRODUCT LIST => $deletedProductImages");
                                      });
                                    } else {
                                      setState(() {
                                        isImagesListUpdated = true;
                                        setState(() {
                                          var res = {
                                            "removed": true,
                                            "position": "1",
                                            "disabled": false,
                                            "file":
                                            '"${addNewProductMpModel?.productData?.mediaGallery?[index].file ?? ''}"',
                                            "value_id":
                                            '"${addNewProductMpModel?.productData?.mediaGallery?[index].valueId ?? ''}"',
                                          };
                                          // updatedProductImages?.removeAt(index);
                                          deletedProductImages?.add(res);
                                          addNewProductMpModel
                                              ?.productData?.mediaGallery
                                              ?.removeAt(index);
                                        });
                                        print(
                                            "TEST LOG UPDATED PRODUCT LIST => $updatedProductImages");
                                        print(
                                            "TEST LOG DELETED PRODUCT LIST => $deletedProductImages");
                                      });
                                    }
                                  },
                                  child: CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).cardColor,
                                    radius: 17,
                                    child: Center(
                                      child: Icon(
                                        Icons.clear_outlined,
                                        size: 17,
                                        color:
                                        Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        if (addNewProductMpModel?.productData?.baseImage ==
                            addNewProductMpModel
                                ?.productData?.mediaGallery?[index].file)
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(
                                height: 30,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5.0),
                                  child: Center(
                                    child: Text(
                                      'Base',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                          color: Colors.white,
                                          fontSize: AppSizes.textSizeTiny),
                                    ),
                                  ),
                                )),
                          ),
                      ],
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _showChoiceBottomSheet(context, (value) {
                      if (kDebugMode) {
                        print('TEST LOG ::: imageEncoded => $imageEncoded');
                        print('TEST LOG ::: imageName => $imageName');
                      }
                      print("ProductImageUploadMpEvent called");
                      print("imageEncode... $imageEncoded");
                      print("imageName... $imageName");
                      addNewProductMpBloc?.add(
                          ProductImageUploadMpEvent(imageEncoded!, imageName!));
                    });
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                      Utils.getStringValue(context, MpStringConstants.addImages)
                          .toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge),
                ),
              ),
            ),
          ]),
    );
  }

  _downloadableView() {
    _downloadableSwitchValue =
    (selectedProductType == "downloadable") ? true : false;
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.downloadable)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
              child: Row(
                children: [
                  Switch(
                    value: _downloadableSwitchValue,
                    activeColor: Theme.of(context).iconTheme.color,
                    onChanged: (newValue) {
                      setState(() {
                        _downloadableSwitchValue = newValue;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      Utils.getStringValue(
                          context, MpStringConstants.isDownloadable),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
                visible: selectedProductType == "downloadable" ||
                    _downloadableSwitchValue,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        AppTextField(
                          isPassword: false,
                          controller: titleOfLinkController,
                          isRequired: false,
                          hintText: Utils.getStringValue(
                              context, MpStringConstants.titleOfLink),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          Utils.getStringValue(context,
                              MpStringConstants.canBePurchaseSeperatelyText),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Switch(
                              value: _canPurchaseSeparatelyValue,
                              activeColor: Theme.of(context).iconTheme.color,
                              onChanged: (newValue) {
                                setState(() {
                                  _canPurchaseSeparatelyValue = newValue;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              Utils.getStringValue(
                                  context, MpStringConstants.yes),
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                        // const SizedBox(height: 5),
                        _addAnotherLinkView(),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 45,
                          child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  fileDataModel = FileModel(
                                      "",
                                      "",
                                      "0",
                                      "new"
                                  );
                                  addAnotherLinkModel = AddAnotherLinkModel(
                                    (linkDataWidgetList ?? []).length,
                                    downloadableTitleController.text,
                                    downloadablePriceController.text,
                                    selectedShareableTypeValue,
                                    selectedFileTypeValue,
                                    urlController.text,
                                    selectedSampleTypeValue,
                                    "",
                                    "",
                                    false,
                                    false,
                                    "",
                                    false,
                                    false,
                                  );
                                  // linkDataWidgetList.add(addLinkDataView());

/*
                                  addAnotherLinkModel = AddAnotherLinkModel(
                                    (addAnotherLinkItemList ?? []).length,
                                    downloadableTitleController.text,
                                    downloadablePriceController.text,
                                    selectedShareableTypeValue,
                                    selectedFileTypeValue,
                                    urlController.text,
                                    selectedSampleTypeValue,
                                    "",
                                    "",
                                    false,
                                    false,
                                    "",
                                    false,
                                    false,

                                  );
                                  addAnotherLinkItemList?.add(
                                      addAnotherLinkModel!);*/
                                });

                                addMemberToList();
                                print(myList);
                                // Clear the text fields and dropdowns for the next member
                                // downloadableTitleController.clear();
                                // downloadablePriceController.clear();
                                // Clear other controllers and variables as needed
                              },
                              child: Center(
                                  child: Text(
                                    Utils.getStringValue(
                                        context, MpStringConstants.addAnotherLink),
                                  ))),
                        ),
                        const SizedBox(height: 15),
                        AppTextField(
                          isPassword: false,
                          controller: titleOfSampleController,
                          isRequired: false,
                          hintText: Utils.getStringValue(
                              context, MpStringConstants.titleOfSample),
                          onChange: (value) {
                            titleOfSampleController.text = value;
                          },
                        ),
                        const SizedBox(height: 15),
                        _addAnotherSampleView(),
                        SizedBox(
                          height: 45,
                          child: OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  addAnotherSampleModel = AddAnotherSampleModel(
                                      (listSampleDatList ?? []).length ?? 0,
                                      false,
                                      sampleTitle:
                                      anotherSampleTitleController.text,
                                      sampleType: selectedSampleTypeValue,
                                      sampleFile:
                                      anotherSampleFileController.text,
                                      sampleUrl:
                                      anotherSampleUrlController.text,
                                      isDeleted: false);

                                  listSampleDatList.add(addSampleLiData());
                                  // addSampleLiData
                                  // addAnotherSampleItemList.add(
                                  //     addAnotherSampleModel!);
                                });
                                addToSampleDataList();

                                print(
                                    "---Sample Data List ${listForSampleData}");
                              },
                              child: Center(
                                  child: Text(
                                    Utils.getStringValue(context,
                                        MpStringConstants.addAnotherSample),
                                  ))),
                        ),
                        const SizedBox(height: 15),
                      ]),
                )),
          ]),
    );
  }

  ///     Add Another Link    ///
  _addAnotherLinkView() {
    return ListView.builder(
        itemCount: myList?.length ?? 0,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AddAnotherLinkCard(
            addAnotherLinkModel: myList?[index],
            onRemove: (value){
              print("hfdasdfhf----${value}");
              print("myList Before delete---${myList}");
              myList.removeAt(value);
              print("myList After delete---${myList}");

            },
            index:index,
            addNewProductMpBloc: addNewProductMpBloc,
            filePath: filePath?[index],

          );
        });
  }

  /// Add Sample Link ///
  _addAnotherSampleView() {
    // print("---Sample Data${listForSampleData.toString()}");
    return ListView.builder(
        itemCount: listForSampleData?.length ?? 0,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return AddAnotherSampleCard(
            addAnotherSampleModel: listForSampleData?[index],
            addNewProductMpBloc: addNewProductMpBloc,
            onRemove: (value){
              listForSampleData.removeAt(value);
            },
            index:index,


          );
        });
  }

  // _addAnotherSampleView() {
  //   return ListView.builder(
  //       itemCount: listSampleDatList.length,
  //       //addAnotherSampleItemList.length,
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         var item = listSampleDatList?[index];
  //         //addAnotherSampleItemList?[index];
  //         return Column(children: [
  //           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 IconButton(
  //                     onPressed: () {
  //                       setState(() {
  //                         // item?.isVisible = !item.isVisible;
  //                       });
  //                     },
  //                     icon: const Icon(Icons.notes)),
  //                 SizedBox(
  //                   width: 100,
  //                   height: 45,
  //                   child: TextField(
  //                       controller: anotherSampleTitleController,
  //                       decoration: const InputDecoration(
  //                           border: InputBorder.none,
  //                           focusedBorder: InputBorder.none,
  //                           enabledBorder: InputBorder.none,
  //                           disabledBorder: InputBorder.none,
  //                           errorBorder: InputBorder.none,
  //                           focusedErrorBorder: InputBorder.none,
  //                           enabled: false),
  //                     onChanged: (value){
  //                       // addAnotherSampleModel?["sampleTitle"] = "\"${value ?? ""}\"";
  //                       // addAnotherSampleModel?["title"] = "\"${value ?? ""}\"";
  //                       // anotherSampleTitleController.text = value;
  //
  //                       setState(() {
  //                         print("---------123${value}");
  //
  //                         addAnotherSampleItemList[index].sampleUrl = value;
  //                         // addAnotherSampleModel?['title'] = "\"${value}\"";
  //
  //                       });
  //                     },
  //                   ),
  //                 )
  //               ],
  //             ),
  //             IconButton(
  //                 onPressed: () {
  //                   showDialog(
  //                       context: context,
  //                       builder: (ctx) =>
  //                           MpAlertDialog(
  //                             title: Utils.getStringValue(context,
  //                                 MpStringConstants.removeItemDialogTitle),
  //                             barrierDismissible: false,
  //                             onConfirm: () {
  //                               addAnotherSampleItemList.removeAt(index);
  //                             },
  //                             onCancel: () {
  //                               Navigator.pop(context);
  //                             },
  //                             msg: Utils.getStringValue(context,
  //                                 MpStringConstants.removeItemDialogMsg),
  //                           ));
  //                 },
  //                 icon: const Icon(Icons.highlight_remove_outlined,
  //                     color: Colors.red)),
  //           ]),
  //           Visibility(
  //               visible: true,
  //               //item!.isVisible,
  //               child: Column(children: [
  //                 AppTextField(
  //                   isPassword: false,
  //                   controller: anotherSampleTitleController,
  //                   isRequired: false,
  //                   hintText:
  //                   Utils.getStringValue(context, MpStringConstants.title_),
  //                   onChange: (value){
  //                     anotherSampleTitleController.text = value;
  //                   },
  //
  //                 ),
  //                 const SizedBox(height: 15),
  //                 Container(
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(5),
  //                       border: Border.all(color: Colors.grey)),
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(left: 15.0, right: 15.0),
  //                     child: DropdownButtonFormField<String>(
  //                       borderRadius: BorderRadius.circular(5.0),
  //                       decoration: const InputDecoration(
  //                         border: InputBorder.none,
  //                         focusedBorder: InputBorder.none,
  //                         enabledBorder: InputBorder.none,
  //                         disabledBorder: InputBorder.none,
  //                         errorBorder: InputBorder.none,
  //                         focusedErrorBorder: InputBorder.none,
  //                       ),
  //                       value: selectedSampleTypeValue,
  //                       onChanged: (value) {
  //                         setState(() {
  //                           selectedSampleTypeValue = value!;
  //                         });
  //                       },
  //                       hint: const Text(
  //                         "",
  //                       ),
  //                       items: sampleTypeValueList
  //                           .map(
  //                             (item) =>
  //                             DropdownMenuItem<String>(
  //                               value: item['value'],
  //                               child: Text(item['label'],
  //                                   style:
  //                                   Theme
  //                                       .of(context)
  //                                       .textTheme
  //                                       .subtitle1),
  //                               onTap: () {
  //                                 setState(() {
  //                                   selectedSampleTypeValue = item['value'];
  //                                 });
  //                                 if (kDebugMode) {
  //                                   print(
  //                                       'TEST LOG ::: selectedSampleTypeValue => $selectedSampleTypeValue');
  //                                 }
  //                               },
  //                             ),
  //                       )
  //                           .toList(),
  //                     ),
  //                   ),
  //                 ),
  //                 Visibility(
  //                     visible: selectedSampleTypeValue == "2",
  //                     child: const SizedBox(height: 20)),
  //                 Visibility(
  //                   visible: selectedSampleTypeValue == "2",
  //                   child: Container(
  //                     width: MediaQuery
  //                         .of(context)
  //                         .size
  //                         .width / 1,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                       border: Border.all(),
  //                       borderRadius: BorderRadius.circular(5),
  //                     ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Expanded(
  //                             child: Padding(
  //                               padding: const EdgeInsets.only(left: 15.0),
  //                               child: SizedBox(
  //                                 height: 50,
  //                                 child: TextField(
  //                                     controller: anotherSampleFileController,
  //                                     decoration: InputDecoration(
  //                                       hintText: Utils.getStringValue(
  //                                         context,
  //                                         MpStringConstants.sampleFile,
  //                                       ),
  //                                       border: InputBorder.none,
  //                                       focusedErrorBorder: InputBorder.none,
  //                                       errorBorder: InputBorder.none,
  //                                       disabledBorder: InputBorder.none,
  //                                       enabledBorder: InputBorder.none,
  //                                       focusedBorder: InputBorder.none,
  //                                     )),
  //                               ),
  //                             )),
  //                         SizedBox(
  //                           height: 50,
  //                           width: 100,
  //                           child: ElevatedButton(
  //                               onPressed: () {},
  //                               style: ElevatedButton.styleFrom(
  //                                   shape: const RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.only(
  //                                       topRight: Radius.circular(4.0),
  //                                       bottomRight: Radius.circular(4.0),
  //                                     ),
  //                                   )),
  //                               child: Center(
  //                                   child: Text(
  //                                     Utils.getStringValue(
  //                                       context,
  //                                       MpStringConstants.upload,
  //                                     ),
  //                                     style: const TextStyle(
  //                                         color: Colors.white,
  //                                         fontSize: 15,
  //                                         fontWeight: FontWeight.bold),
  //                                   ))),
  //                         )
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 5),
  //                 Visibility(
  //                   visible: selectedSampleTypeValue == "\"url\"",
  //                   child: AppTextField(
  //                     isPassword: false,
  //                     controller: anotherSampleUrlController,
  //                     isRequired: false,
  //                     hintText:
  //                     Utils.getStringValue(context, MpStringConstants.url),
  //                     onChange: (value){
  //                       anotherSampleUrlController.text = value;
  //                     },
  //                   ),
  //                 ),
  //                 const SizedBox(height: 15),
  //               ]))
  //         ]);
  //       });
  // }

  _seoView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.seo)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15.0, 4.0, 15.0, 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///Meta Title
                    AppTextField(
                      isPassword: false,
                      controller: metaTitleController,
                      isRequired: false,
                      hintText: Utils.getStringValue(
                          context, MpStringConstants.metaTitle),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    ///Meta Keyword
                    SizedBox(
                      height: AppSizes.deviceWidth / 2.3,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: metaKeywordController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.metaKeyword),
                            border: const OutlineInputBorder(),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            floatingLabelAlignment:
                            FloatingLabelAlignment.start,
                            alignLabelWithHint: true),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    ///Meta Description
                    SizedBox(
                      height: AppSizes.deviceWidth / 2.3,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: metaDescriptionController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 12,
                        decoration: InputDecoration(
                            labelText: Utils.getStringValue(
                                context, MpStringConstants.metaDescription),
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
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
  }

  _relatedProductsView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.relatedProducts)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            if (selectedRelatedItemList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                child: ListView.builder(
                  itemCount: selectedRelatedItemList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outline
                                    .withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: AppSizes.deviceWidth / 4,
                                      height: AppSizes.deviceWidth / 4,
                                      child: ImageView(
                                        isBottomPadding: false,
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                        url: selectedRelatedItemList[index]
                                            .thumbnail ??
                                            '',
                                      )),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Text(
                                            selectedRelatedItemList[index]
                                                .name ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                            overflow: TextOverflow.clip,
                                            maxLines: 3,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          selectedRelatedItemList[index]
                                              .price ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedRelatedItemList,
                                          index: index,
                                          title: MpStringConstants.attributeSet,
                                          value: selectedRelatedItemList[index]
                                              .attrinuteSet ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedRelatedItemList,
                                          index: index,
                                          title: MpStringConstants.status,
                                          value: selectedRelatedItemList[index]
                                              .status ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedRelatedItemList,
                                          index: index,
                                          title: MpStringConstants.type,
                                          value: selectedRelatedItemList[index]
                                              .type ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedRelatedItemList,
                                          index: index,
                                          title: MpStringConstants.sku,
                                          value: selectedRelatedItemList[index]
                                              .sku ??
                                              '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedRelatedItemList.removeAt(index);
                                        MediaGallery mediaGalleryItem =
                                        MediaGallery(
                                          // label: currentState.productImageUploadModel.name,
                                          // mediaType: currentState.productImageUploadModel.type,
                                          removed: false,
                                          position: "1",
                                          file: selectedRelatedItemList[index]
                                              .thumbnail ??
                                              '',
                                          url: selectedRelatedItemList[index]
                                              .thumbnail ??
                                              '',
                                        );
                                        addNewProductMpModel
                                            ?.productData?.mediaGallery
                                            ?.add(mediaGalleryItem);
                                      });
                                      if (kDebugMode) {
                                        print(
                                            "TEST LOG ::: selectedRelatedItemList length => ${selectedRelatedItemList.length}");
                                      }
                                    },
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.delete,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(Utils.getStringValue(context,
                                              AppStringConstant.remove)),
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: OutlinedButton(
                onPressed: () async {
                  print("sdha----${selectedRelatedItemList}");
                  final value = await Navigator.pushNamed(
                      context, AppRoutes.addProduct,
                      arguments: {
                        "pageType": "Related",
                        "selectedItemList": selectedRelatedItemList,
                        'productId': mProductId ?? "",
                      });
                  if (value != null) {
                    setState(() {
                      selectedRelatedItemList =
                      value as List<ProductCollectionData>;
                    });
                    selectedRelatedIdsList = [];
                    for (var i = 0; i < selectedRelatedItemList.length; i++) {
                      if (selectedRelatedItemList[i].selected == true) {
                        selectedRelatedIdsList
                            .add(selectedRelatedItemList[i].entity_id);
                      }
                      if (kDebugMode) {
                        print(
                            'TEST LOG ::: selectedRelatedIdsList $selectedRelatedIdsList');
                      }
                    }
                  }
                },
                child: Text(
                    Utils.getStringValue(
                        context, MpStringConstants.addRelatedProducts)
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
          ]),
    );
  }

  _upSellProductsView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(
                  context, MpStringConstants.upsellProducts)
                  .toUpperCase(),
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            if (selectedUpSellItemList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                child: ListView.builder(
                  itemCount: selectedUpSellItemList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outline
                                    .withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: AppSizes.deviceWidth / 4,
                                      height: AppSizes.deviceWidth / 4,
                                      child: ImageView(
                                        isBottomPadding: false,
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                        url: selectedUpSellItemList[index]
                                            .thumbnail ??
                                            '',
                                      )),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Text(
                                            selectedUpSellItemList[index]
                                                .name ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                            overflow: TextOverflow.clip,
                                            maxLines: 3,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          selectedUpSellItemList[index].price ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedUpSellItemList,
                                          index: index,
                                          title: MpStringConstants.attributeSet,
                                          value: selectedUpSellItemList[index]
                                              .attrinuteSet ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedUpSellItemList,
                                          index: index,
                                          title: MpStringConstants.status,
                                          value: selectedUpSellItemList[index]
                                              .status ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedUpSellItemList,
                                          index: index,
                                          title: MpStringConstants.type,
                                          value: selectedUpSellItemList[index]
                                              .type ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedUpSellItemList,
                                          index: index,
                                          title: MpStringConstants.sku,
                                          value: selectedUpSellItemList[index]
                                              .sku ??
                                              '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedUpSellItemList.removeAt(index);
                                      });
                                      if (kDebugMode) {
                                        print(
                                            "TEST LOG ::: selectedUpSellItemList length => ${selectedUpSellItemList.length}");
                                      }
                                    },
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.delete,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(Utils.getStringValue(context,
                                              AppStringConstant.remove)),
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: OutlinedButton(
                onPressed: () async {
                  final value = await Navigator.pushNamed(
                      context, AppRoutes.addProduct,
                      arguments: {
                        "pageType": "UpSell",
                        "selectedItemList": selectedUpSellItemList,
                        'productId': mProductId ?? "",
                      });
                  if (value != null) {
                    setState(() {
                      selectedUpSellItemList =
                      value as List<ProductCollectionData>;
                    });
                    selectedUpSellIdsList = [];
                    for (var i = 0; i < selectedUpSellItemList.length; i++) {
                      if (selectedUpSellItemList[i].selected == true) {
                        selectedUpSellIdsList
                            .add(selectedUpSellItemList[i].entity_id ?? '');
                      }
                      if (kDebugMode) {
                        print(
                            'TEST LOG ::: selectedUpSellIdsList $selectedUpSellIdsList');
                      }
                    }
                  }
                },
                child: Text(
                    Utils.getStringValue(
                        context, MpStringConstants.addUpsellProducts)
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
          ]),
    );
  }

  _crossSellProductsView() {
    return Container(
      color: Theme.of(context).cardColor,
      child: ExpansionTile(
          initiallyExpanded: true,
          title: Text(
              Utils.getStringValue(context, MpStringConstants.crossSellProducts)
                  .toUpperCase() ??
                  '',
              style: Theme.of(context).textTheme.titleLarge),
          children: [
            if (selectedCrossSellItemList.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 15.0),
                child: ListView.builder(
                  itemCount: selectedCrossSellItemList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outline
                                    .withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: AppSizes.deviceWidth / 4,
                                      height: AppSizes.deviceWidth / 4,
                                      child: ImageView(
                                        isBottomPadding: false,
                                        borderRadius:
                                        BorderRadius.circular(5.0),
                                        url: selectedCrossSellItemList[index]
                                            .thumbnail ??
                                            '',
                                      )),
                                  const SizedBox(
                                    width: 15.0,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 180,
                                          child: Text(
                                            selectedCrossSellItemList[index]
                                                .name ??
                                                '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                            overflow: TextOverflow.clip,
                                            maxLines: 3,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          selectedCrossSellItemList[index]
                                              .price ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedCrossSellItemList,
                                          index: index,
                                          title: MpStringConstants.attributeSet,
                                          value:
                                          selectedCrossSellItemList[index]
                                              .attrinuteSet ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedCrossSellItemList,
                                          index: index,
                                          title: MpStringConstants.status,
                                          value:
                                          selectedCrossSellItemList[index]
                                              .status ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedCrossSellItemList,
                                          index: index,
                                          title: MpStringConstants.type,
                                          value:
                                          selectedCrossSellItemList[index]
                                              .type ??
                                              '',
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        SelectedProductCardElementView(
                                          selectedCrossSellItemList:
                                          selectedCrossSellItemList,
                                          index: index,
                                          title: MpStringConstants.sku,
                                          value:
                                          selectedCrossSellItemList[index]
                                              .sku ??
                                              '',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedCrossSellItemList
                                            .removeAt(index);
                                      });
                                      if (kDebugMode) {
                                        print(
                                            "TEST LOG ::: selectedCrossSellItemList length => ${selectedCrossSellItemList.length}");
                                      }
                                    },
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.delete,
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(Utils.getStringValue(context,
                                              AppStringConstant.remove)),
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: OutlinedButton(
                onPressed: () async {
                  final value = await Navigator.pushNamed(
                      context, AppRoutes.addProduct,
                      arguments: {
                        "pageType": "CrossSell",
                        "selectedItemList": selectedCrossSellItemList,
                        'productId': mProductId == 0 ? null : mProductId,
                      });

                  if (value != null) {
                    setState(() {
                      selectedCrossSellItemList =
                      value as List<ProductCollectionData>;
                    });

                    selectedCrossSellIdsList = [];
                    for (var i = 0; i < selectedCrossSellItemList.length; i++) {
                      if (selectedCrossSellItemList[i].selected == true) {
                        selectedCrossSellIdsList
                            .add(selectedCrossSellItemList[i].entity_id ?? '');
                      }
                      if (kDebugMode) {
                        print(
                            'TEST LOG ::: SelectedCrossSellIdsList $selectedCrossSellIdsList');
                      }
                    }
                  }
                },
                child: Text(
                    Utils.getStringValue(
                        context, MpStringConstants.addCrossSellProducts)
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ),
          ]),
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
                  isLoading = true;
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
                  isLoading = true;
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
      // Navigator.of(context).pop();
      productImage = File(photo?.path ?? "");
      final bytes = productImage?.readAsBytesSync();
      String img64 = base64Encode(bytes!);
      imageName = photo?.name ?? '';
      imageEncoded = img64;
      addImageCallback!(img64);
    });
  }

  void _openGallery(BuildContext context, addImageCallback) async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 60);
    print("open gallery setstate");
    setState(() {
      productImage = File(image?.path ?? "");
      final bytes = productImage?.readAsBytesSync();
      print("bytes data encoding...");
      String img64 = base64Encode(bytes!);
      imageName = image?.name ?? '';
      imageEncoded = img64;
      addImageCallback!(img64);
      // Navigator.of(context).pop();
    });
  }

  Widget optionTile(String title, VoidCallback? addAction) {
    return GestureDetector(
      onTap: addAction,
      child: SizedBox(
          height: AppSizes.itemHeight,
          width: AppSizes.deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Divider()
            ],
          )),
    );
  }

  void addMemberToList() {

    fileData = [];
    sampleFileData = [];
    uploadedFileData = {
      "file": "\"\"",
      "name": "\"\"",
      "size": "\"\"",
      "status":"\"new\""
    };

    uploadSampleFileData = {
      "file":uploadDownloadableProductFileModel?.file ?? "",
      "name":uploadDownloadableProductFileModel?.name ?? "",
      "size":uploadDownloadableProductFileModel?.size ?? "",
      "status":"\"new\"",
    };



    print("hafdhfileData---${fileData}");

    switch (selectedShareableTypeValue) {
      case "1":
        {
          selectedShareableTypeValue = "1";
          break;
        }
      case "2":
        {
          selectedShareableTypeValue = "2";
          break;
        }
      case "3":
        {
          selectedShareableTypeValue = "3";
          break;
        }
    }

    var member = {
      "link_id": 0,
      "sort_order": "\"1\"",
      "is_delete": false,
      "title": downloadableTitleController.text,
      "price": downloadablePriceController.text,
      "type": selectedFileTypeValue,
      "file": fileData,
      "link_url": "\" \"",
      "sample": {
        "url": "\" \"",
        "type": selectedSampleTypeValue ?? "",
        "file": sampleFileData,
      },
      "is_shareable": "\"${selectedShareableTypeValue}\"",
      "is_unlimited": _unlimitedValue != true ? "\"1\"" : "\"0\"",
    };

    myList.add(member);

  }

  void addToSampleDataList() {
    sampleData = [];
    sampleFileUploadData = {
      "file": "\"\"",
      //uploadDownloadableProductFileModel?.file ?? "",
      "name":"\"\"",
      //uploadDownloadableProductFileModel?.name ?? "",
      "size": "\"\"",
      //uploadDownloadableProductFileModel?.size ?? "",
      "status":"\"new\"",
    };

    var sampleDatas = {
      "sample_id": 0,
      "sort_order": "\"1\"",
      "is_delete": false,
      "title": anotherSampleTitleController.text,
      "type": selectedSampleTypeValue,
      "sample_url": "\"\"",
      //selectedSampleTypeValue ?? "",
      "file": sampleData
    };
    listForSampleData.add(sampleDatas);
  }

  Widget addSampleLiData() {
    TextEditingController anotherSampleTitleController =
    TextEditingController();
    TextEditingController sampleUrlController = TextEditingController();
    String? selectedSampleTypeValue = "\"url\"";

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    // item.isVisible = !item.isVisible;
                  });
                },
                icon: const Icon(Icons.notes)),
            SizedBox(
              width: 100,
              height: 45,
              child: TextField(
                controller: anotherSampleTitleController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    enabled: false),
                onChanged: (value) {
                  anotherSampleTitleController.text = value;

                  // anotherSampleTitleController.text = value;

                  setState(() {
                    print("---------123${value}");

                    addAnotherSampleModel?.sampleTitle = value;
                    // addAnotherSampleModel?['title'] = "\"${value}\"";
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
                  builder: (ctx) => MpAlertDialog(
                    title: Utils.getStringValue(
                        context, MpStringConstants.removeItemDialogTitle),
                    barrierDismissible: false,
                    onConfirm: () {
                      // addAnotherSampleItemList.removeAt(index);
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
              controller: anotherSampleTitleController,
              isRequired: false,
              hintText: Utils.getStringValue(context, MpStringConstants.title_),
              onChange: (value) {
                anotherSampleTitleController.text = value;
              },
            ),
            const SizedBox(height: 15),
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
                visible: selectedSampleTypeValue == "2",
                child: const SizedBox(height: 20)),
            Visibility(
              visible: selectedSampleTypeValue == "2",
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
                          onPressed: () {},
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
            const SizedBox(height: 5),
            Visibility(
              visible: selectedSampleTypeValue == "\"url\"",
              child: AppTextField(
                isPassword: false,
                controller: anotherSampleUrlController,
                isRequired: false,
                hintText: Utils.getStringValue(context, MpStringConstants.url),
                onChange: (value) {
                  anotherSampleUrlController.text = value;
                },
              ),
            ),
            const SizedBox(height: 15),
          ]))
    ]);
  }

  Widget addLinkDataView() {
    ///ADD ANOTHER LINK DATA
    TextEditingController downloadableTitleController = TextEditingController();
    TextEditingController downloadablePriceController = TextEditingController();
    TextEditingController urlController = TextEditingController();
    String? selectedSampleTypeValue = "\"url\"";
    TextEditingController anotherSampleFileController = TextEditingController();
    TextEditingController anotherSampleUrlController = TextEditingController();
    String? selectedShareableTypeValue = "1";
    bool _unlimitedValue = false;
    TextEditingController maxDownloadableController = TextEditingController();

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    // addAnotherLinkModel?.isVisible = !addAnotherLinkModel?.isVisible;
                    // print("Add Link Visibility ${addAnotherLinkModel?.isVisible}");
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
                      // addAnotherLinkItemList?.removeAt(0);
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
                  addAnotherLinkModel!.linkTitle = value;
                });
              },
            ),
            const SizedBox(height: 5),
            AppTextField(
              isPassword: false,
              controller: downloadablePriceController,
              isRequired: false,
              hintText: Utils.getStringValue(context, MpStringConstants.price),
              onChange: (value) {
                setState(() {
                  addAnotherLinkModel!.linkPrice = value;
                });
              },
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 5),
            AppTextField(
              isPassword: false,
              controller: urlController,
              isRequired: false,
              hintText: Utils.getStringValue(context, MpStringConstants.url),
            ),
            const SizedBox(height: 15),
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
                visible: selectedSampleTypeValue == "2",
                child: const SizedBox(height: 20)),
            Visibility(
              visible: selectedSampleTypeValue == "2",
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
                          onPressed: () {},
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
            const SizedBox(height: 5),
            Visibility(
              visible: selectedSampleTypeValue == "1",
              child: AppTextField(
                isPassword: false,
                controller: anotherSampleUrlController,
                isRequired: false,
                hintText:
                Utils.getStringValue(context, MpStringConstants.sampleUrl),
              ),
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 15),
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
            const SizedBox(height: 5),
            if (!_unlimitedValue)
              AppTextField(
                isPassword: false,
                controller: maxDownloadableController,
                isRequired: false,
                hintText: Utils.getStringValue(
                    context, MpStringConstants.maxDownloads),
              ),
            const SizedBox(height: 15),
          ]))
    ]);
  }

  getSampleData(List<AddAnotherSampleModel> sample) {
    List<Map<String, dynamic>> sampleData = [];

    sample.asMap().forEach((index, element) {
      Map<String, dynamic> sampleItemData = {};
      sampleItemData["sample_id"] = index.toString();
      sampleItemData["sort_order"] = index.toString();
      sampleItemData["is_delete"] = false;
      sampleItemData["title"] = "\"${element.sampleTitle}\"";
      sampleItemData["type"] = "\"url\"";
      sampleItemData["file"] = "\"\"";
      sampleItemData["sample_url"] = "\"${element.sampleUrl}\"";

      sampleData.add(sampleItemData);
    });

    return sampleData;
  }

  getLinkData(List<AddAnotherLinkModel>? link) {
    List<Map<String, dynamic>> linkData = [];

    (link ?? []).asMap().forEach((index, element) {
      Map<String, dynamic> linkItemData = {};
      linkItemData["link_id"] = index;
      linkItemData["sort_order"] = true;
      linkItemData["is_delete"] = false;
      linkItemData["title"] = "\"${element.linkTitle}\"";
      linkItemData["type"] = "\"url\"";
      linkItemData["file"] = [];
      linkItemData["link_url"] = "\"${element.linkUrl}\"";

      Map<String, String> sampleData = {};
      sampleData["type"] = "\"url\"";
      // sampleData["file"] = "\"\"";
      sampleData["file"] = "[]";
      sampleData["link_url"] = "\"${element.sampleLink}\"";
      linkItemData["sample"] = sampleData;

      // linkItemData["is_shareable"] = "\"${(element.isLinkShareable??false ? 1:0 )}\"";
      linkItemData["is_shareable"] =
      "\"${(element.isLinkShareable ?? false ? true : false)}\"";
      // linkItemData["is_unlimited"] = "\"${(element.isUnlimited??false ? 1:0 )}\"";
      linkItemData["is_unlimited"] =
      "\"${(element.isUnlimited ?? false ? true : false)}\"";

      linkData.add(linkItemData);
    });

    // linkDataWidgetList.forEach((element) {
    //   element.
    // });

    return linkData;
  }
}
