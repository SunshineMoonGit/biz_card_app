import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/theme/app_theme.dart';
import 'package:biz_card_app/config/ui/theme/resource/palette.dart';
import 'package:flutter/material.dart';

class DarkTheme extends AppTheme {
  DarkTheme() : super(type: ThemeType.dark, brightness: Brightness.dark, color: _initColor(), deco: _initDeco());

  static AppColor _initColor() {
    return AppColor(
      surface: Palette.grey700,
      background: Palette.grey800,
      text: Palette.grey100,
      subtext: Palette.grey500,
      toastContainer: Palette.grey100.withOpacity(0.85),
      onToastContainer: Palette.grey800,
      hint: Palette.grey600,
      hintContainer: Palette.grey770,
      onHintContainer: Palette.grey350,
      inactive: Palette.grey500,
      inactiveContainer: Palette.grey700,
      onInactiveContainer: Palette.grey400,
      primary: Palette.green,
      onPrimary: Palette.white,
      secondary: Palette.red,
      onSecondary: Palette.white,
      tertiary: Palette.yellow,
      onTertiary: Palette.white,
    );
  }

  static AppDeco _initDeco() {
    return AppDeco(
      shadow: [
        BoxShadow(
          color: Palette.black.withOpacity(0.35),
          blurRadius: 35,
        ),
      ],
    );
  }
}
