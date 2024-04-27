import 'package:flutter/material.dart';

// Lt = Light Theme
class AppLtColors {
  static const Color mainFgColor = Colors.black;
  static const Color mainBgColor = Colors.white;

  static const Color mainBottomBtnFgColor = Colors.black;
  static const Color mainBottomBtnBgColor = Colors.white;

  static const Color detailScrnCallBtnBgColor =
      Color.fromARGB(255, 72, 33, 243);
  static Color detailScrTopQtrPanelBgColor = Colors.black;

  static Color showOnMapBtnFgColor = Colors.black;
  // may not need this as the background is more global
  static Color showOnMapBtnBgColor = Colors.white;
  static Color showOnMapBtnBorderColor = Colors.amber;

  static Color themePrimarySwatch = Colors.amber.shade300;
}

// Dt = Dark Theme
class AppDkColors {
  static const Color mainFgColor = Colors.white;
  static const Color mainBgColor = Colors.black;

  static Color mainBottomBtnFgColor = Colors.yellow.shade600;
  static Color mainBottomBtnBgColor = Colors.black;

  static Color detailScrnCallBtnBgColor = Colors.white;
  static Color detailScrTopQtrPanelBgColor = Colors.grey.shade400;

  static Color showOnMapBtnFgColor = Colors.amber;
  // may not need this as the background is more global
  static Color showOnMapBtnBgColor = Colors.black;
  static Color showOnMapBtnBorderColor = Colors.amber;

  static Color themePrimarySwatch = Colors.amber.shade300;
}
