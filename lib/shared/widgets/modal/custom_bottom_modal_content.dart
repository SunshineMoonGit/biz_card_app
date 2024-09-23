part of 'custom_bottom_modal.dart';

class _ModalContent extends ConsumerWidget {
  const _ModalContent({required this.modalItem, required this.userType});

  final List<ModalItemModel> modalItem;
  final UserType userType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool modal = ref.watch(modalToggleProvider);

    // Modal List 만들기
    final List<Widget> modalItemList = List.generate(
      modalItem.length * 2 - 1,
      (index) {
        if (index % 2 == 0) {
          final int pIndex = index ~/ 2;
          return ModalItemModel.transWidget(modalItem[pIndex], userType, index, modalItem.length, ref, context);
        } else {
          return CustomDivider.modal();
        }
      },
    );

    return Positioned(
      left: Dimensions.ssScreenSizeSmall,
      right: Dimensions.ssScreenSizeSmall,
      bottom: Dimensions.ssScreenSizeMedium,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.ease,
        transform: Matrix4.translationValues(0, modal ? 0 : 400, 0),
        child: Material(
          borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
          child: Container(
            height: Dimensions.ssScreenSizeMedium * 2 + Dimensions.ssTextFontSizeMedium * 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: modalItemList,
            ),
          ),
        ),
      ),
    );
  }
}
