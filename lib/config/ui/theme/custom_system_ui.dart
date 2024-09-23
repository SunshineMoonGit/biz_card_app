import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSystemUI {
  static SystemUiOverlayStyle getSystemUIOverlayStyle(Color statusBarColor) {
    final bool criterion = (statusBarColor.computeLuminance() >= 0.5);
    // IOS
    if (Platform.isIOS) {
      return SystemUiOverlayStyle(
        statusBarBrightness: criterion ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      );
    } else

    // Android
    {
      return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: criterion ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: statusBarColor,
        systemNavigationBarIconBrightness: criterion ? Brightness.dark : Brightness.light,
      );
    }
  }
}
