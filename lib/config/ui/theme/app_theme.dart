// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:flutter/material.dart';

part 'component/app_bar_theme.dart';
part 'component/color_scheme.dart';
part 'component/input_decoration_theme.dart';
part 'component/text_theme.dart';
part 'foundation/app_color.dart';
part 'foundation/app_deco.dart';

abstract class AppTheme {
  final ThemeType type;
  late final ThemeData themeData;
  final Brightness brightness;
  final AppColor color;
  final AppDeco deco;

  AppTheme({
    required this.type,
    required this.brightness,
    required this.color,
    required this.deco,
  }) {
    themeData = ThemeData().copyWith(
      brightness: brightness,
      primaryColor: color.primary,
      scaffoldBackgroundColor: color.background,
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
      iconTheme: IconThemeData(color: color.text),
      colorScheme: _colorScheme,
      inputDecorationTheme: _inputDecorationTheme,
    );
  }
}

extension ThemeRefExtension on AppTheme {
  ThemeData get converter => ThemeData.light().copyWith(
        brightness: brightness,
        primaryColor: color.primary,
        scaffoldBackgroundColor: color.background,
        textTheme: _textTheme,
        appBarTheme: _appBarTheme,
        iconTheme: IconThemeData(color: color.text),
        colorScheme: _colorScheme,

        // 추가 테마 속성...
      );
}
