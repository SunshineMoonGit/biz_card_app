import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:flutter/material.dart';

class CustomSliverContainerWithBorder extends StatelessWidget {
  const CustomSliverContainerWithBorder({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: context.colorScheme.shadow,
            ),
            borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
          ),
          child: child,
        ),
      ),
    );
  }
}
