import 'dart:io';

import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_state_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
import 'package:biz_card_app/features/presentation/providers/wallet/wallet_provider.dart';
import 'package:biz_card_app/shared/provider/methods/auth_method.dart';
import 'package:biz_card_app/shared/provider/methods/theme_method.dart';
import 'package:biz_card_app/shared/provider/methods/wallet_method.dart';
import 'package:biz_card_app/shared/services/ss_print.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppMethod {
  final WidgetRef ref;

  AppMethod(this.ref);

  late final WalletMethod wallet = WalletMethod(ref);
  late final ThemeMethod theme = ThemeMethod(ref);
  late final AuthMethod auth = AuthMethod(ref);

  Future<void> init() async {
    try {
      ref.read(authStateProvider.notifier).change(AuthState.loading);

      final String deviceLocale = Platform.localeName.substring(0, 2);

      // 앱 세팅 불러오기 + 적용
      await ref.read(customSettingProvider.notifier).init(deviceLocale);

      // 유저 정보 확인
      await ref.read(authInfoProvider.notifier).init();

      // 그다음 팔로잉 불러오기
      await ref.read(walletProvider.notifier).init();

      // 유저 상태 체크
      await ref.read(authStateProvider.notifier).check();
    } catch (e) {
      // 에러 처리
      ssPrint('init error: $e', 'app_method');
      rethrow; // 에러를 다시 던져서 상위에서 처리할 수 있게 함
    }
  }
}

enum SaveType {
  local,
  network,
}
