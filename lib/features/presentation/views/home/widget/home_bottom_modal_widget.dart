import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/register_other_profile_screen.dart';
import 'package:biz_card_app/shared/class/modal_item_model.dart';
import 'package:biz_card_app/shared/widgets/modal/custom_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeBottomModalWidget extends ConsumerWidget {
  const HomeBottomModalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModalItemModel> modalItem = [
      ModalItemModel(
        icon: AppSvg.getSvgName(AppSvg.cardRegister),
        title: '카드 등록',
        onTap: () => context.push(RegisterOtherProfileScreen.route),
      ),
      ModalItemModel(
        userType: UserType.premium,
        icon: AppSvg.getSvgName(AppSvg.maximize),
        title: 'QRCode',
        onTap: () => context.push(RegisterOtherProfileScreen.route),
      ),
    ];

    return CustomBottomModal(
      modalItem: modalItem,
      userType: UserType.normal,
    );
  }
}
