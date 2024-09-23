import 'dart:io';

import 'package:biz_card_app/shared/services/ss_print.dart';
import 'package:path_provider/path_provider.dart';

class SsAppDirImage {
  static Future<String> saveLocal(String? imagePath, String uid) async {
    if (imagePath == null) {
      return '';
    }

    // XFile을 File로 변환
    final File imageFile = File(imagePath);

    // 현재 시간을 이용해 고유한 파일 이름 생성
    final String fileName = 'image_$uid.png';

    // 파일 경로를 생성함
    final File file = await getFile(fileName);

    // 이미지 파일을 복사하여 저장
    await imageFile.copy(file.path);

    return file.path;
  }

  // 파일 경로를 생성하는 함수
  static Future<File> getFile(String fileName) async {
    // 앱의 디렉토리 경로를 가져옴
    final directory = await getApplicationDocumentsDirectory();
    // 파일 경로와 파일 이름을 합쳐서 전체 파일 경로를 만듬
    return File('${directory.path}/$fileName');
  }

  Future<void> deleteAllFiles() async {
    try {
      // 앱의 문서 디렉토리 경로를 가져옴
      final directory = await getApplicationDocumentsDirectory();
      final dir = Directory(directory.path);

      // 디렉토리 내의 모든 파일 목록을 가져옴
      List<FileSystemEntity> files = dir.listSync();

      // 모든 파일을 삭제
      for (FileSystemEntity file in files) {
        if (file is File) {
          await file.delete();
        }
      }

      ssPrint('모든 파일이 삭제되었습니다.', 'ss_app_dir_image');
    } catch (e) {
      ssPrint('파일 삭제 중 오류 발생: $e', 'ss_app_dir_image');
    }
  }

  Future<void> deleteFileByName(String fileName) async {
    try {
      // 앱의 문서 디렉토리 경로를 가져옴
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      // 파일이 존재하는지 확인 후 삭제
      if (await file.exists()) {
        await file.delete();
        ssPrint('파일이 삭제되었습니다: $fileName', 'ss_app_dir_image');
      } else {
        ssPrint('파일이 존재하지 않습니다: $fileName', 'ss_app_dir_image');
      }
    } catch (e) {
      ssPrint('파일 삭제 중 오류 발생: $e', 'ss_app_dir_image');
    }
  }
}
