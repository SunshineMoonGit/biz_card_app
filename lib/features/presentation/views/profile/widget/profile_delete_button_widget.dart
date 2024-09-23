import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/button/custom_bottom_button.dart';
import 'package:biz_card_app/shared/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileDeleteButtonWidget extends ConsumerWidget {
  const ProfileDeleteButtonWidget({
    super.key,
    required this.uid,
  });

  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomButton(
      title: '삭제',
      backgroundColor: Colors.red,
      onTap: () {
        AppMethod(ref).wallet.delete(uid);
        context.pop();
      },
    );
  }
}
