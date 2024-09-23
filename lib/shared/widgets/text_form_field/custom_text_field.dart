import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/widgets/text_form_field/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextField extends ConsumerWidget {
  const CustomTextField({
    super.key,
    required this.basicController,
    this.titleToggle = true,
  });

  // 콘트롤러
  final BasicController basicController;
  final bool titleToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicTextFormField(
      controller: basicController.controller,
      validator: basicController.validator,
      // inputFormatters: inputFormatters,
      obscureText: basicController.obscureText,
      title: titleToggle ? null : basicController.name,
      inputDecoration: const InputDecoration(
        // fillColor: fillColor,
        // hintText: hintText,
        filled: true,
        // prefixIcon: prefixIcon,
        errorStyle: TextStyle(color: Colors.red, fontSize: 13),
      ),
    );
  }
}
