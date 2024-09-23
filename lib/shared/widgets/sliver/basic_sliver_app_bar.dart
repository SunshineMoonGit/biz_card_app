import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/class/actions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicSliverAppBar extends ConsumerWidget {
  const BasicSliverAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.pinned = true,
    this.backgroundColor,
    this.centerTitle = false,
  });

  final Widget? title;
  final List<ActionsModel>? actions;
  final ActionsModel? leading;
  final bool pinned;
  final Color? backgroundColor;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      backgroundColor: context.colorScheme.background,
      surfaceTintColor: context.colorScheme.background,
      pinned: pinned,
      leading: _buildLeading(),
      toolbarHeight: kToolbarHeight,
      actions: _buildActions(),
      centerTitle: centerTitle,
      title: title,
    );
  }

  Widget? _buildLeading() {
    if (leading == null) return null;

    return GestureDetector(
      onTap: leading!.onTap,
      child: leading!.icon,
    );
  }

  List<Widget>? _buildActions() {
    if (actions == null) return null;

    return actions!.asMap().entries.map((entry) {
      final index = entry.key;
      final action = entry.value;
      final isLastItem = index == actions!.length - 1;

      return Padding(
        padding: EdgeInsets.only(right: isLastItem ? Dimensions.ssScreenSizeMedium : Dimensions.ssScreenSizeSmall),
        child: GestureDetector(
          onTap: action.onTap,
          child: action.icon,
        ),
      );
    }).toList();
  }
}
