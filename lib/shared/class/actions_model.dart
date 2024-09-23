import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';

class ActionsModel {
  final void Function() onTap;
  final String? title;
  final TextStyle? textStyle;
  final Widget? icon;

  ActionsModel({
    this.icon,
    required this.onTap,
    this.textStyle,
    this.title,
  });

  static List<Widget> text(List<ActionsModel> data) {
    return List.generate(data.length, (index) {
      return GestureDetector(
        onTap: data[index].onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            right: Dimensions.ssScreenSizeMedium,
          ),
          child: BasicText(
            title: '${data[index].title}',
            style: data[index].textStyle!,
          ),
        ),
      );
    });
  }
}
