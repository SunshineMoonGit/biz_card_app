import 'package:flutter/material.dart';

@immutable
class Dimensions {
  static const double standardCardRatio = 1050 / 650;
  // Widget Size
  static const double ssHomeTopWidgetHeight = 250;

  // Screen Size
  static const double ssScreenSizeLarge = ssScreenSizeMedium * 2;
  static const double ssScreenSizeMedium = ssScreenSizeTiny * 3;
  static const double ssScreenSizeSmall = ssScreenSizeTiny * 2;
  static const double ssScreenSizeTiny = 8;

  // BorderRadius
  static double ssBorderRadiusLarge = 24;
  static double ssBorderRadiusMedium = 16;
  static double ssBorderRadiusSmall = 8;

  // Padding
  static const ssPaddingAll = EdgeInsets.symmetric(horizontal: ssScreenSizeSmall, vertical: ssScreenSizeTiny);

  static const ssPaddingHorizontal = EdgeInsets.symmetric(horizontal: ssScreenSizeSmall);
  static const ssPaddingVertical = EdgeInsets.symmetric(vertical: ssScreenSizeSmall);
  static const ssPaddingVerticalSmall = EdgeInsets.symmetric(vertical: ssScreenSizeTiny);

  // Text font size
  static const double ssTextFontSizeLarge = 24;
  static const double ssTextFontSizeMedium = 20;
  static const double ssTextFontSizeSmall = 16;

  static const ssVerticalSpaceLarge = SizedBox(height: 25);
  static const ssVerticalSpaceMedium = SizedBox(height: 16);
  static const ssVerticalSpaceSmall = SizedBox(height: 10);
  static const ssHorizontalSpaceLarge = SizedBox(width: 25);
  static const ssHorizontalSpaceMedium = SizedBox(width: 16);
  static const ssHorizontalSpaceSmall = SizedBox(width: 10);
}
