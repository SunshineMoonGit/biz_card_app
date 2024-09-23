import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasicAssetSvg extends StatelessWidget {
  const BasicAssetSvg({
    super.key,
    required this.item,
    this.size,
    this.color,
    this.hasColor = false,
  });

  final String item;
  final double? size;
  final Color? color;

  final bool hasColor;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      item,
      width: size ?? 24,
      height: size ?? 24,
      colorFilter: hasColor
          ? const ColorFilter.mode(Colors.transparent, BlendMode.srcATop)
          : ColorFilter.mode(context.colorScheme.onBackground, BlendMode.srcIn),
    );
  }
}
