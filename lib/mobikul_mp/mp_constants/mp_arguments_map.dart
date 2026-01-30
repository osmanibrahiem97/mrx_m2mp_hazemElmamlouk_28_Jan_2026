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

//============================Map Keys==============================//

const sellerIdKey = "sellerIdKey";
const sellerNameKey = "sellerNameKey";
const tokenKey = "tokenKey";
const sellerIncreementIdKey = "sellerIncreementIdKey";
const sellerInvoiceIdKey = "sellerInvoiceIdKey";
const sellerShipmentIdKey = "sellerShipmentIdKey";
const reportSellerKey = "reportSeller";
const invoiceIncrementKey = "invoiceIncrementKey";
const shipmentIncrementKey = "shipmentIncrementKey";
const customerId = "customerId";



//===============================================================//

Map<String, dynamic> getSellerData(String id, String name, String token,String sellerId){
  Map<String, dynamic> args = {};
  args[sellerIdKey] = id;
  args[sellerNameKey] = name;
  args[tokenKey] = token;
  args[customerId] = sellerId;

  return args;
}


Map<String, dynamic> getSellerCreateCreditMemoData(String? increementId, String? invoiceId , String? invoiceIncrement){
  Map<String, dynamic> args = {};
  args[sellerIncreementIdKey] = increementId;
  args[sellerInvoiceIdKey] = invoiceId;
  args[invoiceIncrementKey] = invoiceIncrement;
  return args;
}

Map<String, dynamic> getSellerOrderDetail(String increementId, String sellerId){
  Map<String, dynamic> args = {};
  args[sellerIncreementIdKey] = increementId;
  args[sellerIdKey] = sellerId;
  return args;
}


Map<String, dynamic> getSellerShipmentDetail(String? increementId, String? shipmentId, String? shipmentIncrement){
  Map<String, dynamic> args = {};
  args[sellerIncreementIdKey] = increementId;
  args[sellerShipmentIdKey] = shipmentId;
  args[shipmentIncrementKey] = shipmentIncrement;

  return args;
}

Map<String, dynamic> getStoreProfileAttributeMap(
    int? sellerId, bool? reportSeller) {
  Map<String, dynamic> args = {};
  args[sellerIdKey] = sellerId;
  args[reportSellerKey] = reportSeller;
  return args;
}

