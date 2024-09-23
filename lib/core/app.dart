import 'dart:io';

import 'package:biz_card_app/config/router/basic_router.dart';
import 'package:biz_card_app/config/ui/theme/app_theme.dart';
import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppTheme currentTheme = ref.watch(themeProvider);
    final String? language = ref.watch(customSettingProvider).language;

    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate, // Add this line!
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ko'),
      ],
      locale: language == null ? Locale(Platform.localeName.substring(0, 2)) : Locale(language),
      debugShowCheckedModeBanner: false,
      title: 'card app',
      theme: currentTheme.themeData,
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
