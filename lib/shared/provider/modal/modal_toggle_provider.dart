import 'package:flutter_riverpod/flutter_riverpod.dart';

final modalToggleProvider = StateNotifierProvider<ModalToggleProviderNotifier, bool>((ref) {
  return ModalToggleProviderNotifier();
});

class ModalToggleProviderNotifier extends StateNotifier<bool> {
  ModalToggleProviderNotifier() : super(false);

  // 모달을 표시하기 위한 메소드
  void show() {
    state = true;
  }

  // 모달을 숨기기 위한 메소드
  void hide() {
    state = false;
  }
}
