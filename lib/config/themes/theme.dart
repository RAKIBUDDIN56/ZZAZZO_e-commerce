import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
      backgroundColor: ConstandColor.background,
      primaryColor: ConstandColor.background,
      cardTheme: const CardTheme(color: ConstandColor.background),
      textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
      iconTheme: const IconThemeData(color: ConstandColor.iconColor),
      bottomAppBarColor: ConstandColor.background,
      dividerColor: ConstandColor.lightGrey,
      primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: ConstandColor.titleTextColor)));

  static TextStyle titleStyle =
      const TextStyle(color: ConstandColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: ConstandColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    const BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
