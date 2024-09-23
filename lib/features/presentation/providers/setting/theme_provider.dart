import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/theme/app_theme.dart';
import 'package:biz_card_app/config/ui/theme/dark_theme.dart';
import 'package:biz_card_app/config/ui/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = NotifierProvider<ThemeProviderNotifier, AppTheme>(() => ThemeProviderNotifier());

class ThemeProviderNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    state = change(ThemeType.light);
    return state;
  }

  AppTheme change(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        state = LightTheme();
        return state;
      case ThemeType.dark:
        state = DarkTheme();
        return state;
    }
  }
}

// WidgetRef를 사용하는 확장 메서드
extension ThemeRefExtension on WidgetRef {
  AppTheme get theme => watch(themeProvider);
  AppColor get color => theme.color;
  ThemeData get themeData => theme.themeData;
  ColorScheme get colorScheme => theme.themeData.colorScheme;
  TextTheme get textTheme => theme.themeData.textTheme;
  AppDeco get deco => theme.deco;
}
