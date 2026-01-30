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

import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:test_new/mobikul/helper/app_storage_pref.dart';
import 'package:test_new/mobikul/models/base_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/product_image_upload/product_image_upload_model.dart';
import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/save_product_mp_model/save_product_model.dart';
import 'package:test_new/mobikul_mp/mp_models/marketplace/marketplace_layout_one/all_sellers/all_sellers_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_download_shipment_mp_model/seller_download_shipment_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/seller_profile_mp_model/upload_banner_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_models/store_profile_mp_model/store_profile_mp_model.dart';
import 'package:test_new/mobikul_mp/mp_screens/seller_profile_mp/bloc/seller_profile_mp_event.dart';
import '../../mobikul/constants/app_constants.dart';
import '../../mobikul/models/catalog/catalog_model.dart';
import '../../mobikul/models/seller_menu_model/seller_menu_model_data.dart';
import '../../mobikul/network_manager/graph_ql.dart';
import '../mp_models/add_new_product_mp_model/add_new_product_mp_model.dart';
import '../mp_models/add_new_product_mp_model/select_products/select_products_mp_model.dart';
import '../mp_models/add_new_product_mp_model/upload_file_data_model/upload_file_data_model.dart';
import '../mp_models/creditmemo_mp/seller_orders_creditmemo_mp_model.dart';
import '../mp_models/customer_mp/customer_mp_model.dart';
import '../mp_models/invoice_print_template_mp/invoice_mp_model.dart';
import '../mp_models/marketplace/marketplace_landing_page_model.dart';
import '../mp_models/seller_dashboard_mp/seller_dashboard_mp_model.dart';
import '../mp_models/seller_invoice_screen_mp/seller_invoice_screen_mp_model.dart';
import '../mp_models/seller_list_mp/seller_list_mp_model.dart';
import '../mp_models/seller_order_deails_mp/seller_orders_details_mp_model.dart';
import '../mp_models/seller_order_shipment_mp/seller_orders_shipment_mp_model.dart';
import '../mp_models/seller_order_view_refund_mp/seller_orders_view_refund_mp_model.dart';
import '../mp_models/seller_orders_mp/seller_orders_list_mp_model.dart';
import '../mp_models/seller_products_mp/seller_products_list_mp_model.dart';
import '../mp_models/seller_profile_mp_model/seller_profile_mp_model.dart';
import '../mp_models/ship_items_createshipment_model/ship_items_createshipment_mp_model.dart';
import '../mp_models/transaction_detail_mp_model/transaction_detail_mp_model.dart';
import '../mp_models/transaction_mp/transaction_download_mp_model.dart';
import '../mp_models/transaction_mp/transaction_mp_model.dart';
import '../mp_screens/add_new_product_mp/widgets/seller_new_product_save_request.dart';
import '../mp_screens/seller_profile_mp/widgets/seller_profile_save_request.dart';
import 'mp_mutation_query.dart';

typedef Parser<T> = T Function(Map<String, dynamic> json);

class MPApiClient {
  GraphQlApiCalling client = GraphQlApiCalling();
  MPMutationsData mutation = MPMutationsData();

  T? handleResponse<T>(
      QueryResult<Object?> result,
      String operation,
      Parser<T> parser,
      ) {
    /// Log response

    log("RESPONSE_DATA ----------------------------> ${result.data}");
    log("EXCEPTION ----------------------------> ${result.exception}");

    Map<String, dynamic>? data = {};
    if (result.hasException) {
      data.putIfAbsent("success", () => false);
    } else {
      data = result.data![operation];
      data?.putIfAbsent("success", () => true);
      data?.putIfAbsent("responseStatus", () => true);
    }
    return parser(data ?? {});
  }

  ///Get Transaction List
  Future<TransactionMpModel?> getTransactionList(String transactionId,
      String dateFrom, String dateTo, int pageNumber) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getTransactionList(
            appStoragePref.getWebsiteId(),
            appStoragePref.getStoreId(),
            appStoragePref.getCurrencyCode(),
            appStoragePref.getCustomerToken(),
            transactionId.isNotEmpty ? transactionId : "0",
            dateFrom,
            dateTo,
            pageNumber),
      ),
    ));
    return handleResponse(
      response,
      'transactionlist',
          (json) => TransactionMpModel.fromJson(json),
    );
  }

  ///Get Transaction details
  Future<TransactionDetailMpModel?> getTransactionDetails(
      String transactionId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getTransactionDetails(
            appStoragePref.getStoreId(),
            appStoragePref.getCurrencyCode(),
            appStoragePref.getCustomerToken(),
            transactionId.isNotEmpty ? transactionId : "0"),
      ),
    ));
    return handleResponse(
      response,
      'viewtransaction',
          (json) => TransactionDetailMpModel.fromJson(json),
    );
  }

  ///request withdrawal
  Future<BaseModel?> requestWithdrawal() async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.withdrawalRequest(appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(), "1"),
      ),
    ));
    return handleResponse(
      response,
      'withdrawalrequest',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///Seller dashboard
  Future<SellerDashboardMpModel?> getSellerDashboard() async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerDashboard(
          appStoragePref.getStoreId(),
          appStoragePref.getCustomerToken(),
          "1",
          AppSizes.deviceWidth.toInt(),
        ),
      ),
    ));
    return handleResponse(
      response,
      'dashboard',
          (json) => SellerDashboardMpModel.fromJson(json),
    );
  }

  ///getInvoicePrintTempData
  Future<InvoiceMpModel?> getInvoicePrintTempData() async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getInvoicePrintTempData(
          appStoragePref.getStoreId(),
          appStoragePref.getCustomerToken(),
        ),
      ),
    ));
    return handleResponse(
      response,
      'pdfheaderformdata',
          (json) => InvoiceMpModel.fromJson(json),
    );
  }

  ///saveInvoicePrintTempData
  Future<BaseModel?> saveInvoicePrintTempData(String pdfHeader) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.saveInvoicePrintTempData(appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(), pdfHeader),
      ),
    ));
    return handleResponse(
      response,
      'savepdfheader',
          (json) => BaseModel.fromJson(json),
    );
  }

  /// Seller productlist
  Future<SellerProductsListMpModel?> getProductList(int pageNumber) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getProductList(appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(), pageNumber),
      ),
    ));
    return handleResponse(
      response,
      'productlist',
          (json) => SellerProductsListMpModel.fromJson(json),
    );
  }

  /// delete product
  Future<BaseModel?> deleteSellerProduct(String productId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.deleteSellerProduct(appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(), productId),
      ),
    ));
    return handleResponse(
      response,
      'productdelete',
          (json) => BaseModel.fromJson(json),
    );
  }

  /// Seller newformdata
  Future<AddNewProductMpModel?> getAddNewProductData(int productId) async {
    log("TEST_LOG==productId==> $productId");
    var response = await (client.clientToQuery()).query(QueryOptions(
        cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
        fetchPolicy: FetchPolicy.noCache,
        document: (productId == 0)
            ? gql(
          mutation.getAddNewProductData(appStoragePref.getStoreId(),
              appStoragePref.getCustomerToken()),
        )
            : gql(
          mutation.getEditNewProductData(appStoragePref.getStoreId(),
              appStoragePref.getCustomerToken(), productId),
        )));
    return handleResponse(
      response,
      'newformdata',
          (json) => AddNewProductMpModel.fromJson(json),
    );
  }

  ///submitSellerReport
  Future<BaseModel?> submitSellerReportTempData(
      {String? customerName,
        String? customerEmail,
        String? otherReason,
        bool? isOtherReason,
        int? sellerId,
        int? reasonId}) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.submitSellerReportTempData(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          customerName: customerName,
          customerEmail: customerEmail,
          otherReason: otherReason,
          isOtherReason: isOtherReason,
          sellerId: sellerId,
          reasonId: reasonId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'savesellerreport',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///Report Product
  Future<BaseModel?> reportProduct(
      {String? customerName,
        String? customerEmail,
        String? otherReason,
        bool? isOtherReason,
        int? productId,
        int? reasonId}) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.reportProduct(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          customerName: customerName,
          customerEmail: customerEmail,
          otherReason: otherReason,
          isOtherReason: (isOtherReason??false)  ? 1 : 0,
          productId: productId,
          reasonId: reasonId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'saveproductreport',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///SubmitWriteToUs
  Future<BaseModel?> submitWriteToUs(
      String query, String subject, int sellerId) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.submitWriteToUsTempData(appStoragePref.getCustomerToken(),
            appStoragePref.getStoreId(), query, subject, sellerId),
      ),
    ));
    return handleResponse(
      response,
      'contactseller',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///SubmitWriteYourReviewMp
  Future<BaseModel?> submitWriteYourReview(
      String shopUrl,
      String nickName,
      String summary,
      String sellerId,
      double priceRating,
      double valueRating,
      String description,
      String customerEmail,
      double qualityRating,
      ) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.submitWriteYourReviewTempData(
            appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(),
            shopUrl,
            nickName,
            summary,
            sellerId,
            priceRating,
            valueRating,
            description,
            customerEmail,
            qualityRating),
      ),
    ));
    return handleResponse(
      response,
      'savereview',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///SubmitBecomeSeller
  Future<BaseModel?> submitBecomeSellerTempData(String shopUrl) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.submitBecomeSellerTempData(appStoragePref.getCustomerToken(),
            appStoragePref.getStoreId(), shopUrl),
      ),
    ));
    return handleResponse(
      response,
      'becomeseller',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///getAllSellersListTempData
  Future<AllSellersModel?> getAllSellersListTempData(String searchQuery) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getAllSellersListTempData(
          '',
          '1000',
          appStoragePref.getStoreId(),
          '1',
          searchQuery,
        ),
      ),
    ));
    return handleResponse(
      response,
      'sellerlist',
          (json) => AllSellersModel.fromJson(json),
    );
  }

  ///SubmitAskQuestion
  Future<BaseModel?> submitAskQuestion(String query, String subject) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.submitAskQuestionTempData(appStoragePref.getCustomerToken(),
            appStoragePref.getStoreId(), query, subject),
      ),
    ));
    return handleResponse(
      response,
      'askquestiontoadmin',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///seller list chat with admin
  Future<SellerListMpModel?> getSellerListForChat(String searchQuery) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerListForChat(
          appStoragePref.getWebsiteId(),
          appStoragePref.getStoreId(),
          appStoragePref.getCustomerToken(),
          '1000',
          '1',
        ),
      ),
    ));
    return handleResponse(
      response,
      'sellerlists',
          (json) => SellerListMpModel.fromJson(json),
    );
  }

  /// Seller Account
  ///Get seller orders list
  Future<SellerOrderListMpModel?> getSellerOrderList(int? pageNumber, String? orderId, String? dateFrom, String? dateTo, String? status) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      document: gql(
        mutation.getSellerOrderList(appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(), pageNumber, orderId, dateFrom, dateTo, status),
      ),
    ));
    return handleResponse(
      response,
      'sellerorderlist',
          (json) => SellerOrderListMpModel.fromJson(json),
    );
  }

  /// Seller Order Details
  Future<SellerOrderDetailsMpModel?> getSellerOrderDetails(
      String? increementId, String? sellerId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerOrderDetails(
            int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(),
            increementId,
            int.parse(sellerId!),
            (AppSizes.deviceWidth.toInt().toString())),
      ),
    ));
    return handleResponse(
      response,
      'vieworder',
          (json) => SellerOrderDetailsMpModel.fromJson(json),
    );
  }

  /// Seller Invoice View
  Future<SellerInvoiceScreenMpModel?> getSellerInvoiceView(
      String? increementId, String? invoiceId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerInvoiceView(
          int.parse(appStoragePref.getStoreId()),
          appStoragePref.getCustomerToken(),
          invoiceId,
          increementId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'viewinvoice',
          (json) => SellerInvoiceScreenMpModel.fromJson(json),
    );
  }

  /// Seller Shipment View
  Future<SellerOrdersShipmentMpModel?> getSellerShipmentView(
      String? increementId, String? shipmentId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerShipmentView(
          int.parse(appStoragePref.getStoreId()),
          appStoragePref.getCustomerToken(),
          shipmentId,
          increementId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'viewshipment',
          (json) => SellerOrdersShipmentMpModel.fromJson(json),
    );
  }

  //, String shipmentId, String increementId

  /// Download All Shipment View
  Future<SellerDownloadShipmentMpModel?> getDownloadAllShipmentView(
      String? dateTo, String? dateFrom, String? shipmentId, String? increementId) async {

    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerDownloadallShipping(
            int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(),
            shipmentId,
            increementId
        ),
      ),
    ));
    return handleResponse(
      response,
      'downloadallshipping',
          (json) => SellerDownloadShipmentMpModel.fromJson(json),
    );
  }

  /// Download All Invoice View
  Future<SellerDownloadShipmentMpModel?> getSellerDownloadallInvoice(
      String? increementId, String? invoiceId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerDownloadallInvoice(
            int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(),
            increementId,
            invoiceId
        ),
      ),
    ));
    return handleResponse(
      response,
      'downloadallinvoice',
          (json) => SellerDownloadShipmentMpModel.fromJson(json),
    );
  }

  /// SEller Tracking Information View
  Future<BaseModel?> getSellerSendTrackingInfo(
      String? increementId, String? shipmentId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sendTrackingInfo(int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(), increementId, shipmentId),
      ),
    ));
    return handleResponse(
      response,
      'sendtrackinginfo',
          (json) => BaseModel.fromJson(json),
    );
  }

  /// Seller New Credit View Data
  Future<SellerOrdersCreditmemoMpModel?> getSellerCreditMemoFormData(
      String? increementId, String? invoiceId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerCreditFormdataiew(
          int.parse(appStoragePref.getStoreId()),
          appStoragePref.getCustomerToken(),
          increementId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'creditmemoformdata',
          (json) => SellerOrdersCreditmemoMpModel.fromJson(json),
    );
  }

  /// Seller create credit memo
  Future<SellerOrdersCreditmemoMpModel?> getSellerCreateCreditMemo(
      String? increementId,
      String? comment,
      String? doOffline,
      String? sendEmail,
      String? invoiceId,
      String? shippingAmount,
      String? isVisibleOnFront,
      String? adjustmentPositive,
      String? adjustmentNegative,
      String? commentCustomerNotify,
      String? productName,
      int? productId,
      String? currencyWithPrice) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.createcreditmemo(
            int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(),
            increementId,
            comment,
            doOffline,
            sendEmail,
            invoiceId,
            shippingAmount,
            isVisibleOnFront,
            adjustmentPositive,
            adjustmentNegative,
            commentCustomerNotify,
            productName,
            productId,
            currencyWithPrice),
      ),
    ));
    return handleResponse(
      response,
      'createcreditmemo',
          (json) => SellerOrdersCreditmemoMpModel.fromJson(json),
    );
  }

  /// Seller create Invoice
  Future<BaseModel?> getSellerCreateInvoice(String? increementId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.createInvoice(int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(), increementId),
      ),
    ));
    return handleResponse(
      response,
      'createinvoice',
          (json) => BaseModel.fromJson(json),
    );
  }

  /// Seller New Credit View Data
  Future<BaseModel?> getSellerCancelOrder(String? increementId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerCancelOrder(
          int.parse(appStoragePref.getStoreId()),
          appStoragePref.getCustomerToken(),
          increementId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'cancelorder',
          (json) => BaseModel.fromJson(json),
    );
  }

  /// Seller createshipment
  Future<ShipItemsCreateshipmentMpModel?> getSellerCreateShipment(
      String? increementId, String? carrierData, String? trackingData) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerCreateShipment(
            int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(),
            increementId,
            carrierData,
            trackingData),
      ),
    ));
    return handleResponse(
      response,
      'createshipment',
          (json) => ShipItemsCreateshipmentMpModel.fromJson(json),
    );
  }

  /// Seller createshipment
  Future<SellerOrdersViewRefundMpModel?> getSellerRefund(
      String? increementId, String? creditMemoId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerViewCreditMemo(int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(), increementId, creditMemoId),
      ),
    ));
    return handleResponse(
      response,
      'viewcreditmemo',
          (json) => SellerOrdersViewRefundMpModel.fromJson(json),
    );
  }

  /// Seller sendcreditmemo
  Future<BaseModel?> getSendcreditmemo(
      String? increementId, String? creditMemoId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerSendcreditmemo(int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(), increementId, creditMemoId),
      ),
    ));
    return handleResponse(
      response,
      'sendcreditmemo',
          (json) => SellerOrdersViewRefundMpModel.fromJson(json),
    );
  }

  /// Seller sendinvoice
  Future<BaseModel?> getSendInvoice(
      String? increementId, String? invoiceId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerSendinvoice(int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(), increementId, invoiceId),
      ),
    ));
    return handleResponse(
      response,
      'sendinvoice',
          (json) => SellerOrdersViewRefundMpModel.fromJson(json),
    );
  }

  /// Seller sendinvoice
  Future<BaseModel?> getSendOrderEmail(
      String? increementId) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerSendorderemail(int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(), increementId),
      ),
    ));
    return handleResponse(
      response,
      'sendorderemail',
          (json) => SellerOrdersViewRefundMpModel.fromJson(json),
    );
  }

  /// Seller Profile
  Future<BaseModel?> saveSellerProfile(
      String? increementId, String? carrierData, String? trackingData) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerCreateShipment(
            int.parse(appStoragePref.getStoreId()),
            appStoragePref.getCustomerToken(),
            increementId,
            carrierData,
            trackingData),
      ),
    ));
    return handleResponse(
      response,
      'createshipment',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///Get Seller profile data
  Future<SellerProfileMpModel?> getSellerProfileFormData() async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerProfileFormData(
          appStoragePref.getStoreId(),
          appStoragePref.getCustomerToken(),
        ),
      ),
    ));
    return handleResponse(
      response,
      'profileformdata',
          (json) => SellerProfileMpModel.fromJson(json),
    );
  }

  ///save Seller profile data
  Future<BaseModel?> saveSellerProfileData(
      SellerProfileSaveRequestModel sellerProfileSaveRequestModel) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.saveSellerProfileData(appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken(), sellerProfileSaveRequestModel),
      ),
    ));
    return handleResponse(
      response,
      'saveProfile',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///Get Seller Related ProductData
  Future<SelectProductsMpModel?> getSellerRelatedProductData({
    int? width,
    int? pageNumber,
    String? filterData,
    String? sortData,
    int? productId,
    int? onlySelected,
  }) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerRelatedProductData(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          width: width,
          pageNumber: pageNumber,
          filterData: filterData,
          sortData: sortData,
          onlySelected: onlySelected,
          productId: productId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'relatedproductdata',
          (json) => SelectProductsMpModel.fromJson(json),
    );
  }

  ///Get Seller UpSell ProductData
  Future<SelectProductsMpModel?> getSellerUpSellProductData({
    String? productId,
  }) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerUpSellProductData(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          productId: productId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'upsellproductdata',
          (json) => SelectProductsMpModel.fromJson(json),
    );
  }

  ///Get Seller CrossSell ProductData
  Future<SelectProductsMpModel?> getSellerCrossSellProductData({
    int? productId,
  }) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getSellerCrossSellProductData(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          productId: productId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'crosssellproductdata',
          (json) => SelectProductsMpModel.fromJson(json),
    );
  }

  ///saveSellerProduct
  Future<SaveProductModel?> saveSellerProduct(
      {SellerNewProductSaveRequestModel? sellerNewProductSaveRequestModel,
        int? productId}) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: (productId == null)
          ? gql(
        mutation.createNewProduct(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          metaKeyword: sellerNewProductSaveRequestModel?.metaKeyword,
          metaDescription:
          sellerNewProductSaveRequestModel?.metaDescription,
          name: sellerNewProductSaveRequestModel?.name,
          attributeSetId:
          sellerNewProductSaveRequestModel?.attributeSetId,
          baseImage: sellerNewProductSaveRequestModel?.baseImage,
          categoryIds:
          sellerNewProductSaveRequestModel?.categoryIds ?? [],
          crossSell: sellerNewProductSaveRequestModel?.crossSell ?? [],
          customAttribute:
          sellerNewProductSaveRequestModel?.customAttribute ?? [],
          customOptionData:
          sellerNewProductSaveRequestModel?.customOptionData ?? [],
          description: sellerNewProductSaveRequestModel?.description,
          isDownloadable:
          sellerNewProductSaveRequestModel?.isDownloadable,
          isFeaturedProduct:
          sellerNewProductSaveRequestModel?.isFeaturedProduct,
          isInStock: sellerNewProductSaveRequestModel?.isInStock,
          linksData: sellerNewProductSaveRequestModel?.linksData,
          linksTitle: sellerNewProductSaveRequestModel?.linksTitle,
          metaTitle: sellerNewProductSaveRequestModel?.metaTitle,
          mpProductCartLimit:
          sellerNewProductSaveRequestModel?.mpProductCartLimit,
          price: sellerNewProductSaveRequestModel?.price,
          productHasWeight:
          sellerNewProductSaveRequestModel?.productHasWeight,
          purchasedSeparately:
          sellerNewProductSaveRequestModel?.purchasedSeparately,
          qty: sellerNewProductSaveRequestModel?.qty,
          related: sellerNewProductSaveRequestModel?.related,
          samplesData: sellerNewProductSaveRequestModel?.samplesData,
          samplesTitle: sellerNewProductSaveRequestModel?.samplesTitle,
          shortDescription:
          sellerNewProductSaveRequestModel?.shortDescription,
          sku: sellerNewProductSaveRequestModel?.sku,
          smallImage: sellerNewProductSaveRequestModel?.smallImage,
          specialFromDate:
          sellerNewProductSaveRequestModel?.specialFromDate,
          status: sellerNewProductSaveRequestModel?.status,
          swatchImage: sellerNewProductSaveRequestModel?.swatchImage,
          taxClassId: sellerNewProductSaveRequestModel?.taxClassId,
          thumbnail: sellerNewProductSaveRequestModel?.thumbnail,
          type: sellerNewProductSaveRequestModel?.type,
          upsell: sellerNewProductSaveRequestModel?.upsell,
          urlKey: sellerNewProductSaveRequestModel?.urlKey,
          visibility: sellerNewProductSaveRequestModel?.visibility,
          websiteIds: sellerNewProductSaveRequestModel?.websiteIds,
          weight: sellerNewProductSaveRequestModel?.weight,
          mediaGallery: sellerNewProductSaveRequestModel?.mediaGallery,
          specialPrice: sellerNewProductSaveRequestModel?.specialPrice,
          specialToDate: sellerNewProductSaveRequestModel?.specialToDate,
        ),
      )
          : gql(
        mutation.saveSellerProduct(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          productId: sellerNewProductSaveRequestModel?.productId ?? '',
          metaKeyword: sellerNewProductSaveRequestModel?.metaKeyword,
          metaDescription:
          sellerNewProductSaveRequestModel?.metaDescription,
          name: sellerNewProductSaveRequestModel?.name,
          attributeSetId:
          sellerNewProductSaveRequestModel?.attributeSetId,
          baseImage: sellerNewProductSaveRequestModel?.baseImage,
          categoryIds:
          sellerNewProductSaveRequestModel?.categoryIds ?? [],
          crossSell: sellerNewProductSaveRequestModel?.crossSell ?? [],
          customAttribute:
          sellerNewProductSaveRequestModel?.customAttribute ?? [],
          customOptionData:
          sellerNewProductSaveRequestModel?.customOptionData ?? [],
          description: sellerNewProductSaveRequestModel?.description,
          isDownloadable:
          sellerNewProductSaveRequestModel?.isDownloadable,
          isFeaturedProduct:
          sellerNewProductSaveRequestModel?.isFeaturedProduct,
          isInStock: sellerNewProductSaveRequestModel?.isInStock,
          linksData: sellerNewProductSaveRequestModel?.linksData,
          linksTitle: sellerNewProductSaveRequestModel?.linksTitle,
          metaTitle: sellerNewProductSaveRequestModel?.metaTitle,
          mpProductCartLimit:
          sellerNewProductSaveRequestModel?.mpProductCartLimit,
          price: sellerNewProductSaveRequestModel?.price,
          productHasWeight:
          sellerNewProductSaveRequestModel?.productHasWeight,
          purchasedSeparately:
          sellerNewProductSaveRequestModel?.purchasedSeparately,
          qty: sellerNewProductSaveRequestModel?.qty,
          related: sellerNewProductSaveRequestModel?.related,
          samplesData: sellerNewProductSaveRequestModel?.samplesData,
          samplesTitle: sellerNewProductSaveRequestModel?.samplesTitle,
          shortDescription:
          sellerNewProductSaveRequestModel?.shortDescription,
          sku: sellerNewProductSaveRequestModel?.sku,
          smallImage: sellerNewProductSaveRequestModel?.smallImage,
          specialFromDate:
          sellerNewProductSaveRequestModel?.specialFromDate,
          status: sellerNewProductSaveRequestModel?.status,
          swatchImage: sellerNewProductSaveRequestModel?.swatchImage,
          taxClassId: sellerNewProductSaveRequestModel?.taxClassId,
          thumbnail: sellerNewProductSaveRequestModel?.thumbnail,
          type: sellerNewProductSaveRequestModel?.type,
          upsell: sellerNewProductSaveRequestModel?.upsell,
          urlKey: sellerNewProductSaveRequestModel?.urlKey,
          visibility: sellerNewProductSaveRequestModel?.visibility,
          websiteIds: sellerNewProductSaveRequestModel?.websiteIds,
          weight: sellerNewProductSaveRequestModel?.weight,
          mediaGallery: sellerNewProductSaveRequestModel?.mediaGallery,
          specialPrice: sellerNewProductSaveRequestModel?.specialPrice,
          specialToDate: sellerNewProductSaveRequestModel?.specialToDate,
        ),
      ),
    ));
    return handleResponse(
      response,
      'saveproduct',
          (json) => SaveProductModel.fromJson(json),
    );
  }

  /// Store Profile
  Future<StoreProfileMpModel?> getStoreProfile(
      {int? sellerId, String? currency, int? width}) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
        cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
        fetchPolicy: FetchPolicy.cacheAndNetwork,
        document: gql(
          mutation.getStoreProfile(
            storeId: int.parse(appStoragePref.getStoreId().toString()),
            customerToken: appStoragePref.getCustomerToken(),
            sellerId: sellerId,
            currency: currency,
            width: width,
          ),
        )));
    return handleResponse(
      response,
      'sellerprofile',
          (json) => StoreProfileMpModel.fromJson(json),
    );
  }

  /// Upload Product Image
  Future<ProductImageUploadModel?> uploadProductImage(
      {String? imageName, String? imageEncoded}) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
        cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
        fetchPolicy: FetchPolicy.noCache,
        document: gql(
          mutation.uploadProductImage(
            storeId: int.parse(appStoragePref.getStoreId().toString()),
            customerToken: appStoragePref.getCustomerToken(),
            imageName: (imageName ?? "").trim(),
            imageEncoded: imageEncoded,
          ),
        )));
    return handleResponse(
      response,
      'uploadProductImage',
          (json) => ProductImageUploadModel.fromJson(json),
    );
  }

  ///Get seller Collection Data
  Future<CatalogModel?> getSellerCollectionData(
      String type,
      String id,
      int page,
      List<Map<String, String>> filterData,
      Map<String, String>? sortData) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      document: gql(
        mutation.sellerCollection(
          appStoragePref.getStoreId(),
          appStoragePref.getCustomerToken(),
          appStoragePref.getCurrencyCode(),
          type,
          id ?? "",
          filterData,
          sortData,
          page,
        ),
      ),
    ));
    return handleResponse(
      response,
      'sellercollection',
          (json) => CatalogModel.fromJson(json),
    );
  }

  ///uploadProfilePic
  Future<dynamic> uploadProfile(String image) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.uploadProfilePic(appStoragePref.getCustomerToken(), image,
            AppSizes.deviceWidth.toString(), "1"),
      ),
    ));
    return handleResponse(
      response,
      'uploadSellerProfilePic',
          (json) => SellerProfileMpModel.fromJson(json),
    );
  }

  ///uploadBannerPic
  Future<SellerProfileMpModel?> uploadBannerPic(String image) async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.uploadBannerPic(appStoragePref.getCustomerToken(), image,
            AppSizes.deviceWidth.toString(), "1"),
      ),
    ));
    return handleResponse(
      response,
      'uploadSellerProfilePic',
          (json) => SellerProfileMpModel.fromJson(json),
    );
  }

  ///deleteSeller
  Future<BaseModel?> deleteSellerImage(String entity) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.deleteSellerImage(
          appStoragePref.getCustomerToken(),
          appStoragePref.getStoreId(),
          entity,
        ),
      ),
    ));
    return handleResponse(
      response,
      'deletesellerimage',
          (json) => BaseModel.fromJson(json),
    );
  }

  ///getMarketplaceData
  Future<MarketplaceLandingPageModel?> getMarketplaceData() async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.mergeOptimistic,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
      document: gql(
        mutation.getMarketplaceData(
          appStoragePref.getCustomerToken(),
          appStoragePref.getStoreId(),
        ),
      ),
    ));
    return handleResponse(
      response,
      'landingpagedata',
          (json) => MarketplaceLandingPageModel.fromJson(json),
    );
  }

  ///Get Customer List
  Future<CustomerMpModel?> getCustomerList(
      {String? name,
        String? email,
        String? billingFull,
        String? billingTelephone,
        String? gender,
        int? websiteId}) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.getCustomerList(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          name: name,
          email: email,
          billingFull: billingFull,
          billingTelephone: billingTelephone,
          gender: gender,
          websiteId: websiteId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'customerlist',
          (json) => CustomerMpModel.fromJson(json),
    );
  }

  ///Download transaction
  Future<TransactionDownloadMpModel?> downloadTransactionList({
    String? dateTo,
    String? dateFrom,
    int? pageNumber,
    String? transactionId,
  }) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.downloadTransactionList(
          storeId: appStoragePref.getStoreId(),
          customerToken: appStoragePref.getCustomerToken(),
          dateTo: dateTo,
          dateFrom: dateFrom,
          pageNumber: pageNumber,
          transactionId: transactionId,
        ),
      ),
    ));
    return handleResponse(
      response,
      'downloadtransactionlist',
          (json) => TransactionDownloadMpModel.fromJson(json),
    );
  }

  /// Seller Menu

  Future<SellerMenuData?> sellerMenus() async {
    var response = await (client.clientToQuery()).mutate(MutationOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.sellerMenus(
            appStoragePref.getStoreId(),
            appStoragePref.getCustomerToken()
        ),
      ),
    ));
    return handleResponse(
      response,
      'sellerAppMenus',
          (json) => SellerMenuData.fromJson(json),
    );
  }

  Future<UploadDownloadableProductFileModel?> uploadDownloadableProductFile(
      String? fileName,
      String? fileEncoded,
      String? fileType
      ) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
          mutation.uploadDownloadableProductFile(
            storeId: int.parse(appStoragePref.getStoreId()),
            customerToken: appStoragePref.getCustomerToken(),
            fileName: fileName,
            fileEncoded: fileEncoded,
            fileType: fileType,
          )
      ),
    ));
    return handleResponse(
      response,
      'uploadDownloadableProduct',
          (json) => UploadDownloadableProductFileModel.fromJson(json),
    );
  }

  /// Notify Admin
  Future<BaseModel?> notifyAdmin(
      String? sellerName,
      String? message
      ) async {
    var response = await (client.clientToQuery()).query(QueryOptions(
      cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
      fetchPolicy: FetchPolicy.noCache,
      document: gql(
        mutation.adminNotifying(
          storeId: int.parse(appStoragePref.getStoreId()),
          customerToken: appStoragePref.getCustomerToken(),
          websiteId:int.parse(appStoragePref.getWebsiteId()),
          sellerName: sellerName,
          message: message,
        ),
      ),
    ));
    return handleResponse(
      response,
      'notifyadmin',
          (json) => BaseModel.fromJson(json),
    );
  }

Future<BaseModel?> notifySeller(
    String? adminName,
    String? message,
    int? sellerId
    ) async {
  var response = await (client.clientToQuery()).query(QueryOptions(
    cacheRereadPolicy: CacheRereadPolicy.ignoreOptimisitic,
    fetchPolicy: FetchPolicy.noCache,
    document: gql(
      mutation.sellerNotifying(
          storeId: int.parse(appStoragePref.getStoreId()),
          customerToken: appStoragePref.getCustomerToken(),
          websiteId:int.parse(appStoragePref.getWebsiteId()),
          adminName: adminName,
          message: message,
          sellerId: sellerId
      ),
    ),
  ));
  return handleResponse(
    response,
    'notifyadmin',
        (json) => BaseModel.fromJson(json),
  );
}


}
