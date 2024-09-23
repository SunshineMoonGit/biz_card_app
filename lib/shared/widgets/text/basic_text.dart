import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class BasicText extends ConsumerWidget {
  final String title;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Color? color;
  final bool logo;

  const BasicText({
    required this.title,
    this.style,
    this.textAlign,
    this.color,
    this.logo = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      Intl.message(title),
      textAlign: textAlign,
      style: style == null
          ? context.textTheme.bodyMedium!.copyWith(
              color: color ?? context.colorScheme.onSurface,
            )
          : style!.copyWith(
              color: color ?? context.colorScheme.onSurface,
            ),
    );
  }
}
