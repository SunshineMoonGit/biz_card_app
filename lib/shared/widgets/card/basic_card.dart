import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicCard extends ConsumerWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool circleShape;

  const BasicCard({
    required this.child,
    this.circleShape = false,
    this.padding,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: Dimensions.standardCardRatio,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circleShape ? 200 : Dimensions.ssBorderRadiusSmall),
          color: color,
          boxShadow: ref.deco.shadow,
        ),
        child: child,
      ),
    );
  }
}
