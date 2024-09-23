import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomButton extends ConsumerWidget {
  const CustomBottomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
  });

  final String title;
  final void Function() onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
        left: Dimensions.ssScreenSizeSmall,
        right: Dimensions.ssScreenSizeSmall,
      ),
      child: BasicButton(
        backgroundColor: backgroundColor ?? context.colorScheme.primary,
        title: title,
        textColor: context.colorScheme.onPrimary,
        onTap: onTap,
      ),
    );
  }
}
