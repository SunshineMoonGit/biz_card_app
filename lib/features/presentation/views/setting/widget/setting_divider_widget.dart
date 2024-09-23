import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingDividerWidget extends ConsumerWidget {
  const SettingDividerWidget({
    super.key,
    required this.icon,
  });

  final String? icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        if (icon != null)
          const Padding(
            padding: Dimensions.ssPaddingHorizontal,
            child: SizedBox(width: kDefaultFontSize),
          ),
        Expanded(
          child: Divider(
            color: context.colorScheme.outline,
            height: 0,
          ),
        ),
      ],
    );
  }
}
