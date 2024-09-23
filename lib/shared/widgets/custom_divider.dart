import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDivider extends ConsumerWidget {
  const CustomDivider({
    super.key,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding ?? Dimensions.ssPaddingAll,
      child: Divider(
        height: 1,
        color: context.colorScheme.shadow,
      ),
    );
  }

  static Widget sliver() {
    return const SliverToBoxAdapter(
      child: CustomDivider(),
    );
  }

  static Widget modal() {
    return const CustomDivider(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.ssScreenSizeSmall),
    );
  }
}
