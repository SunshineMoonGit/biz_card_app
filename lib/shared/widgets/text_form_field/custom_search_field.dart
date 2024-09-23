import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/widgets/text_form_field/basic_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchField extends ConsumerWidget {
  const CustomSearchField({
    super.key,
    this.hintText,
    required this.controller,
    this.onChanged,
  });

  // 힌트
  final String? hintText;
  // 텍스트 콘트롤러
  final TextEditingController controller;
  // 변경 콜백
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(right: Dimensions.ssScreenSizeMedium),
      child: BasicTextFormField(
        controller: controller,
        onChanged: onChanged,
        inputDecoration: InputDecoration(
          border: const UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colorScheme.onSurface.withOpacity(0.3)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.colorScheme.primary),
          ),
          fillColor: Colors.transparent,
          hintText: 'search',
          hintStyle: TextStyle(color: context.colorScheme.onSurface.withOpacity(0.5)),
          filled: true,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }
}
