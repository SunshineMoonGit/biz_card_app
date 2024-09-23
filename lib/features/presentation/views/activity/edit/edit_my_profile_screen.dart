import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';

class EditMyProfileScreen extends StatelessWidget {
  static const String route = '/edit_my_profile';

  const EditMyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasicLayout(
      body: CustomScrollView(),
    );
  }
}
