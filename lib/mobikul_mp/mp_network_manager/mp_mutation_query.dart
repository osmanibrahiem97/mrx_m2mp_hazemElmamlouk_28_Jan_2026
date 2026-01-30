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

import 'dart:convert';

import 'package:test_new/mobikul_mp/mp_models/add_new_product_mp_model/media_gallery.dart';

import '../mp_screens/seller_profile_mp/widgets/seller_profile_save_request.dart';

class MPMutationsData {
  String getTransactionList(
      String websiteId,
      String storeId,
      String currencyCode,
      String customerToken,
      String transactionId,
      String dateFrom,
      String dateTo,
      int pageNumber) {
    return """
      query transactionlist {
          transactionlist(storeId:$storeId, currency:"$currencyCode", customerToken:"$customerToken", transactionId:"$transactionId", dateFrom:"$dateFrom", dateTo:"$dateTo", pageNumber:$pageNumber) {
                    success
                    message
                    totalSellerEarning
                    unformattedTotalSellerEarning
                    totalSale
                    unformattedTotalSale
                    totalTax
                    unformattedTotalTax
                    totalCommission
                    unformattedTotalCommission
                    totalPayout
                    unformattedTotalPayout
                    remainingPayout
                    unformattedRemainingPayout
                    isWithdrawalEligible
                    totalCount
                    transactionList{
                            id
                            date
                            amount
                            comment
                            transactionId
                        }
                    remainingTransactionAmount
                            
              }
           }
    """;
  }

  String getTransactionDetails(String storeId, String currencyCode,
      String customerToken, String transactionId) {
    return """
      query viewtransaction {
          viewtransaction(storeId:$storeId, currency:"$currencyCode", customerToken:"$customerToken", transactionId:"$transactionId") {
                    success
                    message
                    transactionId
                    date
                    type
                    method
                    amount
                    orderList{
                        qty 
                        price 
                        totalTax 
                        shipping 
                        totalPrice 
                        commission 
                        incrementId 
                        productName 
                        subTotal
                    }
                            
              }
           }
    """;
  }

  String withdrawalRequest(
      String storeId, String customerToken, String isRequested) {
    return """
      query withdrawalrequest {
          withdrawalrequest(
          storeId:$storeId,
           customerToken:"$customerToken",
            isRequested:$isRequested) {
                    success
                    message   
              }
           }
    """;
  }

  String getSellerDashboard(
      String storeId, String customerToken, String mFactor, int width) {
    return """
      query dashboard {
          dashboard(
          storeId:$storeId, 
          customerToken:"$customerToken", 
          mFactor:$mFactor, 
          width:$width) {
                    success
                    message
                    # dailySalesLocationReport
                    # yearlySalesLocationReport
                    # monthlySalesLocationReport
                    # weeklySalesLocationReport
                    salesStats
                    dailySalesStats
                    weeklySalesStats
                    yearlySalesStats
                    monthlySalesStats
                    totalPayout
                    lifetimeSale
                    remainingAmount
                    topSellingProducts{
                    reviewCount
                    configurableData{
                    attributes{
                    id
                    code
                    label
                    options{
                    id
                    label
                    products
                    }
                    swatchType
                    updateProductPreviewImage
                    }
                    template
                    optionPrices{
                    oldPrice{amount}
                    basePrice{amount}
                    finalPrice{amount}
                    tierPrices{amount}
                    msrpPrice{amount}
                    product
                    }
                    productId
                    chooseText
                    images
                    index
                    swatchData
                    }
                    isInWishlist
                    wishlistItemId
                    typeId
                    entityId
                    rating
                    isAvailable
                    price
                    finalPrice
                    formattedPrice
                    formattedFinalPrice
                    name
                    hasRequiredOptions
                    isNew
                    isInRange
                    thumbNail
                    dominantColor
                    tierPrice
                    formattedTierPrice
                    minAddToCartQty
                    availability
                    arUrl
                    arType
                    #arTextureImages
                    salesQty
                    }
                    categoryChart
                    recentOrderList{
                    orderId
                    incrementId
                    qtyOrdered
                    qtyInvoiced
                    qtyShipped
                    qtyCanceled
                    qtyRefunded
                    productNames{
                    qty
                    name
                    productId
                    }
                    status
                    statusColorCode
                    customerDetails{
                    name
                    date
                    baseTotal
                    purchaseTotal
                    }
                    }
                    reviewList{
                    name
                    date
                    comment
                    priceRating
                    valueRating
                    qualityRating
                    avgRating
                    }
                            
              }
           }
    """;
  }

  String getInvoicePrintTempData(String storeId, String customerToken) {
    return """
      query pdfheaderformdata {
            pdfheaderformdata(storeId:$storeId, customerToken:"$customerToken") {
                    success
                    message
                    headerInfo
              }
           }
    """;
  }

  String saveInvoicePrintTempData(
      String storeId, String customerToken, String pdfHeader) {
    return """
      query savepdfheader {
            savepdfheader(storeId:$storeId, customerToken:"$customerToken", pdfHeader:${json.encode(pdfHeader)}) {
                    success
                    message
                   
              }
           }
    """;
  }

  String getProductList(String storeId, String customerToken, int pageNumber) {
    return """
      query productlist {
            productlist(storeId:$storeId, customerToken:"$customerToken",pageNumber:$pageNumber) {
                    success
                    message
                    enabledStatusText
                    disabledStatusText
                    totalCount
                    productList { 
                        productId
                        image
                        openable
                        productPrice
                        name
                        productType
                        sku
                        specialPrice
                        specialFromDate
                        taxClassId
                        categories {
                            name
                        }
                        specialToDate
                        status
                        qtySold
                        qtyPending
                        qtyConfirmed
                        earnedAmount
                    }
                   
              }
           }
    """;
  }

  String deleteSellerProduct(
      String storeId, String customerToken, String productId) {
    return """
      query productdelete {
            productdelete(storeId:$storeId, customerToken:"$customerToken", productId:"$productId") {
                    success
                    message
                   
              }
           }
    """;
  }

  String getAddNewProductData(String storeId, String customerToken) {
    return """
      query newformdata {
            newformdata(storeId:$storeId, customerToken:"$customerToken") {
                    success
                    message
                    inventoryAvailabilityOptions {
                        value
                        label
                    }
                    allowedAttributes {
                        value
                        label
                    }
                    imageRole {
                        id
                        label
                        value
                    }
                    allowedTypes {
                        value
                        label
                    }
                    isCategoryTreeAllowed
                    categories {
                        category_id
                        name
                        children {
                            category_id
                            name
                            children {
                                category_id
                                name
                                children {
                                    category_id
                                    name
                                    children {
                                        category_id
                                        name
                                    }
                                }
                            }
                        }
                    }
                    assignedCategories {
                        id
                        name
                    }
                    skuType
                    skuhint
                    showHint
                    skuPrefix
                    priceHint
                    imageHint
                    weightUnit
                    productHint
                    categoryHint
                    inventoryHint
                    currencySymbol
                    descriptionHint
                    specialPriceHint
                    specialEndDateHint
                    shortdescriptionHint
                    specialStartDateHint
                    addProductLimitStatus
                    addGlobalProductLimitStatus
                    addUpsellProductStatus
                    addRelatedProductStatus
                    addCrosssellProductStatus
                    inventoryAvailabilityHint
                    taxHint
                    weightHint
                    taxOptions {
                        label
                        value
                    }
                    visibilityOptions {
                        value
                        label
                    }
                    productData {
                        type
                        websiteIds
                        attributeSetId
                        categoryIds
                        name
                        description
                        shortDescription
                        sku
                        price
                        specialPrice
                        specialFromDate
                        specialToDate
                        qty
                        visibility
                        isInStock
                        taxClassId
                        productHasWeight
                        weight
                        status
                        isFeaturedProduct
                        metaTitle
                        metaKeyword
                        metaDescription
                        mpProductCartLimit
                        baseImage
                        smallImage
                        swatchImage
                        thumbnail
                        mediaGallery {
                            value_id
                            file
                            media_type
                            entity_id
                            label
                            position
                            disabled
                            label_default
                            position_default
                            disabled_default
                            video_provider
                            video_url
                            video_title
                            video_description
                            video_metadata
                            video_provider_default
                            video_url_default
                            video_title_default
                            video_description_default
                            video_metadata_default
                            video_source
                            url
                            id
                        }
                        related
                        upsell
                        crossSell
                    }
                   
              }
           }
    """;
  }

  String getEditNewProductData(
      String storeId, String customerToken, int productId) {
    return """
      query newformdata {
            newformdata(storeId:$storeId, customerToken:"$customerToken", productId:$productId) {
                    success
                    message
                   inventoryAvailabilityOptions{
value
label
}
allowedAttributes{
value
label
}
imageRole{
id
label
value
}
allowedTypes{
value
label
}
isCategoryTreeAllowed
categories{
category_id
name
children{
category_id
name
children{
category_id
name
children{
category_id
name
children{
category_id
name
}
}
}
}
}
assignedCategories{
id
name
}
skuType
skuhint
showHint
skuPrefix
priceHint
imageHint
weightUnit
productHint
categoryHint
inventoryHint
currencySymbol
descriptionHint
specialPriceHint
specialEndDateHint
shortdescriptionHint
specialStartDateHint
addProductLimitStatus
addGlobalProductLimitStatus
addUpsellProductStatus
addRelatedProductStatus
addCrosssellProductStatus
inventoryAvailabilityHint
taxHint
weightHint
taxOptions{
label
value
}
visibilityOptions{
value
label
}
productData{
type
websiteIds
attributeSetId
categoryIds
name
description
shortDescription
sku
price
specialPrice
specialFromDate
specialToDate
qty
visibility
isInStock
taxClassId
productHasWeight
status
isFeaturedProduct
weight
metaTitle
metaKeyword
metaDescription
mpProductCartLimit
baseImage
smallImage
swatchImage
thumbnail
mediaGallery{
value_id
file
media_type
entity_id
label
position
disabled
label_default
position_default
disabled_default
video_provider
video_url
video_title
video_description
video_metadata
video_provider_default
video_url_default
video_title_default
video_description_default
video_metadata_default
video_source
url
id
}
related
upsell
crossSell
linkData{
link_id
title
price
link_url
sort_order
type
file{
file
size
status
name
}
is_shareable
sample {
type
file {
file
size
status
name
}
url
}
is_unlimited
number_of_downloads
}
samplesData{
sample_id
title
sample_url
type
sort_order
file {
sample_id
file
size
status
name
}
}
}
                   
              }
           }
    """;
  }

  String submitSellerReportTempData({
    String? storeId,
    String? customerToken,
    String? customerName,
    String? customerEmail,
    String? otherReason,
    bool? isOtherReason,
    int? sellerId,
    int? reasonId,
  }) {
    return """
      query savesellerreport {
            savesellerreport(
            storeId:$storeId,
            customerToken:"$customerToken",
            sellerId:$sellerId,
            otherReason:"$otherReason",
            isOtherReason:"$isOtherReason",
            reasonId: $reasonId,
            customerEmail:"$customerEmail",
            customerName:"$customerName",
           ) {
                    success
                    message                  
              }
           }
    """;
  }

  String reportProduct({
    String? storeId,
    String? customerToken,
    String? customerName,
    String? customerEmail,
    String? otherReason,
    int? isOtherReason,
    int? productId,
    int? reasonId,
  }) {
    return """
      query saveproductreport {
              saveproductreport(
                storeId:$storeId,
                customerToken:"$customerToken",
                productId:$productId,
                otherReason:"$otherReason",
                isOtherReason:$isOtherReason,
                reasonId: $reasonId,
                customerEmail:"$customerEmail",
                customerName:"$customerName",
              ) {
                        success
                        message                  
                 }
              }
    """;
  }

  String submitWriteToUsTempData(
      String customerToken,
      String storeId,
      String query,
      String subject,
      int sellerId,
      ) {
    return """
      query contactseller {
            contactseller(storeId:$storeId, customerToken:"$customerToken", query:"$query", subject:"$subject", sellerId:$sellerId) {
                    success
                    message                  
              }
           }
    """;
  }

  String submitWriteYourReviewTempData(
      String storeId,
      String customerToken,
      String shopUrl,
      String nickName,
      String summary,
      String sellerId,
      double priceRating,
      double valueRating,
      String description,
      String customerEmail,
      double qualityRating,
      ) {
    return """
      query savereview {
            savereview(storeId:$storeId, customerToken:"$customerToken", shopUrl:"$shopUrl", nickName:"$nickName", summary:"$summary", sellerId:$sellerId,priceRating:${priceRating.toInt()},valueRating:${valueRating.toInt()},description:"$description",customerEmail:"$customerEmail",qualityRating:${qualityRating.toInt()},) {
                    success
                    message                  
              }
           }
    """;
  }

  String submitBecomeSellerTempData(
      String customerToken,
      String storeId,
      String shopUrl,
      ) {
    return """
      query becomeseller {
            becomeseller(storeId:$storeId, customerToken:"$customerToken", shopUrl:"$shopUrl") {
                    success
                    message                  
              }
           }
    """;
  }

  String getAllSellersListTempData(String eTag, String width, String storeId,
      String mFactor, String searchQuery) {
    return """
      query sellerlist {
            sellerlist(eTag:"$eTag", width:$width, storeId:$storeId, mFactor:$mFactor, searchQuery:"$searchQuery") {
                    success
                    message
                    displayBanner
                    bannerContent
                    buttonNHeadingLabel
                    bottomLabel
                    bannerImage
                    topLabel
                    sellersData{
                        logo 
                        sellerId 
                        shoptitle 
                        companyDescription 
                        companyLocality 
                        bannerImage 
                        productCount
                    }
              }
           }
    """;
  }

  String submitAskQuestionTempData(
      String customerToken, String storeId, String query, String subject) {
    return """
      query askquestiontoadmin {
            askquestiontoadmin(storeId:$storeId, customerToken:"$customerToken", query:"$query", subject:"$subject") {
                    success
                    message                  
              }
           }
    """;
  }

  String getSellerListForChat(String websiteId, String storeId,
      String customerToken, String width, String mFactor) {
    return """
      query sellerlists {
            sellerlists(
              websiteId:$websiteId, 
              storeId:$storeId, 
              customerToken:"$customerToken", 
              width:$width,
              mFactor:$mFactor
              ) {
                    success
                    message
                    apiKey
                    sellerList {
                        customerId
                        customerToken
                        name
                        email
                        profileImage
                    }
              }
           }
    """;
  }

  ///Seller Account

  /// Seller Order

  String getSellerOrderList(
      String storeId, String customerToken, int? pageNumber, String? orderId, String? dateFrom, String? dateTo, String? status) {
    return """
      query sellerorderlist {
    sellerorderlist(storeId:$storeId,
        dateTo:"$dateTo",
        dateFrom:"$dateFrom",
        status:0,
        incrementId:"$orderId",
        pageNumber:$pageNumber,
        customerToken:"$customerToken"
        eTag:"" ) {
        success
        message
        otherError
        totalCount
        orderList{
            status
            statusColorCode
            orderId
            incrementId
            productNames {
                qty
                name
                productId
            }
            customerDetails {
                name
                date
                baseTotal
                purchaseTotal
            }
        }
        orderStatus {
            status
            label
        }
        manageOrder
    }
}
    """;
  }

  /// Seller Order Details
  String getSellerOrderDetails(int storeId, String? customerToken,
      String? incrementId, int? sellerId, String? width) {
    return """
      query vieworder {
vieworder(
storeId:$storeId
incrementId:"$incrementId"
width:$width
sellerId:$sellerId
customerToken:"$customerToken")
{
invoiceIncrement
shipmentIncrement
success
message
statusLabel
incrementId
orderDate
orderTotal
orderData {
itemList{
sellerItemCost
formattedSellerItemCost
totalTaxPerItem
formattedTotalTaxPerItem
adminItemCommission
formattedAdminItemCommission
name
productId
#option
sku
price
qty {
Ordered
Shipped
Canceled
Refunded
}
subTotal
image
}
totals {
code
label
value
formattedValue
}
}
state
invoiceId
shipmentId
manageOrder
cancelButton
sendEmailButton
invoiceButton
shipmentButton
creditMemoButton
showBuyerInformation
buyerName
buyerEmail
showAddressInformation
canShip
shippingAddress
billingAddress
shippingMethod
subHeading
mainHeading
statusHeading
amountHeading
actionHeading
createdAtHeading
creditMemoIdHeading
creditMemoList{
entityId
incrementId
billToName
createdAt
status
amount
}
paymentMethod
}
}
      """;
  }

  /// Seller Invoice View
  String sellerInvoiceView(int storeId, String customerToken, String? invoiceId,
      String? increementId) {
    return """
      query viewinvoice {
viewinvoice(
storeId:$storeId,
incrementId:"$increementId",
invoiceId: $invoiceId,
customerToken:"$customerToken")
{
success
message
mainHeading
subHeading
invoiceStatus
invoiceDate
actionButtons {
label
title
confirmMsg
}
orderInfoHeading
orderHeading
orderStatusHeading
orderStatus
orderDateHeading
orderDate
showBuyerInformation
buyerInfoHeading
customerNameHeading
customerName
customerEmailHeading
customerEmail
State
StatusColorCode
addressinfoHeading
showAddressInformation
billingAddressHeading
billingAddress
shippingAddressHeading
shippingAddress
paymentAndShippingHeading
paymentInfoHeading
paymentMethod
shippingInfoHeading
shippingMethod
itemInvoicedHeading
itemList {
productName
#customOption
downloadableOptionLable
#downloadableOptionValue: [],
sku
price
brandName
qty {
label
value
}
totalPrice
mpcodprice
adminCommission
vendorTotal
subTotal
totalTax
rowTotal
discount
itemId
}
totals {
code
label
value
formattedValue
}
}
}
      """;
  }

  /// Seller Shipment View
  String sellerShipmentView(int storeId, String customerToken,
      String? shipmentId, String? increementId) {
    return """
      query viewshipment {
    viewshipment(
        storeId:$storeId,
        incrementId:"$increementId",
        shipmentId:$shipmentId,
        customerToken:"$customerToken")
            {
                mainHeading
                subHeading
                shipmentIncrementedId
                shipmentDate
                actionButtons{
                    label 
                    title 
                    confirmMsg
                }
                orderInfoHeading
                orderHeading
                orderIncrementedId
                orderStatusHeading
                orderStatus
                orderDateHeading
                orderDate
                showBuyerInformation
                buyerInfoHeading
                customerNameHeading
                customerName
                customerEmailHeading
                customerEmail
                State
                StatusColorCode
                addressinfoHeading
                showAddressInformation
                billingAddressHeading
                billingAddress
                shippingAddressHeading
                shippingAddress
                paymentAndShippingHeading
                paymentInfoHeading
                paymentMethod
                shippingInfoHeading
                shippingMethod
                hashUrlValue
                trackingUrlLabel
                trackingCarrier{
                    value 
                    label
                }
                trackingDetails{
                    id 
                    carrier 
                    title 
                    trackingNumber
                }
                itemShippedHeading
                itemList{
                    productName 
                    # customOption{
                    #             sku
                    #             price
                    #             # mpcodprice
                    #             # adminCommission
                    #             # vendorTotal
                    #             # subTotal
                    #             }
                    downloadableOptionLable 
                    #downloadableOptionValue: [],
                    sku 
                    price 
                    brandName 
                    qty{
                       label 
                       value 
                      }
                    totalPrice 
                    mpcodprice 
                    adminCommission 
                    vendorTotal 
                    subTotal 
                    totalTax 
                    rowTotal 
                    discount 
                    itemId 
                }
                subTotal
                shipping
                discount
                tax
                mpcodcharge
                orderTotal
                orderBaseTotal
                vendorTotal
                vendorBaseTotal
                adminCommission
                adminBaseCommission
            }
}
      """;
  }

  /// Seller Credit Memo FormData View
  String sellerCreditFormdataiew(
      int storeId, String customerToken, String? increementId) {
    return """
      query creditmemoformdata {
    creditmemoformdata(
            storeId:$storeId
            customerToken:"$customerToken"
            incrementId:"$increementId"
            )
            {
                    success
                    message 
                    mainHeading 
                    subHeading 
                    status 
                    orderDate 
                    buyerInfoHeading 
                    customerNameHeading 
                    customerName 
                    customerEmailHeading 
                    customerEmail 
                    orderInfoHeading 
                    paymentMethodHeading 
                    paymentMethod 
                    itemsRefundHeading 
                    itemsProductNameHeading 
                    itemsPiceHeading 
                    itemsQtyHeading 
                    itemsReturnToStockHeading 
                    itemsQtyToRefundHeading
                    itemsSubtotalHeading
                    itemsCodHeading
                    itemsTaxAmtHeading
                    itemsDiscountAmtHeading
                    itemsRowTotalHeading
                    itemList{
                            productName 
                            #customOption {}
                            downloadableOptionLable 
                            #downloadableOptionValue{}
                            sku
                            price 
                            brandName 
                            qty{
                                label
                                value
                            }
                            totalPrice 
                            mpcodprice 
                            adminCommission 
                            vendorTotal 
                            subTotal 
                            totalTax 
                            rowTotal 
                            discount 
                            itemId 
                    }
                    paidAmountHeading
                    refundAmountHeading
                    shippingAmountHeading
                    shippingRefundHeading
                    orderGrandTotalHeading
                    paidAmount
                    refundAmount
                    shippingAmount
                    shippingRefund
                    orderGrandTotal
                    creditMemoCommentHeading
                    refundTotalHeading
                    subtotalHeading
                    subTotal
                    discountHeading
                    discount
                    totalTaxHeading
                    totalTax
                    refundShippingHeading
                    adjustmentRefundHeading
                    adjustmentFeeHeading
                    grandTotalHeading
                    grandTotal
                    invoiceId
                    appendCommentsHeading
                    visibleOnFrontendHeading
                    emailCopyHeading
                    refundOnlineButtonHeading
                    refundOfflineButtonHeading
                                    
            }
}
      """;
  }

  /// Seller Credit Memo FormData View
  String createcreditmemo(
      int storeId,
      String customerToken,
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
      String? currencyWithPrice) {
    return """
      query createcreditmemo {
    createcreditmemo(
            storeId:$storeId,
            customerToken:"$customerToken",
            incrementId:"$increementId",
            comment:"$comment",
            productName: "$productName",
            productId:$productId,
            currencyWithPrice:"$currencyWithPrice",
            doOffline:"$doOffline",
            sendEmail:"$sendEmail",
            invoiceId:"$invoiceId",
            shippingAmount:"$shippingAmount",
            isVisibleOnFront:"$isVisibleOnFront",
            adjustmentPositive:"$adjustmentPositive",
            adjustmentNegative:"$adjustmentNegative",
            commentCustomerNotify:"$commentCustomerNotify"
            )
            {
                success
                message
            }
}
      """;
  }

  /// Seller OrderShipment Tracking Info
  String sendTrackingInfo(
      int storeId,
      String customerToken,
      String? increementId,
      String? shipmentId,
      ) {
    return """
      query sendtrackinginfo {
    sendtrackinginfo(
            storeId:$storeId
            customerToken:"$customerToken"
            shipmentId:$shipmentId
            incrementId:"$increementId")
            {
                    success
                    message
            }
}
      """;
  }

  /// Seller Order Create Invoice
  String createInvoice(
      int storeId, String customerToken, String? increementId) {
    return """
      mutation createinvoice {
          createinvoice(
            storeId:$storeId
            customerToken:"$customerToken"
            incrementId:"$increementId")
            {
                    success
                    message
                    invoiceId
                    
            }
      }
    """;
  }

  /// Seller OrderShipment Tracking Info
  String sellerCancelOrder(
      int storeId, String customerToken, String? increementId) {
    return """
      query cancelorder {
cancelorder(storeId:$storeId,
incrementId:"$increementId",customerToken:$customerToken) {
message
success

}
}
      """;
  }

  /// Seller sendcreditmemo
  String sellerSendcreditmemo(int storeId, String customerToken,
      String? increementId, String? creditMemoId) {
    return """
      query sendcreditmemo {
        sendcreditmemo(
                storeId:$storeId
                customerToken:"$customerToken"
                creditmemoId:$creditMemoId
                incrementId:"$increementId")
                {
                        success
                        message
                }
       }
        """;
      }

  /// Seller sendinvoice
  String sellerSendinvoice(int storeId, String customerToken,
      String? increementId, String? invoiceId) {
    return """
      query sendinvoice {
          sendinvoice(
                  storeId:$storeId
                  customerToken:"$customerToken"
                  invoiceId:$invoiceId
                  incrementId:"$increementId")
                  {
                          success
                          message
                  }
          }
          """;
        }

  /// Seller sendorderemail
  String sellerSendorderemail(int storeId, String customerToken,
      String? increementId) {
    return """
          query sendorderemail {
            sendorderemail(
                    storeId:$storeId
                    customerToken:"$customerToken"
                    incrementId:"$increementId")
                    {
                            success
                            message
                    }
            }
            """;
  }

  /// Seller createShipment
  String sellerCreateShipment(int storeId, String customerToken,
      String? increementId, String? carrierData, String? trackingIdData) {
    return """
      mutation createshipment {
    createshipment(
            storeId:$storeId
            customerToken:"$customerToken"
            incrementId:"$increementId"
            carrier:"$carrierData"
            trackingId:"$trackingIdData"
            apiShipment:"")
            {
                    success
                    message
                    shipmentId
                    
            }
}
    """;
  }

  /// Seller Download Shipment
  String sellerDownloadallShipping(int storeId, String customerToken, String? shipmentId, String? increementId) {
    return """
      query downloadallshipping {
        downloadallshipping(
          storeId:$storeId
          customerToken:"$customerToken"
          shipmentId: $shipmentId,
          incrementId: "$increementId",
          dateTo:""
          dateFrom:""
          )
          {
            success
            message
            url
          }
        }
      """;
  }


  /**/

  /// Seller Download Invoice
  String sellerDownloadallInvoice(int storeId, String customerToken,
      String? increementId, String? invoiceId) {
    return """
      query downloadallinvoice {
        downloadallinvoice(
            storeId:$storeId,
            customerToken:"$customerToken",
            invoiceId: $invoiceId,
            incrementId: "$increementId",
            dateTo:""
            dateFrom:""
            )
            {
                success
                message
                url
            }
        }
    """;
  }

  /// Seller createShipment
  String sellerViewCreditMemo(int storeId, String customerToken,
      String? increementId, String? creditMemoId) {
    return """
      query viewcreditmemo {
    viewcreditmemo(eTag:"",
        storeId:$storeId,
        customerToken:"$customerToken",
        creditmemoId:$creditMemoId,
        incrementId:"$increementId")
            {
                success
                message
                customerNameHeading
                customerName
                customerEmailHeading
                customerEmail
                AddressInfoHeading
                billingAddressHeading
                billingAddress
                mainHeading
                subHeading
                creditmemoStatus
                creditmemoDate
                orderInfoHeading
                orderHeading
                orderId
                orderStatusHeading
                orderStatus
                orderDateHeading
                orderDate
                paymentandshippingHeading
                paymentMethodHeading
                paymentMethod
                itemsRefundedHeading
                productNameHeading
                priceHeading
                qtyHeading
                subtotalHeading
                codChargeHeading
                taxAmtHeading
                discountAmtHeading
                rowTotalHeading
                totals {
                    code
                    label
                    value
                    formattedValue
                }
                itemList {
                    productName
                    downloadableOptionLable
                    sku
                    price
                    qty
                    subTotal
                    totalTax
                    discountTotal
                    rowTotal
                }
            }
}
    """;
  }

  String sellerCollection(
      String storeId,
      String customerToken,
      String currency,
      String type,
      String sellerId,
      List<Map<String, String>> filterData,
      Map<String, String>? sortData,
      int pageNumber) {
    return """
      query sellercollection {
          sellercollection(storeId:$storeId, customerToken:"$customerToken", currency:"$currency", sellerId:$sellerId, pageNumber:$pageNumber, 
          sortData:$sortData
          ) {
              success
              message
              totalCount
              productList{
                  reviewCount
                  isInWishlist
                  wishlistItemId
                  typeId
                  entityId
                  rating
                  isAvailable
                  price
                  finalPrice
                  formattedPrice
                  formattedFinalPrice
                  name
                  hasRequiredOptions
                  isNew
                  isInRange
                  thumbNail
                  dominantColor
                  tierPrice
                  formattedTierPrice
                  minAddToCartQty
                  availability
                  arUrl
                  arType
                  arTextureImages
              }
              sortingData{
                  code
                  label
              }
              categoryList{
                  id
                  name
                  count
              }
          }
      }
    """;
  }

  String getSellerProfileFormData(String storeId, String customerToken) {
    return """
      query profileformdata {
          profileformdata(storeId:$storeId, customerToken:"$customerToken") {
                    success
                    message
                    showProfileHint
                    isTwitterActive
                    twitterId
                    twitterHint
                    isFacebookActive
                    facebookId
                    facebookHint
                    isInstagramActive
                    instagramId
                    isgoogleplusActive
                    googleplusId
                    isYoutubeActive
                    youtubeId
                    isVimeoActive
                    vimeoId
                    isPinterestActive
                    pinterestId
                    contactNumber
                    contactNumberHint
                    taxvat
                    taxvatHint
                    backgroundColor
                    backgroundColorHint
                    shopTitle
                    shopTitleHint
                    bannerHint
                    bannerImage
                    profileImageHint
                    profileImage
                    companyLocalityHint
                    companyLocality
                    companyDescriptionHint
                    companyDescription
                    returnPolicyHint
                    returnPolicy
                    shippingPolicyHint
                    shippingPolicy
                    privacyPolicy
                    countryHint
                    country
                    countryList{
                        value
                        label
                        is_region_visible
                    }
                    flagImageUrl
                    metaKeywordHint
                    metaKeyword
                    metaDescriptionHint
                    metaDescription
                    paymentDetailsHint
                    paymentDetails
                    isColorPickerEnabled
                    isSellerPolicyEnabled
              }
           }
    """;
  }

  String saveSellerProfileData(String storeId, String customerToken,
      SellerProfileSaveRequestModel sellerProfileSaveRequestModel) {
    return """
      mutation saveProfile {
            saveProfile(
            storeId:$storeId, 
            customerToken:"$customerToken",             
            taxvat:"${sellerProfileSaveRequestModel.taxvat ?? ""}", 
            gplusId:"${sellerProfileSaveRequestModel.gplusId ?? ""}", 
            country:"${sellerProfileSaveRequestModel.country ?? ""}", 
            vimeoId:"${sellerProfileSaveRequestModel.vimeoId ?? ""}", 
            twActive:${sellerProfileSaveRequestModel.twActive ?? false}, 
            fbActive:${sellerProfileSaveRequestModel.fbActive ?? false}, 
            gplusActive:${sellerProfileSaveRequestModel.gplusActive ?? false}, 
            vimeoActive:${sellerProfileSaveRequestModel.vimeoActive ?? false}, 
            youtubeActive:${sellerProfileSaveRequestModel.youtubeActive ?? false}, 
            instagramActive:${sellerProfileSaveRequestModel.instagramActive ?? false}, 
            pinterestActive:${sellerProfileSaveRequestModel.pinterestActive ?? false}, 
            twitterId:"${sellerProfileSaveRequestModel.twitterId ?? ""}", 
            youtubeId:"${sellerProfileSaveRequestModel.youtubeId ?? ""}", 
            shopTitle:"${sellerProfileSaveRequestModel.shopTitle ?? ""}", 
            facebookId:"${sellerProfileSaveRequestModel.facebookId ?? ""}", 
            instagramId:"${sellerProfileSaveRequestModel.instagramId ?? ""}", 
            pinterestId:"${sellerProfileSaveRequestModel.pinterestId ?? ""}", 
            metaKeyword:${json.encode(sellerProfileSaveRequestModel.metaKeyword ?? "")}, 
            returnPolicy:${jsonEncode(sellerProfileSaveRequestModel.returnPolicy ?? "")},
            contactNumber:"${sellerProfileSaveRequestModel.contactNumber ?? ""}", 
            shippingPolicy:${jsonEncode(sellerProfileSaveRequestModel.shippingPolicy ?? "")}, 
            privacyPolicy:${jsonEncode((sellerProfileSaveRequestModel.privacyPolicy ?? "").trim())}, 
            paymentDetails:${json.encode(sellerProfileSaveRequestModel.paymentDetails ?? "")}, 
            companyLocality:"${sellerProfileSaveRequestModel.companyLocality ?? ""}", 
            backgroundColor:"${sellerProfileSaveRequestModel.backgroundColor ?? ""}", 
            metaDescription:${json.encode(sellerProfileSaveRequestModel.metaDescription ?? "")}, 
            companyDescription:${json.encode(sellerProfileSaveRequestModel.companyDescription ?? "")}, 
            profilePic:"${sellerProfileSaveRequestModel.profileLogo ?? ""}", 
            bannerPic:"${sellerProfileSaveRequestModel.banner ?? ""}", 
            ) 
            {
                    success
                    message                  
              }
           }
    """;
  }

  String getSellerRelatedProductData(
      {String? storeId,
        String? customerToken,
        int? width,
        int? pageNumber,
        String? filterData,
        String? sortData,
        int? productId,
        int? onlySelected}) {
    return """
      query relatedproductdata {
          relatedproductdata(
           storeId:$storeId, 
           customerToken:"$customerToken", 
           width:$width,
           pageNumber: "$pageNumber", 
           productId: $productId,  
           onlySelected:"$onlySelected"  ) 
                                {
                                        message
                                        success
                                        productCollectionData{
                                            selected
                                            entity_id
                                            thumbnail
                                            name
                                            attrinuteSet
                                            status
                                            type
                                            sku
                                            price
                                        }
                                }                        
                              
           }
    """;
  }

  String getSellerUpSellProductData(
      {String? storeId, String? customerToken, String? productId}) {
    return """
      query upsellproductdata {
          upsellproductdata(
           storeId:$storeId, 
           customerToken:"$customerToken") 
                                {
                                        message
                                        success
                                        productCollectionData{
                                            selected
                                            entity_id
                                            thumbnail
                                            name
                                            attrinuteSet
                                            status
                                            type
                                            sku
                                            price
                                        }
                                }                        
                              
           }
    """;
  }

  String getSellerCrossSellProductData(
      {String? storeId, String? customerToken, int? productId}) {
    return """
      query crosssellproductdata {
          crosssellproductdata(
           storeId:$storeId, 
           customerToken:"$customerToken") 
                                {
                                        message
                                        success
                                        productCollectionData{
                                            selected
                                            entity_id
                                            thumbnail
                                            name
                                            attrinuteSet
                                            status
                                            type
                                            sku
                                            price
                                        }
                                }                        
                              
           }
    """;
  }

  String createNewProduct({
    String? storeId,
    String? customerToken,
    String? sku,
    String? urlKey,
    int? qty,
    String? type,
    String? name,
    String? price,
    bool? status,
    int? isFeaturedProduct,
    String? weight,
    String? metaTitle,
    String? thumbnail,
    String? baseImage,
    bool? isInStock,
    String? linksTitle,
    String? visibility,
    int? taxClassId,
    String? smallImage,
    String? description,
    String? swatchImage,
    String? metaKeyword,
    String? samplesTitle,
    bool? isDownloadable,
    int? attributeSetId,
    String? specialFromDate,
    String? specialToDate,
    String? specialPrice,
    String? metaDescription,
    String? shortDescription,
    bool? productHasWeight,
    String? mpProductCartLimit,
    bool? purchasedSeparately,
    List? upsell,
    List? related,
    List? linksData,
    List? crossSell,
    List? websiteIds,
    List? categoryIds,
    List? samplesData,
    List? customAttribute,
    List? customOptionData,
    final List<Map<String, dynamic>>? mediaGallery,
  }) {
    return """
mutation{ 
    saveproduct( 
        customerToken:"$customerToken", 
        sku:"$sku", 
        qty:$qty, 
        type:"$type", 
        name:"$name", 
        price:"$price", 
        status:$status, 
        isFeaturedProduct:$isFeaturedProduct, 
        weight:"$weight", 
        storeId:$storeId, 
        metaTitle:"$metaTitle", 
        thumbnail:"$thumbnail", 
        baseImage:"$baseImage", 
        isInStock:$isInStock, 
        linksTitle:"$linksTitle", 
        visibility:"$visibility", 
        taxClassId:$taxClassId,
        smallImage:"$smallImage",
         description:${jsonEncode(description ?? "")}, 
          swatchImage:"$swatchImage",
           metaKeyword:${jsonEncode(metaKeyword ?? "")},
        mediaGallery: $mediaGallery,
                 samplesTitle:"$samplesTitle", 
                 isDownloadable:$isDownloadable, 
                 attributeSetId:$attributeSetId, 
                 specialFromDate:"$specialFromDate", 
                 specialPrice:"$specialPrice",
                 specialToDate: "$specialToDate",
                 metaDescription:${jsonEncode(metaDescription ?? "")},
                 shortDescription:${jsonEncode(shortDescription ?? "")},
                 productHasWeight:$productHasWeight, 
                 mpProductCartLimit:"$mpProductCartLimit",                 
                 purchasedSeparately:$purchasedSeparately, 
                 upsell:$upsell, 
                 related :$related, 
                 linksData :$linksData, 
                 crossSell :$crossSell,
                  websiteIds :$websiteIds,
                   categoryIds :$categoryIds, 
                   samplesData :$samplesData,
                    customAttribute :$customAttribute,
                     customOptionData :$customOptionData
                      ) 
                      { 
                          success
                           message 
                           productId
                            } 
                            }
    """;
  }

  String saveSellerProduct({
    String? storeId,
    String? customerToken,
    String? productId,
    String? sku,
    String? urlKey,
    int? qty,
    String? type,
    String? name,
    String? price,
    bool? status,
    int? isFeaturedProduct,
    String? weight,
    String? metaTitle,
    String? thumbnail,
    String? baseImage,
    bool? isInStock,
    String? linksTitle,
    String? visibility,
    int? taxClassId,
    String? smallImage,
    String? description,
    String? swatchImage,
    String? metaKeyword,
    String? samplesTitle,
    bool? isDownloadable,
    int? attributeSetId,
    String? specialFromDate,
    String? specialToDate,
    String? specialPrice,
    String? metaDescription,
    String? shortDescription,
    bool? productHasWeight,
    String? mpProductCartLimit,
    bool? purchasedSeparately,
    List? upsell,
    List? related,
    List? linksData,
    List? crossSell,
    List? websiteIds,
    List? categoryIds,
    List? samplesData,
    List? customAttribute,
    List? customOptionData,
    List<Map<String, dynamic>>? mediaGallery,
  }) {
    return """
      mutation{
    saveproduct(
            customerToken:"$customerToken",
            productId: "$productId"
            sku:"$sku",
            urlKey: "$urlKey",
            qty:$qty,
            type:"$type",
            name:"$name",
            price:"$price",
            status:$status,
            isFeaturedProduct:$isFeaturedProduct,
            weight:"$weight",
            storeId:$storeId,
            metaTitle:"$metaTitle",
            thumbnail:"$thumbnail",
            baseImage:"$baseImage",
            isInStock:$isInStock,
            linksTitle:"$linksTitle",
            visibility:"$visibility",
            taxClassId:$taxClassId,
            smallImage:"$smallImage",
            description:${jsonEncode(description ?? "")}, 
            swatchImage:"$swatchImage",
            metaKeyword:${jsonEncode(metaKeyword ?? "")}, 
            samplesTitle:"$samplesTitle",
            isDownloadable:$isDownloadable,
            attributeSetId:$attributeSetId,
            specialFromDate:"$specialFromDate",
            specialPrice:"$specialPrice",
            specialToDate: "$specialToDate",
            metaDescription:${jsonEncode(metaDescription ?? "")}, 
            shortDescription:${jsonEncode(shortDescription ?? "")}, 
            productHasWeight:$productHasWeight,
            mpProductCartLimit:"$mpProductCartLimit",
            purchasedSeparately:$purchasedSeparately,
            upsell:$upsell,
            related :$related,
            linksData :$linksData,
            crossSell :$crossSell,
            websiteIds :$websiteIds,
            categoryIds :$categoryIds,
            samplesData :$samplesData,
            customAttribute :$customAttribute,
            customOptionData :$customOptionData,
            mediaGallery: $mediaGallery,  
        )
        {
                success
                message
                productId
        }
}
    """;
  }

  String getStoreProfile(
      {int? storeId,
        String? customerToken,
        int? sellerId,
        String? currency,
        int? width}) {
    return """
    query{
     sellerprofile(
     storeId:$storeId,
     customerToken:"$customerToken",
     sellerId:$sellerId
     currency:"$currency",
     width:$width)
      {
      success
      message
      bannerImage
      profileImage
      backgroundColor
      shopUrl
      sellerId
      location
      shopTitle
      isTwitterActive
      twitterId
      isFacebookActive
      facebookId
      isInstagramActive
      instagramId
      isgoogleplusActive
      googleplusId
      isYoutubeActive
      youtubeId
      isVimeoActive
      vimeoId
      orderCount
      isPinterestActive
      pinterestId
      is_seller_policies_enabled
      description
      productCount
      returnPolicy
      averageRating
      shippingPolicy
      privacyPolicy
      recentProductList{
      reviewCount
      #configurableData
      isInWishlist
      wishlistItemId
      typeId
      entityId
      rating
      isAvailable
      price
      finalPrice
      formattedPrice
      formattedFinalPrice
      name
      hasRequiredOptions
      isNew
      isInRange
      thumbNail
      dominantColor
      tierPrice
      formattedTierPrice
      minAddToCartQty
      availability
      arUrl
      arType
      #arTextureImages
      }
      feedbackCount
      price5Star
      price4Star
      price3Star
      price2Star
      price1Star
      averagePriceRating
      value5Star
      value4Star
      value3Star
      value2Star
      value1Star
      averageValueRating
      quality5Star
      quality4Star
      quality3Star
      quality2Star
      quality1Star
      averageQualityRating
      reviewList{
      date
      summary
      userName
      feedPrice
      feedValue
      feedQuality
      description
      }
      showReview
      reportData{
      showReportSeller
      guestCanReport
      showReportReason
      sellerReportLabel
      showReportOtherReason
      sellerOtherReportLabel
      sellerFlagReasons {
      entity_id
      reason
      created_at
      updated_at
      status
      }
      }
      }
      }
    """;
  }

  // String uploadProfileImage(
  //     {int? storeId,
  //     String? customerToken,
  //     String? imageName,
  //     String? imageEncoded}) {
  //   return """ProductPageData
  //     query uploadProductImage {
  //           uploadProductImage(storeId:$storeId,
  //           customerToken:"$customerToken",
  //           imageName:"$imageName",
  //           imageEncoded:"$imageEncoded")
  //           {
  //           success
  //           message
  //           url
  //           file
  //            }
  //             }
  //             }
  //   """;
  // }

  String uploadProductImage(
      {int? storeId,
        String? customerToken,
        String? imageName,
        String? imageEncoded}) {
    return """
    mutation{
        uploadProductImage(
        storeId:$storeId,
        customerToken:"$customerToken",
        imageName:"$imageName",
        imageEncoded:"data:image/png;base64,$imageEncoded"
        ){
            success
            message
            url
            file    
            name 
          }
        }
        
    """;
  }

  String uploadProfilePic(
      String customerToken, String image, String width, String mFactor) {
    return """
    mutation{
        uploadSellerProfilePic(
        width:$width,
        mFactor:$mFactor,
        customerToken:"$customerToken",
        imageName:"profile.png",
        imageEncoded:"data:image/png;base64,$image"
        ){
              success
              message
              url
          }
        }
    """;
  }

  String uploadBannerPic(
      String customerToken, String image, String width, String mFactor) {
    return """
    mutation{
        uploadSellerProfilePic(
        width:$width,
        mFactor:$mFactor,
        customerToken:"$customerToken",
        imageName:"homepage.png",
        imageEncoded:"data:image/png;base64,$image"
        ){
              success
              message
              url
          }
        }
    """;
  }

  String deleteSellerImage(
      String customerToken, String storeId, String entityId) {
    return """
    query{
        deletesellerimage(
        storeId:$storeId,
        customerToken:"$customerToken",
        entity:"$entityId"
        ){
              success
              message
          }
        }       
    """;
  }

  String getMarketplaceData(String customerToken, String storeId) {
    return """
    query{
        landingpagedata(
        customerToken: "$customerToken",
        storeId: $storeId,
        width: 1000,
        mFactor: 1)
        {
        success
        message
        isCached
        pageLayout
        layout1 {
        displayBanner
        bannerContent
        buttonHeadingLabel
        bannerImage
        firstLabel
        displayIcon
        iconOne
        labelOne
        iconTwo
        labelTwo
        iconThree
        labelThree
        iconFour
        labelFour
        showSellers
        secondLabel
        sellersData {
        logo
        products {
        reviewCount
        configurableData {
        attributes {
        id
        code
        label
        options {
        id
        label
        products
        }
        swatchType
        updateProductPreviewImage
        }
        template
        optionPrices {
        oldPrice {
        amount
        }
        basePrice {
        amount
        }
        finalPrice {
        amount
        }
        tierPrices {
        amount
        }
        msrpPrice {
        amount
        }
        product
        }
        productId
        chooseText
        images
        index
        swatchData
        }
        isInWishlist
        wishlistItemId
        typeId
        entityId
        rating
        isAvailable
        price
        finalPrice
        formattedPrice
        formattedFinalPrice
        name
        hasRequiredOptions
        isNew
        isInRange
        thumbNail
        dominantColor
        tierPrice
        formattedTierPrice
        minAddToCartQty
        availability
        arUrl
        arType
        arTextureImages
        salesQty
        }
        sellerId
        shopTitle
        productCount
        }
        thirdLabel
        fourthLabel
        aboutContent
        }
        layout2 {
        displayBanner
        bannerContent
        buttonHeadingLabel
        bannerImage
        showSellers
        secondLabel
        sellersData {
        logo
        products {
        reviewCount
        configurableData {
        attributes {
        id
        code
        label
        options {
        id
        label
        products
        }
        swatchType
        updateProductPreviewImage
        }
        template
        optionPrices {
        oldPrice {
        amount
        }
        basePrice {
        amount
        }
        finalPrice {
        amount
        }
        tierPrices {
        amount
        }
        msrpPrice {
        amount
        }
        product
        }
        productId
        chooseText
        images
        index
        swatchData
        }
        isInWishlist
        wishlistItemId
        typeId
        entityId
        rating
        isAvailable
        price
        finalPrice
        formattedPrice
        formattedFinalPrice
        name
        hasRequiredOptions
        isNew
        isInRange
        thumbNail
        dominantColor
        tierPrice
        formattedTierPrice
        minAddToCartQty
        availability
        arUrl
        arType
        arTextureImages
        salesQty
        }
        sellerId
        shopTitle
        productCount
        }
        thirdLabel
        fourthLabel
        aboutContent
        }
        layout3 {
        displayBanner
        bannerContent
        buttonHeadingLabel
        bannerImage
        firstLabel
        displayIcon
        iconOne
        labelOne
        iconTwo
        labelTwo
        iconThree
        labelThree
        iconFour
        labelFour
        iconFive
        labelFive
        showSellers
        secondLabel
        sellersData {
        logo
        products {
        reviewCount
        configurableData {
        attributes {
        id
        code
        label
        options {
        id
        label
        products
        }
        swatchType
        updateProductPreviewImage
        }
        template
        optionPrices {
        oldPrice {
        amount
        }
        basePrice {
        amount
        }
        finalPrice {
        amount
        }
        tierPrices {
        amount
        }
        msrpPrice {
        amount
        }
        product
        }
        productId
        chooseText
        images
        index
        swatchData
        }
        isInWishlist
        wishlistItemId
        typeId
        entityId
        rating
        isAvailable
        price
        finalPrice
        formattedPrice
        formattedFinalPrice
        name
        hasRequiredOptions
        isNew
        isInRange
        thumbNail
        dominantColor
        tierPrice
        formattedTierPrice
        minAddToCartQty
        availability
        arUrl
        arType
        arTextureImages
        salesQty
        }
        sellerId
        shopTitle
        productCount
        }
        thirdLabel
        fourthLabel
        aboutContent
        }
        }

    }
    """;
  }

  String getCustomerList({
    String? storeId,
    String? customerToken,
    int? websiteId,
    String? billingTelephone,
    String? billingFull,
    String? gender,
    String? email,
    String? name,
  }) {
    return """
      query customerlist {
          customerlist(       
        storeId:$storeId
        customerToken:"$customerToken"
        websiteId:$websiteId
        billingTelephone:"$billingTelephone"
        billingFull:"$billingFull"
        gender:"$gender"
        email:"$email"
        name:"$name") {
        success
        message
        customerList {
            customerName
            customerEmail
            customerAddress
            customerTelephone
            customerBaseTotal
            customerOrderCount
            customerGender
        }
    }
    }
    """;
  }

  String downloadTransactionList({
    String? storeId,
    String? customerToken,
    String? dateTo,
    String? dateFrom,
    int? pageNumber,
    String? transactionId,
  }) {
    return """
      query downloadtransactionlist {
          downloadtransactionlist(       
            storeId:$storeId,
            customerToken:"$customerToken",
            dateTo:"$dateTo",
            dateFrom:"$dateFrom",
            pageNumber:$pageNumber,
            transactionId:"$transactionId"
            ) {
                        success
                        message
                        url
            }
    }
    """;
  }

  String sellerMenus(String? storeId, String? customerToken) {
    return """
      query sellerAppMenus {
              sellerAppMenus(
                  storeId: $storeId,
                  customerToken: "$customerToken",
              ){
                  success
                  message
                  menus {
                   label
                   code
                   }
              }
      }
    """;
  }

  String adminNotifying({
    int? storeId,
    String? customerToken,
    int? websiteId,
    String? sellerName,
    String? message,
  }){
    return """
      query notifyadmin {
          notifyadmin(       
            storeId:$storeId,
            customerToken:"$customerToken",
            websiteId:$websiteId,
            sellerName:"$sellerName",
            message:"$message"
            ) {
                        success
                        message
            }
    }
    """;
  }

  String sellerNotifying(
      {int? storeId,
        String? customerToken,
        int? websiteId,
        String? adminName,
        String? message,
        int? sellerId}) {
    return """
      {
      notifyseller(storeId: $storeId,
      sellerId: $sellerId,
      customerToken: "$customerToken",
      websiteId: $websiteId,
      adminName: "$adminName",
      message: "$message")
       {
        success
        message
        }
        }
        """;
  }

  String uploadDownloadableProductFile(
      {int? storeId,
        String? customerToken,
        String? fileName,
        String? fileEncoded,
        String? fileType,
      }) {
    return """
      mutation{
      uploadDownloadableProduct(
        storeId:$storeId,
        customerToken:"$customerToken",
        fileName:"$fileName",
        fileType: "$fileType"
        fileEncoded:"$fileEncoded"
    ) {
        success
        message
        file
        name
        size
    }
   }
        """;
  }

}
