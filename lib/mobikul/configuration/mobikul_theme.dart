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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_new/mobikul/constants/app_constants.dart';
import 'package:test_new/mobikul/helper/extension.dart';
import '../helper/app_storage_pref.dart';

class MobikulTheme {
  static const Color primaryColor = Color(0xFF5aa39c);
  static const Color accentColor = Color(0xFFe47356);
// static const Color primaryColor = Colors.green;
// static const Color accentColor = Color(0xFFECE607);

  static const Color diffColor = Color(0xFF339EF1);
}

class AppTheme {
  AppTheme._();

  //Applied on Scaffold
  static final Color _lightScaffoldColor = Colors.grey.shade200;
  static const Color _darkScaffoldColor = Colors.black26;

  //Applied on Scaffold where TextFormFields are used
  static const Color _lightCustomScaffoldBgColor = Colors.white;
  static const Color _darkCustomScaffoldBgColor = Colors.black;

  //Applied on AppBar
  static  Color lightAppBarColor = Colors.white;
  static  Color darkAppBarColor = Colors.black;

  //Applied on Icons
  static const Color _lightIconColor = Colors.black;
  static const Color _darkIconColor = Colors.white;

  //Applied on Card/Container
  static const Color _lightCardColor = Colors.white;
  static const Color _darkCardColor = Colors.black54;

  //Applied on Divider
  static const Color _lightDividerColor = Colors.black26;
  static const Color _darkDividerColor = Colors.white70;

  //Applied on Button
  static  Color lightBtnColor = MobikulTheme.accentColor;
  static  Color darkBtnColor = Colors.green;

  //Applied on CustomOutlineButton ( Used on "All Orders Screen" )
  static const Color _lightCustomOutlineBtnColor = MobikulTheme.accentColor;
  static const Color _darkCustomOutlineBtnColor = Colors.green;

  //Applied on OutlinedTextButton's Text
  static  Color lightOutlinedCenterTextColor = MobikulTheme.accentColor;
  static  Color darkOutlinedCenterTextColor = Colors.white;

  static const Color _lightPrimaryColor = MobikulTheme.accentColor;
  static const Color _darkPrimaryColor = Color(0XFF51938c); //Colors.green;


  static const Color _lightSecondaryColor = Colors.green;
  static const Color _darkSecondaryColor = Colors.black;
  // static const Color _darkSecondaryColor = Colors.white;

  static const Color _lightOnPrimaryColor = Colors.black;
  static const Color _darkOnPrimaryColor = Colors.green;

  //  Button Text Color
  static const Color lightButtonTextColor = Colors.white;
  static const Color darkButtonTextColor = Colors.white;

  // Icon Color
  static  Color lightAppTextColor = Colors.white;
  static  Color darkAppTextColor = Colors.green;



  /// light theme ///
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightScaffoldColor,
    appBarTheme:  AppBarTheme(
      titleTextStyle: const TextStyle(
          color: _darkSecondaryColor,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold,
          fontSize: AppSizes.textSizeXLarge),
      color: lightAppBarColor,
      iconTheme: const IconThemeData(color: _lightIconColor),
    ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor: lightAppBarColor,
        selectedIconTheme: const IconThemeData(color: _lightIconColor),
        selectedLabelStyle: const TextStyle(color: _lightIconColor)),
    colorScheme:  ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryContainer: _lightPrimaryColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
      outline: lightOutlinedCenterTextColor,
      //Applied on Scaffold white
      background: _lightCustomScaffoldBgColor,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    dividerTheme: const DividerThemeData(color: _lightDividerColor),
    cardColor: _lightCardColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5.0,
        backgroundColor: lightBtnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(lightBtnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(color: MobikulTheme.accentColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          backgroundColor: Colors.transparent),
    ),
    buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.light(
            background: _lightCustomOutlineBtnColor
        )
    ),
    // buttonColor: _lightCustomOutlineBtnColor,
    // Override the button color for the date picker dialog
    dialogTheme: const DialogThemeData(
      contentTextStyle: TextStyle(
        decorationColor: Colors.blue,
      ),
    ),
  );

  /// dark theme ///
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkScaffoldColor,
    appBarTheme:  AppBarTheme(
      color: darkAppBarColor,
      iconTheme: const IconThemeData(color: _darkIconColor),
    ),
    colorScheme:  ColorScheme.dark(
      primary: _darkPrimaryColor,
      primaryContainer: _darkPrimaryColor,
      // primaryVariant: _darkPrimaryColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
      outline: darkOutlinedCenterTextColor,

      //Applied on Scaffold white
      background: _darkCustomScaffoldBgColor,
    ),
    iconTheme: const IconThemeData(color: _darkIconColor),
    textTheme: _darkTextTheme,
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor: darkAppBarColor,
        selectedIconTheme: const IconThemeData(color: _darkIconColor),
        selectedLabelStyle: const TextStyle(color: _darkIconColor)),
    dividerTheme: const DividerThemeData(color: _darkDividerColor),
    cardColor: _darkCardColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 5.0,
        backgroundColor: darkBtnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        textStyle: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(darkBtnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(
            color: Colors.white,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          backgroundColor: Colors.black45),
    ),
    buttonTheme: const ButtonThemeData(
        colorScheme: ColorScheme.dark(
            background: _darkCustomOutlineBtnColor
        )
    ),
    // buttonColor: _darkCustomOutlineBtnColor,
    dialogTheme: const DialogThemeData(
      contentTextStyle: TextStyle(
        decorationColor: Colors.blue,
      ),
    ),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge:_lightScreenHeading1TextStyle,
      displayMedium:_lightScreenHeading2TextStyle,
      displaySmall:_lightScreenHeading3TextStyle,
    headlineLarge: _lightScreenHeading4TextStyle,
    headlineMedium: _lightScreenHeading5TextStyle,
    headlineSmall:_lightScreenHeading6TextStyle,
    titleLarge:_lightScreenSubTile1TextStyle,
    titleMedium: _lightScreenSubTile2TextStyle,
    bodyLarge:_lightScreenTaskNameTextStyle,
    bodyMedium:_lightScreenTaskDurationTextStyle,
    bodySmall:_lightScreenCaptionTextStyle,
    labelLarge:_lightScreenButtonTextStyle
      ///bodyText2
      // headline1: _lightScreenHeading1TextStyle,
      // headline2: _lightScreenHeading2TextStyle,
      // headline3: _lightScreenHeading3TextStyle,
      // headline4: _lightScreenHeading4TextStyle,
      // headline5: _lightScreenHeading5TextStyle,
      // headline6: _lightScreenHeading6TextStyle,
      // subtitle1: _lightScreenSubTile1TextStyle,
      // subtitle2: _lightScreenSubTile2TextStyle,
      // bodyText1: _lightScreenTaskNameTextStyle,
      // bodyText2: _lightScreenTaskDurationTextStyle,
      // button: _lightScreenButtonTextStyle,
      // caption: _lightScreenCaptionTextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
      displayLarge:_darkScreenHeading1TextStyle,
      displayMedium:_darkScreenHeading2TextStyle,
      displaySmall:_darkScreenHeading3TextStyle,
      headlineLarge: _darkScreenHeading4TextStyle,
      headlineMedium: _darkScreenHeading5TextStyle,
      headlineSmall:_darkScreenHeading6TextStyle,
      titleLarge:_darkScreenSubTile1TextStyle,
      titleMedium: _darkScreenSubTile2TextStyle,
      bodyLarge:_darkScreenTaskNameTextStyle,
      bodyMedium:_darkScreenTaskDurationTextStyle,
      bodySmall:_darkScreenCaptionTextStyle,
      labelLarge:_darkScreenButtonTextStyle
      ///
      // headline1: _darkScreenHeading1TextStyle,
      // headline2: _darkScreenHeading2TextStyle,
      // headline3: _darkScreenHeading3TextStyle,
      // headline4: _darkScreenHeading4TextStyle,
      // headline5: _darkScreenHeading5TextStyle,
      // headline6: _darkScreenHeading6TextStyle,
      // subtitle1: _darkScreenSubTile1TextStyle,
      // subtitle2: _darkScreenSubTile2TextStyle,
      // bodyText1: _darkScreenTaskNameTextStyle,
      // bodyText2: _darkScreenTaskDurationTextStyle,
      // button: _darkScreenButtonTextStyle,
      // caption: _darkScreenCaptionTextStyle

  );

  /// light theme text style ///
  static const TextStyle _lightScreenHeading1TextStyle = TextStyle(
      fontSize: AppSizes.textSizeXLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenHeading2TextStyle = TextStyle(
      fontSize: AppSizes.textSizeLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenHeading3TextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenHeading4TextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorSecondary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenHeading5TextStyle = TextStyle(
      fontSize: AppSizes.textSizeSmall,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenHeading6TextStyle = TextStyle(
      fontSize: AppSizes.textSizeSmall,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorSecondary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenTaskNameTextStyle = TextStyle(
      fontSize: AppSizes.textSizeSmall,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenTaskDurationTextStyle = TextStyle(
      fontSize: AppSizes.textSizeSmall,
      color: AppColors.textColorSecondary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenSubTile1TextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenSubTile2TextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      color: AppColors.textColorSecondary,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenButtonTextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      fontWeight: FontWeight.bold,
      color: lightButtonTextColor,
      //MobikulTheme.accentColor,
      fontFamily: "Roboto");

  static const TextStyle _lightScreenCaptionTextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      fontWeight: FontWeight.bold,
      color: AppColors.textColorPrimary,
      fontFamily: "Roboto");

  /// dark theme text style ///
  static final TextStyle _darkScreenHeading1TextStyle =
  _lightScreenHeading1TextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);

  static final TextStyle _darkScreenHeading2TextStyle =
  _lightScreenHeading2TextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);

  static final TextStyle _darkScreenHeading3TextStyle =
  _lightScreenHeading3TextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);

  static final TextStyle _darkScreenHeading4TextStyle =
  _lightScreenHeading4TextStyle.copyWith(
      color: AppColorsDark.textColorSecondary);

  static final TextStyle _darkScreenHeading5TextStyle =
  _lightScreenHeading5TextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);

  static final TextStyle _darkScreenHeading6TextStyle =
  _lightScreenHeading6TextStyle.copyWith(
      color: AppColorsDark.textColorSecondary);

  static final TextStyle _darkScreenTaskNameTextStyle =
  _lightScreenTaskNameTextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);

  static final TextStyle _darkScreenTaskDurationTextStyle =
  _lightScreenTaskDurationTextStyle.copyWith(
      color: AppColorsDark.textColorSecondary);

  static final TextStyle _darkScreenSubTile1TextStyle =
  _lightScreenSubTile1TextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);

  static final TextStyle _darkScreenSubTile2TextStyle =
  _lightScreenSubTile2TextStyle.copyWith(
      color: AppColorsDark.textColorSecondary);

  static const TextStyle _darkScreenButtonTextStyle = TextStyle(
      fontSize: AppSizes.textSizeMedium,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: "Roboto");

  static final TextStyle _darkScreenCaptionTextStyle =
  _lightScreenHeading3TextStyle.copyWith(
      color: AppColorsDark.textColorPrimary);
}

//Manage the theme by toggle from profile
class CheckTheme extends ChangeNotifier {
  late String _isDark;
  late AppStoragePref _appStoragePref;
  String get isDark => _isDark;

  CheckTheme() {
    _isDark = "false";
    _appStoragePref = AppStoragePref();
    getPreferences();
  }
//Switching the themes
  set isDark(String value) {
    _isDark = value;
    _appStoragePref.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _appStoragePref.getTheme();
    notifyListeners();
    print(_isDark);
    if (_isDark == "") {
      print("Fetching Device Theme Data");
      if (window.platformBrightness == Brightness.dark) {
        _isDark = "true";
        _appStoragePref.setTheme("true");
      } else {
        _isDark = "false";
        _appStoragePref.setTheme("false");
      }
    } else {
      _isDark = await _appStoragePref.getTheme();
      notifyListeners();
      print(_isDark);
    }
  }
}
