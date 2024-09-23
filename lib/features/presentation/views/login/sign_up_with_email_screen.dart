import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_app_bar.dart';
import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_submit_button.dart';
import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_text_filed.dart';
import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_to_route.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpWithEmailScreen extends ConsumerStatefulWidget {
  static String get route => '/auth_select/sign_up_with_email';

  const SignUpWithEmailScreen({super.key});

  @override
  ConsumerState<SignUpWithEmailScreen> createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState extends ConsumerState<SignUpWithEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ControllerManager manager;

  @override
  void initState() {
    super.initState();
    manager = ControllerManager(type: ControllerType.signUp);
  }

  @override
  void dispose() {
    manager.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          slivers: [
            // 앱바
            const AuthWithEmailAppBar(title: AppString.signUp),

            // 입력란
            AuthWithEmailTextField(controllers: manager.controllers),

            // 추가 이동 (회원가입/로그인)
            const AuthWithEmailToRoute(cType: ControllerType.signUp),
          ],
        ),
      ),
      // 제출
      bottomNavigationBar: AuthWithEmailSubmitButton(manager: manager, formKey: _formKey),
    );
  }
}
