import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:flutter/material.dart';

class CustomSliverGap extends StatelessWidget {
  const CustomSliverGap({
    super.key,
    this.size = SizeType.medium,
  });

  final SizeType size;

  @override
  Widget build(BuildContext context) {
    late final SizedBox gap;

    switch (size) {
      case SizeType.small:
        gap = Dimensions.ssVerticalSpaceSmall;
      case SizeType.medium:
        gap = Dimensions.ssVerticalSpaceMedium;
      case SizeType.large:
        gap = Dimensions.ssVerticalSpaceLarge;
    }

    return SliverToBoxAdapter(
      child: gap,
    );
  }
}
