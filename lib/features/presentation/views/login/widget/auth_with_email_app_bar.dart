import 'package:biz_card_app/features/presentation/views/login_select/auth_select_screen.dart';
import 'package:biz_card_app/shared/class/actions_model.dart';
import 'package:biz_card_app/shared/widgets/sliver/custom_string_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthWithEmailAppBar extends StatelessWidget {
  const AuthWithEmailAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomStringSliverAppBar(
      leading: ActionsModel(
        icon: const Icon(Icons.arrow_back_ios),
        onTap: () {
          // 두 경우 전부 select 화면으로 강제로 보내고
          context.go(AuthSelectScreen.route);
        },
      ),
      title: title,
    );
  }
}
