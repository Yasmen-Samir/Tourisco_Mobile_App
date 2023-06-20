// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toursim/core/utils/color_manager.dart';
import 'package:toursim/core/utils/font_manager.dart';
import 'package:toursim/core/utils/strings_manager.dart';
import 'package:toursim/core/utils/style_manager.dart';


ThemeData lightTheme = ThemeData(
  ///primarySwatch: ColorsManager.primary,
  primaryColor: ColorsManager.primary,
  primarySwatch: ColorsManager.primarySwatch,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsManager.primary,
      statusBarBrightness:  Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: ColorsManager.primary,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    selectedItemColor: ColorsManager.primary,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge:getSemiBoldStyle(color: ColorsManager.black,fontSize:FontSize.s20, ),
    titleMedium:getSemiBoldStyle(color: ColorsManager.black,fontSize:FontSize.s16 ),
    titleSmall:getRegularStyle(color: ColorsManager.white,fontSize:FontSize.s16 ),
    headlineLarge: getSemiBoldStyle(color: ColorsManager.darkGray,fontSize: FontSize.s16),
    headlineSmall:getRegularStyle(color: ColorsManager.lightYellow,fontSize:FontSize.s20 ),
    bodySmall: getRegularStyle(color: ColorsManager.gray,fontSize: FontSize.s12),
    bodyMedium: getRegularStyle(color: ColorsManager.darkGray,fontSize: FontSize.s17),
    displayLarge: getLightStyle(color: ColorsManager.darkGray,fontSize: FontSize.s16),
    labelLarge: getSemiBoldStyle(color: ColorsManager.gray,fontSize: FontSize.s16),
    labelMedium: getSemiBoldStyle(color: ColorsManager.gray,fontSize: FontSize.s14),
    labelSmall: getBoldStyle(color: ColorsManager.primary,fontSize: FontSize.s12),

  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.white.withOpacity(.5),
    shadowColor: ColorsManager.primary,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white,
    style: ListTileStyle.drawer,
    textColor: Colors.white,
    selectedColor: ColorsManager.primary,
    selectedTileColor: ColorsManager.primary,
    tileColor:ColorsManager.primary.withOpacity(.5),


  ),
  iconTheme: IconThemeData(
    color: Colors.black,
  ),
  colorScheme: ThemeData().colorScheme.copyWith(
    primary: ColorsManager.primary,
    secondary: ColorsManager.primary,

  ),

);

ThemeData darkTheme = ThemeData(
  primarySwatch: ColorsManager.primarySwatch,
  primaryColor: ColorsManager.primary,
  scaffoldBackgroundColor: ColorsManager.dark,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: ColorsManager.dark,
      statusBarBrightness:Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.black12,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 20.0,
    selectedItemColor: ColorsManager.primary,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    titleLarge:getSemiBoldStyle(color: ColorsManager.white,fontSize:FontSize.s20, ),
    titleMedium:getSemiBoldStyle(color: ColorsManager.white,fontSize:FontSize.s16 ),
    titleSmall:getRegularStyle(color: ColorsManager.white,fontSize:FontSize.s16 ),
    headlineLarge: getSemiBoldStyle(color: ColorsManager.darkGray,fontSize: FontSize.s16),
    headlineSmall:getRegularStyle(color: ColorsManager.lightYellow,fontSize:FontSize.s20 ),
    bodySmall: getRegularStyle(color: ColorsManager.gray,fontSize: FontSize.s12),
    bodyMedium: getRegularStyle(color: ColorsManager.white,fontSize: FontSize.s17),
    displayLarge: getLightStyle(color: ColorsManager.white,fontSize: FontSize.s16),
    labelLarge: getSemiBoldStyle(color: ColorsManager.white,fontSize: FontSize.s16),
    labelMedium: getSemiBoldStyle(color: ColorsManager.white,fontSize: FontSize.s14),
    labelSmall: getBoldStyle(color: ColorsManager.primary,fontSize: FontSize.s12),

  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.black12.withOpacity(0.5),
    shadowColor: ColorsManager.primary,
  ),
  listTileTheme: ListTileThemeData(
    iconColor: Colors.white,
    style: ListTileStyle.drawer,
    textColor: Colors.white,
    selectedColor: ColorsManager.primary,
    selectedTileColor: ColorsManager.primary,
    tileColor: ColorsManager.primary.withOpacity(.5),

  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  secondaryHeaderColor:Colors.white,
  colorScheme: ThemeData().colorScheme.copyWith(
    primary: ColorsManager.primary,
    secondary: Colors.white,

  ),



);

