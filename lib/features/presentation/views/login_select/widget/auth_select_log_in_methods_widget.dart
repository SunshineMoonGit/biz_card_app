import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/views/login/sign_in_with_email_screen.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthSelectLogInMethodsWidget extends ConsumerWidget {
  const AuthSelectLogInMethodsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget buildLogInMethodButton(String title, Color backgroundColor, Color textColor, VoidCallback onTap,
        {bool hasColor = false}) {
      return BasicButton(
        icon: AppSvg.getSvgPlatform(title),
        title: title,
        backgroundColor: backgroundColor,
        onTap: onTap,
        textColor: textColor,
        border: Border.all(color: context.colorScheme.shadow),
        hasColor: hasColor,
      );
    }

    return Padding(
      padding: Dimensions.ssPaddingHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          buildLogInMethodButton(
              AppSvg.email,
              Colors.grey,
              Colors.white,
              () => context.go(SignInWithEmailScreen.route,
                  // () => context.push('${AuthSelectScreen.route}/${SignInWithEmailScreen.route}',
                  extra: ControllerType.signIn)),
          Dimensions.ssVerticalSpaceSmall,
          buildLogInMethodButton(
              AppSvg.kakao, Colors.yellow, Colors.black, () => AppMethod(ref).auth.signInWithGoogle()),
          Dimensions.ssVerticalSpaceSmall,
          buildLogInMethodButton(
              AppSvg.google, Colors.white, Colors.black, () => AppMethod(ref).auth.signInWithGoogle(),
              hasColor: true),
          Dimensions.ssVerticalSpaceLarge,
        ],
      ),
    );
  }
}
