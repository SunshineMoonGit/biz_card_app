part of '../app_theme.dart';

extension InputDecorationThemeExtension on AppTheme {
  InputDecorationTheme get _inputDecorationTheme => InputDecorationTheme(
        enabledBorder: temp,
        focusedBorder: temp,
        
      );
}

OutlineInputBorder temp = OutlineInputBorder(
  borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusSmall),
  borderSide: BorderSide.none,
);
