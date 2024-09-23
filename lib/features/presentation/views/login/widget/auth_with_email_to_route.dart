import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/features/presentation/views/login/sign_in_with_email_screen.dart';
import 'package:biz_card_app/features/presentation/views/login/sign_up_with_email_screen.dart';
import 'package:biz_card_app/shared/extensions/build_context_extensions.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthWithEmailToRoute extends ConsumerWidget {
  const AuthWithEmailToRoute({
    super.key,
    required this.cType,
  });

  final ControllerType cType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final String text;
    late final void Function() onTap;

    if (cType == ControllerType.signUp) {
      text = '로그인하러 가기';
      onTap = () {
        context.go(SignInWithEmailScreen.route, extra: ControllerType.signIn);
      };
    } else {
      text = '회원가입하러 가기';
      onTap = () {
        context.go(SignUpWithEmailScreen.route, extra: ControllerType.signUp);
      };
    }

    return SliverToBoxAdapter(
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: Dimensions.ssPaddingHorizontal,
            child: BasicText(
              title: text,
              style: context.textTheme.titleMedium,
              color: ref.color.subtext,
            ),
          ),
        ),
      ),
    );
  }
}
