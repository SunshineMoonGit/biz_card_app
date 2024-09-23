import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/provider/modal/modal_toggle_provider.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeActionButtonWidget extends ConsumerWidget {
  const HomeActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => ref.read(modalToggleProvider.notifier).show(),
      child: BasicAssetSvg(
        item: AppSvg.getSvgName(AppSvg.cardAdd),
        color: context.colorScheme.background,
      ),
    );
  }
}
