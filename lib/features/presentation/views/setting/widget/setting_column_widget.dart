import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingColumnWidget extends ConsumerWidget {
  final String? title;
  final Widget child;

  const SettingColumnWidget({
    super.key,
    this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: Dimensions.ssPaddingVerticalSmall,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
                color: context.colorScheme.surface,
                border: Border.all(color: context.colorScheme.outline),
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
