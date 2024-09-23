import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/di/injector.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/domain/use_cases/auth/auth_local_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/auth/auth_network_use_case.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_state_provider.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:biz_card_app/shared/provider/notification_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthInfoProviderNotifier extends Notifier<MyUserInfoModel> {
  late final AuthLocalUseCase _authLocalUseCase;
  late final AuthNetworkUseCase _authNetworkUseCase;

  @override
  MyUserInfoModel build() {
    _authLocalUseCase = ref.watch(authLocalUseCaseProvider);
    _authNetworkUseCase = ref.watch(authNetworkUseCaseProvider);
    return MyUserInfoModel.empty();
  }

  // 맨 처음 실행 되는 함수
  Future<void> init() async {
    final Result<MyUserInfoModel> result = await _authLocalUseCase.get();

    result.when(
      success: (value) => state = value,
      failure: (error) => ref.read(notificationProvider.notifier).update(error),
    );
  }

  // Email 회원가입
  Future<void> signUpWithEmail(String email, String pw) async {
    final Result<MyUserInfoModel> result = await _authNetworkUseCase.signUpWithEmail(email, pw);

    result.when(
      success: (value) async => await _updateLocal(value),
      failure: (error) => ref.read(notificationProvider.notifier).update(error),
    );
  }

  // Email 로그인
  Future<void> signInWithEmail(String email, String pw) async {
    final Result<MyUserInfoModel> result = await _authNetworkUseCase.signInWithEmail(email, pw);

    result.when(
      success: (value) async => await _updateLocal(value),
      failure: (error) => ref.read(notificationProvider.notifier).update(error),
    );
  }

  Future<void> update(MyUserInfoModel newData) async {
    //! firebase에 저장
    final Result networkResult = await _authNetworkUseCase.update(newData);

    networkResult.when(
      success: (value) async => await _updateLocal(newData),
      failure: (error) => ref.read(notificationProvider.notifier).update(error),
    );
  }

  Future<void> _getData(String uid) async {
    final Result<MyUserInfoModel> result = await _authNetworkUseCase.get(uid);

    result.when(
      success: (value) {
        state = value;
        ref.read(authStateProvider.notifier).change(AuthState.authenticated);
      },
      failure: (message) {
        ref.read(notificationProvider.notifier).update(message);
        // state = state.copyWith(uid: uid);
        ref.read(authStateProvider.notifier).change(AuthState.authenticatedButIncomplete);
      },
    );
  }

  Future<void> signInWithGoogle() async {
    final Result<MyUserInfoModel> result = await _authNetworkUseCase.signInWithGoogle();

    result.when(
      success: (value) => state = value,
      failure: (error) => ref.read(notificationProvider.notifier).update(error),
    );
  }

  // SignOut
  Future<void> signOut() async {
    await _authLocalUseCase.signOut();
    state = MyUserInfoModel.empty();
  }

  // update local
  Future<void> _updateLocal(MyUserInfoModel updateData) async {
    await _authLocalUseCase.update(updateData);
    state = updateData;
  }
}

final authInfoProvider = NotifierProvider<AuthInfoProviderNotifier, MyUserInfoModel>(() {
  return AuthInfoProviderNotifier();
});
