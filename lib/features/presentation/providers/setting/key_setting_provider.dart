import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/di/injector.dart';
import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';
import 'package:biz_card_app/features/domain/use_cases/setting/key_setting_local_use_case.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keySettingProvider = StateNotifierProvider<KeySettingProviderNotifier, KeySettingModel>((ref) {
  return KeySettingProviderNotifier(ref);
});

class KeySettingProviderNotifier extends StateNotifier<KeySettingModel> {
  KeySettingProviderNotifier(this.ref)
      : settingsLocalUseCase = ref.watch(keySettingLocalUseCaseProvider),
        super(KeySettingModel.init());

  final Ref ref;
  final KeySettingLocalUseCase settingsLocalUseCase;

  Future<void> init() async {
    state = await settingsLocalUseCase.init();

    // if (state.uid == null) {
    //   ref.read(authStateProvider.notifier).change(AuthState.unauthenticated);
    // }
  }

  Future<void> update(KeySettingModel newData) async {}

  Future<void> clear() async {}
}
