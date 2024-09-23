part of '../app_theme.dart';

extension AppBarThemeExtension on AppTheme {
  AppBarTheme get _appBarTheme => AppBarTheme(
        // toolbarHeight: 54,
        backgroundColor: Colors.transparent,
        titleTextStyle: _textTheme.headlineLarge!.copyWith(
          color: _colorScheme.onBackground,
        ),
        shadowColor: Colors.transparent,
        titleSpacing: 1,
        actionsIconTheme: IconThemeData(color: _colorScheme.onBackground),
        iconTheme: IconThemeData(
          color: _colorScheme.onBackground,
        ),
      );
}
