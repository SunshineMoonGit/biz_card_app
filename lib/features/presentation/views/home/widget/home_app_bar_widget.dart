import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/features/presentation/views/search/search_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_screen.dart';
import 'package:biz_card_app/shared/class/actions_model.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/sliver/basic_sliver_app_bar.dart';
import 'package:biz_card_app/shared/widgets/text/custom_logo_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<ActionsModel> actions = [
      ActionsModel(
        onTap: () => context.push(SearchScreen.route),
        icon: BasicAssetSvg(item: AppSvg.getSvgName(AppSvg.search)),
      ),
      ActionsModel(
        onTap: () => context.push(SettingScreen.route),
        icon: BasicAssetSvg(item: AppSvg.getSvgName(AppSvg.setting)),
      ),
    ];

    return BasicSliverAppBar(
      title: const Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: CustomLogoText(fontSize: 30),
      ),
      actions: actions,
    );
  }
}
