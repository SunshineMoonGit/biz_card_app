import 'package:biz_card_app/core/app.dart';
import 'package:biz_card_app/core/observers.dart';
import 'package:biz_card_app/firebase_options.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // cameras = await availableCameras();

  await StorageService.initialize();

  runApp(
    ProviderScope(
      observers: [Observers()],
      child: const App(),
    ),
  );
}

/* 
//! TODO
  0. 컨트롤러 페이지마다 구현하기

  // 내 카드 정보 qr코드로 바꾸기 -> 사진 형식으로 공유 가능

  1. 로그인 flow 확인하기 , 생각 해 볼 것
    - 만약에 회원가입을 할 때, 구글로 해 -> 바로 회원 정보를 저장?? 
    - auth state redirect 확인하기

  2. 데이터 관리 
    - 로그아웃 시 로컬 데이터를 삭제 시킨다?
    - 로그인 시 해당 데이터를 불러와서 엎어 버린다?

    - 서버에 정보를 저장 주기는 어떻게 해야할까?

    - 설정에 추가로 들어가야 할 값
      -> 쓰잘데기 없는 것도 일단 넣어
        - 폰트 크기
        - 이런것들
  3. UI
    - 카드로 보여주는 편이 나을 듯하다. (main screen + profile screen)
      카드는 필수적으로 저장할 것이니까

    - 즐겨찾기 만들기

    검색 했을 때, 


    명함 카드 정리 앱에서 프리미엄 유저와 일반 유저의 차별화를 위해 다음과 같은 기능을 고려할 수 있습니다:

저장 용량:

일반 유저: 제한된 수의 명함 저장 (예: 100장)
프리미엄 유저: 무제한 명함 저장
고급 검색 기능:

일반 유저: 기본적인 검색 기능
프리미엄 유저: 고급 필터링 및 태그 기능, OCR(광학 문자 인식)으로 명함 내용 검색 가능
명함 디자인 및 템플릿:

일반 유저: 기본 디자인 템플릿 제공
프리미엄 유저: 다양한 고급 디자인 템플릿 및 커스터마이징 옵션 제공
데이터 백업 및 복원:

일반 유저: 수동 백업 기능
프리미엄 유저: 자동 클라우드 백업 및 복원 기능
통계 및 분석:

일반 유저: 기본적인 사용 통계
프리미엄 유저: 명함 사용 패턴 분석, 네트워킹 통계 제공
광고 제거:

일반 유저: 광고 포함
프리미엄 유저: 광고 없는 경험 제공
고객 지원:

일반 유저: 기본적인 고객 지원
프리미엄 유저: 우선 지원 및 전담 상담 서비스

*/