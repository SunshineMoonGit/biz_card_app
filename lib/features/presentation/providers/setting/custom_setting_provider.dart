import 'package:biz_card_app/di/injector.dart';
import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/features/domain/use_cases/setting/custom_setting_local_use_case.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customSettingProvider = StateNotifierProvider<CustomSettingProviderNotifier, CustomSettingModel>((ref) {
  return CustomSettingProviderNotifier(
    ref.read(customSettingLocalUseCaseProvider),
    ref.read(themeProvider.notifier),
  );
});

class CustomSettingProviderNotifier extends StateNotifier<CustomSettingModel> {
  CustomSettingProviderNotifier(this.settingsLocalUseCase, this.themeProvider) : super(CustomSettingModel.init('ko'));

  final CustomSettingLocalUseCase settingsLocalUseCase;
  final ThemeProviderNotifier themeProvider;

  Future<void> init(String language) async {
    state = await settingsLocalUseCase.init(language);

    // 앱 테마 적용
    themeProvider.change(state.theme);
  }

  Future<void> update(CustomSettingModel newData) async {
    await settingsLocalUseCase.update(newData);

    state = newData;
  }

  Future<void> clear() async {
    final CustomSettingModel newData = CustomSettingModel.init('ko');
    await update(newData);

    state = newData;
  }
}
