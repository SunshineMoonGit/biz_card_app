import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.of(this).size;
}
