import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/extensions/build_context_extensions.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomContainerWithTitle extends ConsumerWidget {
  const CustomContainerWithTitle({
    super.key,
    this.title,
    required this.child,
    this.deleteBox = false,
    this.backgroundColor,
  });

  final String? title;
  final Widget child;
  final bool deleteBox;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: Dimensions.ssPaddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) BasicText(title: '$title', style: context.textTheme.headlineLarge),
          if (title != null) Dimensions.ssVerticalSpaceSmall,
          child,
        ],
      ),
    );
  }
}
