import 'package:biz_card_app/config/app/app_setting.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_divider_widget.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_screen_layout.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/select_setting_item_model.dart';
import 'package:biz_card_app/shared/extensions/build_context_extensions.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/sliver/custom_sliver_container_with_border.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingSelectScreen extends ConsumerWidget {
  static String get route => '/setting_select';

  const SettingSelectScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SelectSettingItemModel? setting = AppSetting(ref).select(title);

    if (setting == null) {
      context.pop();
    }

    return SettingScreenLayout(
      appBarTitle: setting!.title,
      bottomButtonToggle: false,
      children: [
        CustomSliverContainerWithBorder(
          child: Column(
            children: List.generate(
              setting.options.length * 2 - 1,
              (index) {
                final int pIndex = index ~/ 2;
                final SettingOption option = setting.options[pIndex];

                if (index.isEven) {
                  return GestureDetector(
                    onTap: () => option.onTap(),
                    child: Padding(
                      padding: Dimensions.ssPaddingVerticalSmall,
                      child: SizedBox(
                        height: Dimensions.ssScreenSizeLarge,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: Dimensions.ssPaddingHorizontal,
                                child: BasicText(
                                  title: option.title,
                                  style: context.textTheme.bodySmall!,
                                  color: context.colorScheme.onBackground,
                                ),
                              ),
                            ),
                            Padding(
                              padding: Dimensions.ssPaddingHorizontal,
                              child: Row(
                                children: [
                                  if (option.value)
                                    BasicAssetSvg(
                                      item: AppSvg.getSvgName(AppSvg.check),
                                      size: 12,
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return const SettingDividerWidget(icon: null);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
