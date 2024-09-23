import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAvatar extends ConsumerWidget {
  const CustomAvatar({
    super.key,
    this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.ssScreenSizeTiny),
        child: BasicAssetSvg(
          item: AppSvg.getSvgName(AppSvg.profile0),
          size: 50,
        ),
      ),
    );
  }
}
