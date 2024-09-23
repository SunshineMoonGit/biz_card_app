import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomLogoText extends ConsumerWidget {
  const CustomLogoText({
    super.key,
    this.fontSize = 50,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicText(
      title: AppString.appName,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
      ),
      color: context.colorScheme.primary,
    );
  }
}
