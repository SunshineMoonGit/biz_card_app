import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton({
    super.key,
    this.icon,
    required this.title,
    required this.backgroundColor,
    this.textColor,
    required this.onTap,
    this.border,
    this.hasColor = false,
  });

  final String? icon;
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onTap;
  final Border? border;
  final bool hasColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            Dimensions.ssBorderRadiusSmall,
          ),
          border: border,
        ),
        height: 54,
        child: Row(
          children: [
            if (icon != null) _renderPrefixIcon(icon!, hasColor),
            _renderTitle(),
            if (icon != null) _renderPadding(icon!),
          ],
        ),
      ),
    );
  }

  Container _renderPadding(String icon) {
    return Container(
      padding: Dimensions.ssPaddingHorizontal,
      child: const SizedBox(width: 24),
    );
  }

  Expanded _renderTitle() {
    return Expanded(
      child: Center(
        child: BasicText(
          title: '$title',
          style: const TextStyle(),
          color: textColor,
        ),
      ),
    );
  }

  Container _renderPrefixIcon(String icon, bool hasColor) {
    return Container(
      padding: Dimensions.ssPaddingHorizontal,
      child: BasicAssetSvg(
        hasColor: hasColor,
        item: icon,
        size: 24,
      ),
    );
  }
}
