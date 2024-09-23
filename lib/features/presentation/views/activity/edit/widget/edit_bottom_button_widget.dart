import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/button/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditBottomButtonWidget extends ConsumerWidget {
  const EditBottomButtonWidget({
    super.key,
    required this.manager,
    required this.uid,
  });

  final ControllerManager manager;
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomButton(
      title: 'Edit',
      onTap: () {
        AppMethod(ref).wallet.edit(manager, uid);
      },
    );
  }
}
