import 'package:biz_card_app/config/app/app_setting.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_row_widget.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_screen_layout.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/basic_setting_item_model.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/sliver/custom_sliver_container_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerWidget {
  static String get route => '/setting';

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<List<BasicSettingItemModel>> settings = AppSetting(ref).main;

    return SettingScreenLayout(
      appBarTitle: AppString.setting,
      bottomButtonTitle: AppString.signOut,
      onBottomButtonTap: () => AppMethod(ref).auth.signOut(),
      children: settings.map((e) => CustomSliverContainerWithBorder(child: SettingRowWidget(settings: e))).toList(),
    );
  }
}
