import 'package:biz_card_app/features/presentation/views/login_select/widget/auth_select_log_in_methods_widget.dart';
import 'package:biz_card_app/features/presentation/views/login_select/widget/auth_select_logo_widget.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSelectScreen extends ConsumerWidget {
  static String get route => '/auth_select';

  const AuthSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BasicLayout(
      body: Stack(
        children: [
          AuthSelectLogoWidget(),
          AuthSelectLogInMethodsWidget(),
        ],
      ),
    );
  }
}
