part of 'custom_bottom_modal.dart';

class _ModalBarrier extends ConsumerWidget {
  const _ModalBarrier();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool modal = ref.watch(modalToggleProvider);

    return IgnorePointer(
      ignoring: !modal,
      child: GestureDetector(
        onTap: () {
          ref.read(modalToggleProvider.notifier).hide();
        },
        child: AnimatedOpacity(
          opacity: modal ? 0.5 : 0,
          duration: const Duration(milliseconds: 250),
          child: Container(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
