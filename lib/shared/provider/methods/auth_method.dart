import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_state_provider.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthMethod {
  final WidgetRef ref;

  AuthMethod(this.ref);

  Future<void> signWithEmail(ControllerManager manager) async {
    final String email = manager.email;
    final String password = manager.password;

    if (manager.type == ControllerType.signIn) {
      await ref.read(authInfoProvider.notifier).signInWithEmail(email, password);
    } else {
      await ref.read(authInfoProvider.notifier).signUpWithEmail(email, password);
    }

    await ref.read(authStateProvider.notifier).check();
  }

  Future<void> signInWithGoogle() async {
    await ref.read(authInfoProvider.notifier).signInWithGoogle();

    await ref.read(authStateProvider.notifier).check();
  }

  Future<void> signOut() async {
    // authInfo 지우기
    await ref.read(authInfoProvider.notifier).signOut();

    await ref.read(authStateProvider.notifier).check();
  }

  Future<void> update(ControllerManager manager) async {
    final MyUserInfoModel oldData = ref.read(authInfoProvider);

    final MyUserInfoModel updateData = oldData.copyWith(
      name: manager.name,
      email: manager.email,
      team: manager.team,
      company: manager.company,
      phone: manager.phone,
      fax: manager.fax,
    );

    await ref.read(authInfoProvider.notifier).update(updateData);

    await ref.read(authStateProvider.notifier).check();
  }
}
