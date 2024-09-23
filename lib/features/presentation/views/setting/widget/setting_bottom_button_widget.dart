import 'package:biz_card_app/shared/widgets/button/custom_bottom_button.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingBottomButtonWidget extends ConsumerWidget {
  const SettingBottomButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomButton(
      title: title,
      onTap: onTap,
    );
  }
}
