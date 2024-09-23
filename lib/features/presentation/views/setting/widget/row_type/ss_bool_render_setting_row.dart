import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/setting_item/setting_item_model.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoolTypeSettingRowWidget extends ConsumerWidget {
  const BoolTypeSettingRowWidget({
    super.key,
    required this.setting,
  });

  final SettingItemModel setting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => setting.onTap(setting),
      child: SizedBox(
        // padding: Dimensions.ssPaddingVertical / 2,
        height: 16 + 30,
        child: Row(
          children: [
            if (setting.icon != null)
              Padding(
                padding: Dimensions.ssPaddingHorizontal,
                child: BasicAssetSvg(item: setting.icon!),
              ),
            Expanded(
              child: Padding(
                padding: (setting.icon != null) ? EdgeInsets.zero : Dimensions.ssPaddingHorizontal,
                child: BasicText(
                  title: setting.title,
                  style: ref.textTheme.bodySmall!,
                  color: context.colorScheme.onBackground,
                ),
              ),
            ),
            Padding(
              padding: Dimensions.ssPaddingHorizontal,
              child: Switch(
                value: setting.value,
                onChanged: (value) => setting.onTap(setting),

                activeTrackColor: context.colorScheme.primary,
                activeColor: context.colorScheme.onPrimaryContainer,
                // materialTapTargetSize: MaterialTapTargetSize.values[1], // Reduces the tap target size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
