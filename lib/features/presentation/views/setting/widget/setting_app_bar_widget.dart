import 'package:biz_card_app/shared/widgets/sliver/custom_string_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class SettingAppBarWidget extends StatelessWidget {
  const SettingAppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomStringSliverAppBar(
      title: title,
      centerTitle: true,
    );
  }
}
