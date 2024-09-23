import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/features/presentation/providers/image/custom_image_provider.dart';
import 'package:biz_card_app/shared/class/modal_item_model.dart';
import 'package:biz_card_app/shared/widgets/modal/custom_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfBottomModalWidget extends ConsumerWidget {
  const SelfBottomModalWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ModalItemModel> modalItem = [
      ModalItemModel(
        icon: AppSvg.getSvgName(AppSvg.camera),
        title: '카드 등록',
        onTap: () => ref.read(customImageProvider.notifier).getImage(GetImageMethod.camera),
      ),
      ModalItemModel(
        icon: AppSvg.getSvgName(AppSvg.gallery),
        title: '갤러리',
        onTap: () => ref.read(customImageProvider.notifier).getImage(GetImageMethod.gallery),
      ),
    ];

    return CustomBottomModal(
      modalItem: modalItem,
      userType: UserType.normal,
    );
  }
}
