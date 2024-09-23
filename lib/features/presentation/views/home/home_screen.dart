import 'package:biz_card_app/features/presentation/views/home/widget/home_action_button_widget.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/home_app_bar_widget.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/home_bottom_modal_widget.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/home_profile_widget.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/home_wallet_widget.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:biz_card_app/shared/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static String get route => '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        BasicLayout(
          floatingActionButton: const HomeActionButtonWidget(),
          body: CustomScrollView(
            slivers: [
              // Logo + 앱바 - 설정, 검색
              const HomeAppBarWidget(),

              // 아바타 + 이름/사명
              const HomeProfileWidget(),

              // 구분선
              CustomDivider.sliver(),

              // 즐겨찾기

              // Wallet 리스트
              const HomeWalletWidget(),
            ],
          ),
        ),
        const HomeBottomModalWidget(),
      ],
    );
  }
}
