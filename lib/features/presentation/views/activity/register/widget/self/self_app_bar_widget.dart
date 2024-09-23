import 'package:biz_card_app/shared/widgets/sliver/custom_string_sliver_app_bar.dart';
import 'package:flutter/material.dart';

class SelfAppBarWidget extends StatelessWidget {
  const SelfAppBarWidget({
    super.key,
    required this.isMyProfile,
  });

  final bool isMyProfile;

  @override
  Widget build(BuildContext context) {
    return CustomStringSliverAppBar(
      title: isMyProfile ? 'welcome' : 'New Card Generator',
    );
  }
}
