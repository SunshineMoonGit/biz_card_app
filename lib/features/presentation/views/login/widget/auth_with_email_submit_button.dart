import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/button/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWithEmailSubmitButton extends ConsumerWidget {
  const AuthWithEmailSubmitButton({
    super.key,
    required this.manager,
    required this.formKey,
  });

  final ControllerManager manager;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomButton(
      title: manager.type == ControllerType.signIn ? '로그인' : '회원가입',
      onTap: () async {
        if (formKey.currentState!.validate()) {
          await AppMethod(ref).auth.signWithEmail(manager);
        }
      },
    );
  }
}
