import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/string_setting_item_model.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StringTypeSettingRowWidget extends ConsumerWidget {
  const StringTypeSettingRowWidget({
    super.key,
    required this.setting,
  });

  final StringSettingItemModel setting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: setting.onSave,
      child: SizedBox(
        height: Dimensions.ssScreenSizeLarge,
        child: Row(
          children: [
            if (setting.icon != null)
              Padding(
                padding: Dimensions.ssPaddingHorizontal,
                child: BasicAssetSvg(item: setting.icon!),
              ),
            Expanded(
              child: Padding(
                padding: setting.icon != null ? EdgeInsets.zero : Dimensions.ssPaddingHorizontal,
                child: BasicText(
                  title: setting.title,
                  style: ref.textTheme.bodySmall!,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
            Padding(
              padding: Dimensions.ssPaddingHorizontal,
              child: Row(
                children: [
                  // Uncomment if detail is needed
                  // if (stringSetting.detail != null)
                  //   BasicText(
                  //     title: '${stringSetting.detail}',
                  //     style: ref.textTheme.labelLarge!,
                  //     color: context.colorScheme.onSurface,
                  //   ),
                  Dimensions.ssHorizontalSpaceSmall,
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.colorScheme.onSurface,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
