import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/button/custom_bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfSaveButtonWidget extends ConsumerWidget {
  const SelfSaveButtonWidget({
    super.key,
    required this.manager,
    required this.isMyProfile,
  });

  final ControllerManager manager;
  final bool isMyProfile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomBottomButton(
      title: isMyProfile ? 'save' : 'Save',
      onTap: () async {
        // 내 정보 업데이트
        if (isMyProfile) {
          await AppMethod(ref).auth.update(manager);
        }
        // 새로운 카드 입력
        else {
          await AppMethod(ref).wallet.add(manager);
        }
      },
    );
  }
}
