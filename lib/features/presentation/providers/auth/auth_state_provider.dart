import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/di/injector.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/domain/use_cases/auth/auth_local_use_case.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthStateProviderNotifier extends Notifier<AuthState> {
  late final AuthLocalUseCase _authLocalUseCase;

  @override
  AuthState build() {
    _authLocalUseCase = ref.watch(authLocalUseCaseProvider);
    return AuthState.initial;
  }

  Future<void> check() async {
    late final MyUserInfoModel authInfo;

    final Result<MyUserInfoModel> result = await _authLocalUseCase.get();

    result.when(
      success: (value) => authInfo = value,
      failure: (error) {
        state = AuthState.unauthenticated;
        return;
      },
    );

    // uid 정보가 없을 때
    if (authInfo.uid == '') {
      state = AuthState.unauthenticated;
      return;
    }

    // uid 정보가 있을 때
    if (authInfo.uid != '') {
      if (authInfo.name == '') {
        state = AuthState.authenticatedButIncomplete;
      } else {
        state = AuthState.authenticated;
      }
    }
  }

  void change(AuthState authState) {
    state = authState;
  }
}

final authStateProvider = NotifierProvider<AuthStateProviderNotifier, AuthState>(() {
  return AuthStateProviderNotifier();
});
