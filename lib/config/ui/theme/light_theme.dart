import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/theme/app_theme.dart';
import 'package:biz_card_app/config/ui/theme/resource/palette.dart';
import 'package:flutter/material.dart';

class LightTheme extends AppTheme {
  LightTheme() : super(type: ThemeType.light, brightness: Brightness.light, color: _initColor(), deco: _initDeco());

  static AppColor _initColor() {
    return AppColor(
      surface: Palette.white,
      background: Palette.grey100,
      text: Palette.black,
      subtext: Palette.grey700,
      toastContainer: Palette.grey300,
      onToastContainer: Palette.grey100,
      hint: Palette.grey400,
      hintContainer: Palette.grey150,
      onHintContainer: Palette.grey500,
      inactive: Palette.grey400,
      inactiveContainer: Palette.grey250,
      onInactiveContainer: Palette.white,
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
          color: Palette.black.withOpacity(0.1),
          blurRadius: 35.0,
          offset: const Offset(0, 10),
          // offset = const Offset(0, 10),
        ),
        // BoxShadow(
        //   color: Palette.black.withOpacity(0.1),
        //   blurRadius: 35,
        // ),
      ],
    );
  }
}
