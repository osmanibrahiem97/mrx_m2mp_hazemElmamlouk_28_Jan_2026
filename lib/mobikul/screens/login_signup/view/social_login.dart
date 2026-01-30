// /*
//  *
//  *  Webkul Software.
//  * @package Mobikul Application Code.
//  *  @Category Mobikul
//  *  @author Webkul <support@webkul.com>
//  *  @Copyright (c) Webkul Software Private Limited (https://webkul.com)
//  *  @license https://store.webkul.com/license.html
//  *  @link https://store.webkul.com/license.html
//  *
//  * /
//  */
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:test_new/mobikul/screens/login_signup/view/social_signin.dart';
//
// import '../../../constants/app_constants.dart';
// import '../../../models/login_signup/social_login_model.dart';
// import '../../login_signup/bloc/signin_signup_screen_bloc.dart';
//
// class SocialLogin extends StatelessWidget {
//   final SigninSignupScreenBloc? bloc;
//
//   SocialLogin(this.bloc, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(AppSizes.size16),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//
//           ///Google Login
//           GestureDetector(
//               onTap: () async {
//                 var result = await socialSignIn.handleGoogleSignIn(context);
//                 print("TEST_LOG==> result ==> ${result}");
//                 if(result!=null){
//                   bloc?.emit(LoadingState());
//                   var socialLoginModel=SocialLoginModel.empty();
//                   socialLoginModel.id=result?.id??"";
//                   socialLoginModel.email=result?.email??"";
//                   socialLoginModel.firstName=result?.displayName?.split(" ")[0]??"";
//                   socialLoginModel.lastName= result?.displayName?.contains(" ") == true ? result?.displayName?.substring((result?.displayName?.split(" ")[0].length ?? 0) +1?? 0,result?.displayName?.length) ?? "" : result?.displayName ?? "";
//                   socialLoginModel.photoUrl="";
//                   socialLoginModel.token="";
//                   socialLoginModel.serverAuthCode="";
//                   socialLoginModel.authProvider="";
//                   socialLoginModel.isSocial=1;
//
//                   bloc?.add(SocialLoginEvent(socialLoginModel));
//                 }
//
//               },
//               child: SizedBox(
//                 height: AppSizes.socialLoginIconSize,
//                 width: AppSizes.socialLoginIconSize,
//                 child: Image.asset(AppImages.googleIcon),
//               )),
//
//           const SizedBox(width: AppSizes.spacingGeneric),
//           ///Apple login
//
//           if (Platform.isIOS)
//           GestureDetector(
//               onTap: () async {
//                 const platform = MethodChannel(AppConstant.channelName);
//                 var result = await platform.invokeMethod("appleSignin");
//                 print("appleSignin===> " + result.toString());
//                 if (result != null) {
//                   bloc?.add(const LoadingEvent());
//                   var request = SocialLoginModel(
//                       firstName: result["firstname"],
//                       lastName: result["lastname"] ?? result["firstname"],
//                       email: result["email"],
//                       id: result['id'],
//                       photoUrl: '',
//                       serverAuthCode: result['id'],
//                       authProvider: "GMAIL");
//
//                   bloc?.add(SocialLoginEvent(request));
//                   bloc?.emit(LoadingState());
//                 }
//               },
//               child: SizedBox(
//                   child: SizedBox(
//                     height: 34,
//                     width: 34,
//                     child: Image.asset((Theme.of(context).brightness == Brightness.light)? AppImages.appleIcon : AppImages.appleIconDark),
//                   )
//               )
//           ),
//
//           if (Platform.isIOS)
//           const SizedBox(width: AppSizes.spacingGeneric),
//
//
//           ///Facebook Login
//           GestureDetector(
//               onTap: () async {
//                 var result = await socialSignIn.handleFacebookSignIn(context);
//                 var profile = await socialSignIn.facebookLogin.getUserProfile();
//                 if (result?.status == FacebookLoginStatus.success) {
//
//                   var email = await socialSignIn.facebookLogin.getUserEmail();
//                   // var profileUrl = await socialSignIn.facebookLogin.getProfileImageUrl(width: 100);
//
//                   var socialLoginModel=SocialLoginModel.empty();
//                   socialLoginModel.id=result?.accessToken?.token??"";
//                   socialLoginModel.email=email;
//                   socialLoginModel.firstName=profile?.firstName??"";
//                   socialLoginModel.lastName=profile?.lastName??(profile?.firstName??"");
//                   // socialLoginModel.photoUrl=profileUrl??"";
//                   // socialLoginModel.token="";
//                   // socialLoginModel.serverAuthCode="";
//                   // socialLoginModel.authProvider="";
//
//                   bloc?.add(SocialLoginEvent(socialLoginModel));
//                 }
//                 socialSignIn.signout();
//               },
//               child: SizedBox(
//                 height: AppSizes.socialLoginIconSize,
//                 width: AppSizes.socialLoginIconSize,
//                 child: Image.asset(AppImages.facebookIcon),
//               )),
//         ],
//       ),
//     );
//   }
// }
