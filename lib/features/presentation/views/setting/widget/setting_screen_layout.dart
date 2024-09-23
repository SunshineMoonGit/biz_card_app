import 'package:biz_card_app/features/presentation/views/setting/widget/setting_app_bar_widget.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_bottom_button_widget.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreenLayout extends ConsumerWidget {
  const SettingScreenLayout({
    super.key,
    required this.children,
    this.appBarTitle = '',
    this.bottomButtonToggle = true,
    this.bottomButtonTitle = 'save',
    this.onBottomButtonTap,
  });

  final List<Widget> children;
  final String appBarTitle;
  final bool bottomButtonToggle;
  final String bottomButtonTitle;
  final VoidCallback? onBottomButtonTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicLayout(
      body: CustomScrollView(
        slivers: [
          // 앱바
          SettingAppBarWidget(title: appBarTitle),

          // 설정 리스트
          ...children,
        ],
      ),
      bottomNavigationBar: bottomButtonToggle
          ? SettingBottomButtonWidget(
              title: bottomButtonTitle,
              onTap: onBottomButtonTap ?? () {},
            )
          : null,
    );
  }
}
