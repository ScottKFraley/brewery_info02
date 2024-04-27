// plain class instead of the Provider model / class.
// not sure which I'll end up using yet.

import 'package:flutter/material.dart';

import '../misc/colors.dart';

class BreweryAppTheme {
  // private constructor - apparently makes this all like 'static'
  BreweryAppTheme._();

  //
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: AppLtColors.detailScrTopQtrPanelBgColor,
      primaryColor: Colors.amber.shade300,
      // Theme.of(context).outlinedButtonTheme.*
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppLtColors.mainBottomBtnFgColor,
          backgroundColor: AppLtColors.mainBottomBtnBgColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          side:
              BorderSide(color: AppLtColors.showOnMapBtnBorderColor, width: 3),
        ),
      ),
      // Theme.of(context).elevatedButtonTheme.*
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppLtColors.detailScrnCallBtnBgColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      )),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
            fontSize: 16,
            color: AppLtColors.mainFgColor,
            backgroundColor: AppLtColors.mainBgColor),
        displayMedium: TextStyle(
            fontSize: 20,
            color: AppLtColors.mainFgColor,
            backgroundColor: AppLtColors.mainBgColor),
        displayLarge: TextStyle(
            fontSize: 24,
            color: AppLtColors.mainFgColor,
            backgroundColor: AppLtColors.mainBgColor),
        labelSmall: TextStyle(
            fontSize: 16,
            color: AppLtColors.mainFgColor,
            backgroundColor: AppLtColors.mainBgColor),
        labelMedium: TextStyle(
            fontSize: 20,
            color: AppLtColors.mainFgColor,
            backgroundColor: AppLtColors.mainBgColor),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppLtColors.mainFgColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        minVerticalPadding: 10,
        textColor: AppLtColors.mainFgColor,
        selectedTileColor: AppLtColors.mainBgColor,
      ),
      /* Going to comment this out for now as I've already specified a bunch 
         of color values above. -SKF 3/23/24
      colorScheme: const ColorScheme(
          primary: AppLtColors.mainFgColor,
          onPrimary: AppLtColors.mainBgColor,
          background: Colors.white,
          brightness: Brightness.light), */
      bottomAppBarTheme:
          const BottomAppBarTheme(color: AppLtColors.mainBottomBtnBgColor));

  //
  //
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      canvasColor: AppDkColors.detailScrTopQtrPanelBgColor,
      primaryColor: Colors.amber.shade300,
      // Theme.of(context).outlinedButtonTheme[.*]
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppDkColors.showOnMapBtnFgColor,
          backgroundColor: AppDkColors.showOnMapBtnBgColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
          side:
              BorderSide(color: AppDkColors.showOnMapBtnBorderColor, width: 3),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: Colors.blue.shade900,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      )),
      textTheme: const TextTheme(
        displaySmall: TextStyle(
            fontSize: 16,
            color: AppDkColors.mainFgColor,
            backgroundColor: AppDkColors.mainBgColor),
        displayMedium: TextStyle(
            fontSize: 20,
            color: AppDkColors.mainFgColor,
            backgroundColor: AppDkColors.mainBgColor),
        displayLarge: TextStyle(
            fontSize: 22,
            color: AppDkColors.mainFgColor,
            backgroundColor: AppDkColors.mainBgColor),
        labelSmall: TextStyle(
            fontSize: 16,
            color: AppDkColors.mainFgColor,
            backgroundColor: AppDkColors.mainBgColor),
        labelMedium: TextStyle(
            fontSize: 20,
            color: AppDkColors.mainFgColor,
            backgroundColor: AppDkColors.mainBgColor),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppDkColors.mainFgColor, width: 1),
            borderRadius: BorderRadius.circular(10)),
        minVerticalPadding: 10,
        textColor: AppDkColors.mainFgColor,
        selectedTileColor: AppDkColors.mainBgColor,
      ),
      /* Going to comment this out for now as I've already specified a bunch 
         of color values above. -SKF 3/23/24
      colorScheme: const ColorScheme(
          background: Colors.black, brightness: Brightness.dark), */
      bottomAppBarTheme:
          BottomAppBarTheme(color: AppDkColors.mainBottomBtnBgColor));
}
