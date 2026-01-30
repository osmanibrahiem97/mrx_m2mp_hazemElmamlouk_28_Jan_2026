
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

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:test_new/mobikul/helper/app_localizations.dart';
// import 'package:test_new/mobikul/helper/constants_helper.dart';
import 'package:test_new/mobikul/helper/extension.dart';
import 'package:html/parser.dart';

// import '../constants/app_constants.dart';
import '../constants/app_constants.dart';
import 'LocalDb/floor/database.dart';
import 'constants_helper.dart';

class Utils{

  static String getStringValue(BuildContext context, String key) {
    return AppLocalizations.of(context)?.translate(key) ?? key;
  }

  static void hideSoftKeyBoard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  static Color orderStatusBackground(String status, String statusColor) {
    switch (status.toLowerCase()) {
      case ConstantsHelper.orderStatusDownload:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusDownloadedColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusComplete:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusCompleteColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusPending:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusPendingColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusProcessing:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusProcessingColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusHold:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusHoldColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusCancel:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusCancelColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusNew:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusNewColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      case ConstantsHelper.orderStatusClosed:
        if (statusColor.isEmpty) {
          return AppColors.orderStatusClosedColor;
        } else {
          return HexColor.fromHex(statusColor);
        }
      default:
        return AppColors.yellow;
    }
  }

  static ratingBackground(String ratingValue) {
    if(ratingValue.isNotEmpty) {
      if (double.parse(ratingValue) < 2) {
        return AppColors.singleStarColor;
      } else if (double.parse(ratingValue) < 3) {
        return AppColors.twoStarColor;
      } else if (double.parse(ratingValue) < 4) {
        return AppColors.threeStarColor;
      } else if (double.parse(ratingValue) < 5) {
        return AppColors.fourStarColor;
      }  else if (double.parse(ratingValue) == 5) {
        return AppColors.fiveStarColor;
      } else {
        return AppColors.singleStarColor;
      }
    } else {
      AppColors.singleStarColor;
    }
  }

  static getColor(String color) {
    if (color != null) {
      String removeHex = color.replaceFirst("#", '').toString();
      String newColor = "0xFF$removeHex";
      int colorValue = int.parse(newColor);
      return colorValue;
    } else {
      return 0xFFF5F5DC;
    }
  }

  static Future<bool> connectedToNetwork() async{
    // print('RESULT----->${result}');

    // var result = await Connectivity().checkConnectivity();
    // print('RESULT----->$result');
    // if(result == ConnectivityResult.mobile) {
    //   print("Internet connection is from Mobile data");
    //   return true;
    // }else if(result == ConnectivityResult.wifi) {
    //   print("internet connection is from wifi");
    //   return true;
    // }else if(result == ConnectivityResult.ethernet){
    //   print("internet connection is from wired cable");
    //   return true;
    // }else if(result == ConnectivityResult.bluetooth){
    //   print("internet connection is from bluethooth threatening");
    //   return true;
    // }else {
    //   print("No internet connection");
    //   return false;
    // }
    List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    print('RESULT----->$result');
    if(result.contains(ConnectivityResult.mobile)){
      print("Internet connection is from Mobile data");
      return true;
    } else if(result.contains(ConnectivityResult.wifi)){
      print("Internet connection is from wifi");
      return true;
    } else if(result.contains(ConnectivityResult.ethernet)){
      print("Internet connection is from wired cable");
      return true;
    } else if(result.contains(ConnectivityResult.bluetooth)){
      print("Internet connection is from bluetooth threatening");
      return true;
    } else {
      print("No internet connection");
      return false;
    }
  }

  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body?.text??"").documentElement?.text??"";

    return parsedString;
  }

  static void clearRecentProducts() {
    AppDatabase.getDatabase().then(
            (value) => value.recentProductDao
            .deleteRecentProducts());
  }

  static String? replaceWhitespacesUsingRegex(String s, String replace) {
    final pattern = RegExp('\\s+');
    return s.replaceAll(pattern, replace);
  }

  static String? loadWebViewData(String content) {
    final htmlContent = "<!DOCTYPE html>" +
        "<html lang=\"en\">" +
        "<head>" +
        "<style>" +
        "img{" +
        "    height: auto;" +
        "    max-width: 100%;" +
        "}" +
        "</style>" +
        "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">" +
        "<meta charset=\"utf-8\">" +
        "<link rel=\"stylesheet\" type=\"text/css\" href=\"" + ApiConstant.webUrl + "/pub/media/styles.css\" media=\"all\">" +
        "<link rel=\"stylesheet\" type=\"text/css\" media=\"all\" href=\"" + ApiConstant.webUrl + "/pub/static/version1552020129/_cache/merged/9e5d309101b494f03ad662f3809381e2.min.css\">" +
        "<link rel=\"stylesheet\" type=\"text/css\" media=\"screen and (min-width: 768px)\" href=\"" + ApiConstant.webUrl + "/pub/static/version1552020129/frontend/Magento/luma/en_US/css/styles-l.min.css\">" +
        "<script type=\"text/javascript\" src=\"" + ApiConstant.webUrl + "/pub/static/version1552020129/_cache/merged/46c637c347e4d4a95871eb42fdf6692b.min.js\"></script>" +
        "</head>" +
        "<body data-container=\"body\" class=\"cms-privacy-policy-cookie-restriction-mode cms-page-view\">" +
        "<div class=\"page-wrapper\">" +
        "<main id=\"maincontent\" class=\"page-main\">" +
        "<div class=\"columns\">" +
        "<div class=\"column main\">" +
        content +
        "</div>" +
        "</div>" +
        "</main>" +
        "</div>" +
        "</body>" +
        "</html>";


    return htmlContent;
  }
}