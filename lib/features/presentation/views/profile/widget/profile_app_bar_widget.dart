import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/shared/class/actions_model.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/sliver/custom_string_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileAppBarWidget extends ConsumerWidget {
  const ProfileAppBarWidget({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomStringSliverAppBar(
      centerTitle: true,
      title: title,
      actions: [
        ActionsModel(
          icon: BasicAssetSvg(item: AppSvg.getSvgName(AppSvg.more)),
          onTap: () {},
        ),
      ],
    );
  }
}
