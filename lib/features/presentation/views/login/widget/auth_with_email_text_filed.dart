import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/widgets/text_form_field/custom_text_field.dart';
import 'package:flutter/material.dart';

class AuthWithEmailTextField extends StatelessWidget {
  const AuthWithEmailTextField({
    super.key,
    required this.controllers,
  });

  final List<BasicController> controllers;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: controllers.map((e) {
            return CustomTextField(basicController: e);
          }).toList(),
        ),
      ),
    );
  }
}
