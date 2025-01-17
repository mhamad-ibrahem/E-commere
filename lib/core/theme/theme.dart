import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/colors/app_colors.dart';
import 'light/light_theme_ar_text.dart';
import 'light/light_theme_text.dart';

AppColors appColors = AppColors();
class AppTheme {
 
  ThemeData currentTheme = AppTheme.lightsTheme;
  static ThemeData lightsTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors().white,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColor,
      primary: AppColors.primaryColor,
    ),
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: IconThemeData(color: appColors.white),
      centerTitle: true,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      displaySmall: displaySmallLight(),
      displayMedium: displayMediumLight(),
      displayLarge: displayLargeLight(),
    ),
  );

  static ThemeData lightThemeArLang = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors().white,
    primaryColor: AppColors.primaryColor,
    brightness: Brightness.light,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors.secondaryColor,
      primary: AppColors.primaryColor,
    ),
    appBarTheme:  AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      iconTheme: IconThemeData(color: appColors.white),
      centerTitle: true,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    textTheme: TextTheme(
      displaySmall: displaySmallLightAr(),
      displayMedium: displayMediumLightAr(),
      displayLarge: displayLargeLightAr(),
    ),
  );
}
