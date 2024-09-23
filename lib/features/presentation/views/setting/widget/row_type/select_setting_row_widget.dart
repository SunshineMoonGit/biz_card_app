import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/select_setting_item_model.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectSettingRowWidget extends ConsumerWidget {
  const SelectSettingRowWidget({
    super.key,
    required this.setting,
  });

  final SelectSettingItemModel setting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
      onTap: () => setting.onNavigate(context, setting),
      child: Padding(
        padding: Dimensions.ssPaddingVerticalSmall,
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
                child: Row(
                  children: [
                    BasicText(
                      title: setting.value ?? '-',
                      style: ref.textTheme.labelLarge!,
                      color: context.colorScheme.onSurface,
                    ),
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
      ),
    );
  }
}
