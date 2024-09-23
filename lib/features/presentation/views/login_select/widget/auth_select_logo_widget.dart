import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSelectLogoWidget extends ConsumerWidget {
  const AuthSelectLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: BasicText(
        title: AppString.appName,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w900,
          fontSize: 50,
        ),
        color: context.colorScheme.primary,
      ),
    );
  }
}
