//app bar, font,

import 'package:flutter/material.dart';
import 'package:onesiam_app/themes/colors.dart';

//ตั้งชื่อ obj เอาไปใส่ที่ file main อีกทีนุง
ThemeData appTheme() {
  return ThemeData(
      fontFamily: 'xxx',
      primaryColor: primary,
      errorColor: accent,
      hoverColor: divider,
      colorScheme: ColorScheme.light(primary: primary),
      iconTheme: IconThemeData(color: icon),
      scaffoldBackgroundColor: icon,
      appBarTheme: AppBarTheme(
          backgroundColor: primary,
          foregroundColor: icon,
          iconTheme: IconThemeData(color: icon)));
}
