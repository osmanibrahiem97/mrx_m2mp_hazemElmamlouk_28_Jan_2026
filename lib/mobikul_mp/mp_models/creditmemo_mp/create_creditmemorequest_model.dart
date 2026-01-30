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

import 'create_creditmemo_itemlist_model.dart';

class CreateCreditMemoRequestModel {
  String? name;
  String? comment;
  CreateCreditmemoItemlistModel? itemList;
  String? doOffline;
  String? sendEmail;
  String? invoiceId;
  String? shippingAmount;
  String? isVisibleOnFront;
  String? adjustmentPositive;
  String? adjustmentNegative;
  String? commentCustomerNotify;

  CreateCreditMemoRequestModel(
      this.name,
      this.comment,
      this.itemList,
      this.doOffline,
      this.sendEmail,
      this.invoiceId,
      this.shippingAmount,
      this.isVisibleOnFront,
      this.adjustmentPositive,
      this.adjustmentNegative,
      this.commentCustomerNotify);

}

