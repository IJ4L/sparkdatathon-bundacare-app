import 'package:flutter/material.dart';

const String _kFontFamily = 'Poppins';

class AppTypography {
  AppTypography._();

  static TextStyle thin = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w300,
  );
  static TextStyle light = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bold = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w800,
  );
  static TextStyle extraBold = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w900,
  );
  static TextStyle black = const TextStyle(
    fontFamily: _kFontFamily,
    fontWeight: FontWeight.w900,
  );
}

class AppTypographySize {
  AppTypographySize._();

  static const double body1 = 24;
  static const double body2 = 18;
  static const double body3 = 16;
  static const double body4 = 14;
  static const double caption = 12;
  static const double caption2 = 10;
}
