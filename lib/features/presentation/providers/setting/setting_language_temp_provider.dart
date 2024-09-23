import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingLanguageTempProvider = StateNotifierProvider<SettingLanguageTempProviderNotifier, String>((ref) {
  return SettingLanguageTempProviderNotifier(ref);
});

class SettingLanguageTempProviderNotifier extends StateNotifier<String> {
  final Ref ref;
  SettingLanguageTempProviderNotifier(this.ref) : super('') {
    init();
  }

  void init() {
    state = ref.read(customSettingProvider).language!;
  }

  void change(String locale) {
    state = locale;
  }

  bool check(String language) {
    if (state == language) {
      return true;
    } else {
      return false;
    }
  }
}
