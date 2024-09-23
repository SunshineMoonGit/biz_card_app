import 'package:biz_card_app/config/app/app_setting.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_row_widget.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_screen_layout.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/basic_setting_item_model.dart';
import 'package:biz_card_app/shared/widgets/sliver/custom_sliver_container_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingProfileScreen extends ConsumerWidget {
  static String get route => '/setting_profile';

  const SettingProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<BasicSettingItemModel> settings = AppSetting(ref).profile;

    return SettingScreenLayout(
      appBarTitle: AppString.profile,
      children: [CustomSliverContainerWithBorder(child: SettingRowWidget(settings: settings))],
    );
  }
}
