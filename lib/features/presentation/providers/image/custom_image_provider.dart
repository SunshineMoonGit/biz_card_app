import 'dart:io';

import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/shared/provider/modal/modal_toggle_provider.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

final customImageProvider = NotifierProvider<CustomImageProviderNotifier, File?>(CustomImageProviderNotifier.new);

class CustomImageProviderNotifier extends Notifier<File?> {
  @override
  File? build() {
    return null;
  }

  void clear() {
    state = null;
  }

  void getImage(GetImageMethod method) async {
    // 먼저 모달 창 끄기
    ref.read(modalToggleProvider.notifier).hide();

    if (method == GetImageMethod.gallery) {
      await _getImageFromGallery();
    } else {
      await _getImageFromCamera();
    }
  }

  Future<void> _getImageFromCamera() async {
    // 카메라 권한 확인 및 요청
    if (!await _requestCameraPermission()) return;

    // 저장할 파일 경로 생성
    String imagePath = await _createImagePath();

    try {
      bool success = await EdgeDetection.detectEdge(
        imagePath,
        canUseGallery: false,
        androidScanTitle: '스캔 중',
        androidCropTitle: '자르기',
        androidCropBlackWhiteTitle: '흑백',
        androidCropReset: '초기화',
      );

      if (success) {
        state = File(imagePath);
      } else {
        print('카메라 이미지 처리 실패');
      }
    } catch (e) {
      print('카메라 캡처 오류: $e');
    }
    return;
  }

  Future<void> _getImageFromGallery() async {
    // 저장할 파일 경로 생성
    String imagePath = await _createImagePath();

    try {
      bool success = await EdgeDetection.detectEdgeFromGallery(
        imagePath,
        androidCropTitle: '자르기',
        androidCropBlackWhiteTitle: '흑백',
        androidCropReset: '초기화',
      );

      if (success) {
        state = File(imagePath);
      } else {
        print('갤러리 이미지 처리 실패');
      }
    } catch (e) {
      print('갤러리 선택 오류: $e');
    }
    return;
  }

  Future<bool> _requestCameraPermission() async {
    var status = await Permission.camera.request();
    return status.isGranted;
  }

  Future<String> _createImagePath() async {
    final directory = await getApplicationSupportDirectory();
    return join(directory.path, "${DateTime.now().millisecondsSinceEpoch}.jpeg");
  }
}
