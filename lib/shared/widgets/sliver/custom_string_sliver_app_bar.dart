import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/actions_model.dart';
import 'package:biz_card_app/shared/widgets/sliver/basic_sliver_app_bar.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:biz_card_app/shared/widgets/text/custom_logo_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomStringSliverAppBar extends ConsumerWidget {
  const CustomStringSliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.pinned = true,
    this.backgroundColor,
    this.logo = false,
    this.centerTitle = false,
  });

  final String? title;
  final List<ActionsModel>? actions;
  final ActionsModel? leading;
  final bool pinned;
  final Color? backgroundColor;
  final bool logo;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicSliverAppBar(
      pinned: pinned,
      leading: leading,
      actions: actions,
      centerTitle: centerTitle,
      title: _buildTitle(ref),
    );
  }

  Widget? _buildTitle(WidgetRef ref) {
    if (logo) {
      return const Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: CustomLogoText(fontSize: 30),
      );
    }

    if (title == null) return null;

    return Padding(
      padding: Dimensions.ssPaddingHorizontal,
      child: BasicText(title: title!, style: ref.textTheme.displayMedium),
    );
  }
}
