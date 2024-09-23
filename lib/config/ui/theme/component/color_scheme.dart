part of '../app_theme.dart';

extension ColorSchemeExtension on AppTheme {
  ColorScheme get _colorScheme => ColorScheme(
        brightness: brightness,
        primary: color.primary,
        onPrimary: color.onPrimary,
        secondary: color.secondary,
        onSecondary: color.onSecondary,
        background: color.background,
        onBackground: color.text,
        surface: color.surface,
        onSurface: color.text,
        error: color.secondary,
        onError: color.onSecondary,
        tertiary: color.tertiary,
        onTertiary: color.onTertiary,
        shadow: color.hint,
        outline: color.toastContainer,
        
      ).copyWith(background: color.background);
}
