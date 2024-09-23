import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/class/modal_item_model.dart';
import 'package:biz_card_app/shared/provider/modal/modal_toggle_provider.dart';
import 'package:biz_card_app/shared/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'custom_bottom_modal_barrier.dart';
part 'custom_bottom_modal_content.dart';

class CustomBottomModal extends StatelessWidget {
  const CustomBottomModal({
    super.key,
    required this.modalItem,
    required this.userType,
  });

  final List<ModalItemModel> modalItem;
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _ModalBarrier(),
        _ModalContent(modalItem: modalItem, userType: userType),
      ],
    );
  }
}
