import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/extensions/build_context_extensions.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicTextFormField extends ConsumerWidget {
  const BasicTextFormField({
    super.key,
    required this.controller,
    this.title,
    this.obscureText = false,
    this.validator,
    this.inputFormatters,
    required this.inputDecoration,
    this.onChanged,
  });

  // 타이틀
  final String? title;
  // 비밀번호
  final bool obscureText;
  // 텍스트 콘트롤러
  final TextEditingController controller;
  // 검증
  final String? Function(String?)? validator;
  // 포맷
  final List<TextInputFormatter>? inputFormatters;

  // onChanged
  final Function(String)? onChanged;

  // 스타일
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: Dimensions.ssPaddingAll / 2,
            child: BasicText(
              title: title!,
              style: ref.textTheme.titleLarge!,
              color: context.colorScheme.onSurface,
            ),
          ),
        TextFormField(
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          validator: validator,
          style: context.textTheme.bodyMedium!.copyWith(color: context.colorScheme.onSurface),
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          decoration: inputDecoration,
        ),
      ],
    );
  }
}
