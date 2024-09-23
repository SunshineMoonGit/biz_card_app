// part of '../ads.dart';

part of '../app_theme.dart';

extension TextThemeExtension on AppTheme {
  TextTheme get _textTheme => TextTheme(
        ///DISPLAY
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: _colorScheme.onPrimary,
        ),

        //HEADLINE
        headlineLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),

        //TITLE
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),

        //BODY
        bodyLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: _colorScheme.onPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: _colorScheme.onPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: _colorScheme.onPrimary,
        ),

        //LABEL
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: _colorScheme.onPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: _colorScheme.onPrimary,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: _colorScheme.onPrimary,
        ),
      );
}
