import 'package:biz_card_app/features/presentation/views/setting/widget/row_type/basic_setting_row_widget.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_divider_widget.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/basic_setting_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingRowWidget extends ConsumerWidget {
  const SettingRowWidget({
    super.key,
    required this.settings,
  });

  final List<BasicSettingItemModel> settings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.generate(
        settings.length * 2 - 1,
        (index) {
          final int pIndex = index ~/ 2;
          if (index.isEven) {
            // 설정 항목에 따라 적절한 위젯 반환
            final setting = settings[pIndex];
            return BasicSettingRowWidget(setting: setting);
          } else {
            return SettingDividerWidget(icon: settings[pIndex].icon);
          }
        },
      ),
    );
  }
}
