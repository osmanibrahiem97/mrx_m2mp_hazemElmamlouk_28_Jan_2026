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

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../app_widgets/app_alert_message.dart';


class SocialSignin {
  // final _googleSignin = GoogleSignIn(
  //   scopes: [
  //     'email',
  //   ],
  // );

  final _googleSignin = GoogleSignIn();
  final facebookLogin = FacebookLogin();
  Authprovider provider = Authprovider.none;

  Future<GoogleSignInAccount?> handleGoogleSignIn(BuildContext context) async {
    try {
      var data = await _googleSignin.signIn();
      provider = Authprovider.gmail;
      print("TEST_LOG==> displayName ==> ${data?.displayName}");
      print("TEST_LOG==> displayName ==> ${data?.serverAuthCode}");
      return data;
    } on PlatformException catch(error) {
      // print(error.code)
      print("TEST_LOG==> error.code ==> ${error.code}");
      print("TEST_LOG==> error ==> ${error}");
    }
  }

  Future<FacebookLoginResult?> handleFacebookSignIn(BuildContext context) async {
    try {
      var result = await facebookLogin.logIn(permissions: [
        FacebookPermission.email,
      ]);
      print(result.status);
      print(await facebookLogin.accessToken);
      if ((await facebookLogin.isLoggedIn)) {
        print(await facebookLogin.getUserEmail());
      }
      provider = Authprovider.facebook;
      return result;
    } catch (error, stk) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AlertMessage.showWarning(error.toString(), context);
      });
      print(stk);
      return null;
    }
  }

  void signout() async {
    switch (provider) {
      case Authprovider.facebook:
        facebookLogin.logOut();
        break;
      case Authprovider.gmail:
        _googleSignin.signOut();
        break;
      default:
        break;
    }
  }
}

enum Authprovider { facebook, gmail, none }

final socialSignIn = SocialSignin();
