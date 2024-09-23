import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeMethod {
  final WidgetRef ref;

  ThemeMethod(this.ref) {
    settings = ref.watch(customSettingProvider);
  }

  late CustomSettingModel settings;

  void changeTheme(ThemeType theme) async {
    ref.read(themeProvider.notifier).change(theme);

    await ref.read(customSettingProvider.notifier).update(settings.copyWith(theme: theme));
  }

  void changeLanguage(String language) async {
    await ref.read(customSettingProvider.notifier).update(settings.copyWith(language: language));
  }
}
