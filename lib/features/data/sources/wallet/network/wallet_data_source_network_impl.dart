import 'dart:async';
import 'dart:io';

import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/data/sources/wallet/network/wallet_data_source_network.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class WalletDataSourceNetworkImpl extends WalletDataSourceNetwork {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Future<Result<List<OtherUserInfoModel>>> update(List<OtherUserInfoModel> followings) async {
    try {
      final List<OtherUserInfoModel> result = await Future.wait(followings.map((e) async {
        DocumentSnapshot snapshot = await _db.collection("users").doc(e.uid).get();
        if (snapshot.exists) {
          return OtherUserInfoModel.fromJson(snapshot.data()! as Map<String, dynamic>);
        }
        return e;
      }));

      return Result.success(result);
    } catch (e) {
      return Result.failure('지갑에 저장하지 못했습니다.');
    }
  }

  @override
  Future<Result<String>> add(String uid, OtherUserInfoModel newData, File? cardImage) async {
    try {
      final CollectionReference<Map<String, dynamic>> collectionRef =
          _db.collection("users").doc(uid).collection('following');

      newData = newData.copyWith(
        cardImage: await _uploadImage(newData.uid, cardImage),
      );

      await collectionRef.doc(newData.uid).set(newData.toJson());

      return Result.success('지갑에 저장했습니다.');
    } catch (e) {
      print(e);
      return Result.failure('지갑에 저장하지 못했습니다.');
    }
  }

  Future<String> _uploadImage(String uploadUid, File? image) async {
    if (image == null) {
      return '';
    }
    Reference reference = _storage.ref().child("profile/$uploadUid");

    await reference.putFile(image);
    final String downloadUrl = await reference.getDownloadURL();
    print('File uploaded. Download URL: $downloadUrl');

    return downloadUrl;
  }
}

final List<Map<String, dynamic>> json = [
  {
    "uid": "user001",
    "userType": "normal",
    "name": "김철수",
    "profileImage": "https://example.com/profiles/user001.jpg",
    "cardImage": "https://example.com/cards/user001.jpg",
    "email": "chulsoo.kim@example.com",
    "team": "개발팀",
    "company": "테크 솔루션즈",
    "phone": "010-1234-5678",
    "fax": "02-1234-5678",
    "lastUpdate": "2023-04-15T09:30:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user002",
    "userType": "premium",
    "name": "이영희",
    "profileImage": "https://example.com/profiles/user002.jpg",
    "cardImage": "https://example.com/cards/user002.jpg",
    "email": "younghee.lee@example.com",
    "team": "마케팅팀",
    "company": "글로벌 마케팅",
    "phone": "010-2345-6789",
    "fax": "02-2345-6789",
    "lastUpdate": "2023-04-14T14:45:00Z",
    "followings": [
      {"user": "user001"},
      {"user": "user003"}
    ],
    "external": [
      {"type": "linkedin", "url": "https://linkedin.com/in/younghee-lee"}
    ]
  },
  {
    "uid": "user003",
    "userType": "normal",
    "name": "박민준",
    "profileImage": "https://example.com/profiles/user003.jpg",
    "cardImage": "https://example.com/cards/user003.jpg",
    "email": "minjun.park@example.com",
    "team": "영업팀",
    "company": "베스트 세일즈",
    "phone": "010-3456-7890",
    "fax": "02-3456-7890",
    "lastUpdate": "2023-04-13T11:20:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user004",
    "userType": "premium",
    "name": "최서연",
    "profileImage": "https://example.com/profiles/user004.jpg",
    "cardImage": "https://example.com/cards/user004.jpg",
    "email": "seoyeon.choi@example.com",
    "team": "인사팀",
    "company": "인재 관리 솔루션",
    "phone": "010-4567-8901",
    "fax": "02-4567-8901",
    "lastUpdate": "2023-04-12T16:55:00Z",
    "followings": [
      {"user": "user002"},
      {"user": "user005"}
    ],
    "external": [
      {"type": "twitter", "url": "https://twitter.com/seoyeon_choi"}
    ]
  },
  {
    "uid": "user005",
    "userType": "normal",
    "name": "정도윤",
    "profileImage": "https://example.com/profiles/user005.jpg",
    "cardImage": "https://example.com/cards/user005.jpg",
    "email": "doyun.jung@example.com",
    "team": "디자인팀",
    "company": "크리에이티브 디자인",
    "phone": "010-5678-9012",
    "fax": "02-5678-9012",
    "lastUpdate": "2023-04-11T10:15:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user006",
    "userType": "premium",
    "name": "강지원",
    "profileImage": "https://example.com/profiles/user006.jpg",
    "cardImage": "https://example.com/cards/user006.jpg",
    "email": "jiwon.kang@example.com",
    "team": "재무팀",
    "company": "스마트 파이낸스",
    "phone": "010-6789-0123",
    "fax": "02-6789-0123",
    "lastUpdate": "2023-04-10T13:40:00Z",
    "followings": [
      {"user": "user003"},
      {"user": "user004"}
    ],
    "external": [
      {"type": "facebook", "url": "https://facebook.com/jiwon.kang"}
    ]
  },
  {
    "uid": "user007",
    "userType": "normal",
    "name": "송현우",
    "profileImage": "https://example.com/profiles/user007.jpg",
    "cardImage": "https://example.com/cards/user007.jpg",
    "email": "hyunwoo.song@example.com",
    "team": "고객지원팀",
    "company": "고객 케어 센터",
    "phone": "010-7890-1234",
    "fax": "02-7890-1234",
    "lastUpdate": "2023-04-09T09:05:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user008",
    "userType": "premium",
    "name": "임수진",
    "profileImage": "https://example.com/profiles/user008.jpg",
    "cardImage": "https://example.com/cards/user008.jpg",
    "email": "sujin.lim@example.com",
    "team": "연구개발팀",
    "company": "이노베이션 랩",
    "phone": "010-8901-2345",
    "fax": "02-8901-2345",
    "lastUpdate": "2023-04-08T15:30:00Z",
    "followings": [
      {"user": "user005"},
      {"user": "user006"}
    ],
    "external": [
      {"type": "github", "url": "https://github.com/sujin-lim"}
    ]
  },
  {
    "uid": "user009",
    "userType": "normal",
    "name": "윤재호",
    "profileImage": "https://example.com/profiles/user009.jpg",
    "cardImage": "https://example.com/cards/user009.jpg",
    "email": "jaeho.yoon@example.com",
    "team": "품질관리팀",
    "company": "퀄리티 프로",
    "phone": "010-9012-3456",
    "fax": "02-9012-3456",
    "lastUpdate": "2023-04-07T11:50:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user010",
    "userType": "premium",
    "name": "한미래",
    "profileImage": "https://example.com/profiles/user010.jpg",
    "cardImage": "https://example.com/cards/user010.jpg",
    "email": "mirae.han@example.com",
    "team": "전략기획팀",
    "company": "비전 플래너스",
    "phone": "010-0123-4567",
    "fax": "02-0123-4567",
    "lastUpdate": "2023-04-06T14:25:00Z",
    "followings": [
      {"user": "user007"},
      {"user": "user008"}
    ],
    "external": [
      {"type": "instagram", "url": "https://instagram.com/mirae_han"}
    ]
  },
  {
    "uid": "user011",
    "userType": "normal",
    "name": "오태현",
    "profileImage": "https://example.com/profiles/user011.jpg",
    "cardImage": "https://example.com/cards/user011.jpg",
    "email": "taehyun.oh@example.com",
    "team": "생산관리팀",
    "company": "스마트 팩토리",
    "phone": "010-1234-5678",
    "fax": "02-1234-5678",
    "lastUpdate": "2023-04-05T10:10:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user012",
    "userType": "premium",
    "name": "신예은",
    "profileImage": "https://example.com/profiles/user012.jpg",
    "cardImage": "https://example.com/cards/user012.jpg",
    "email": "yeeun.shin@example.com",
    "team": "홍보팀",
    "company": "브랜드 커뮤니케이션",
    "phone": "010-2345-6789",
    "fax": "02-2345-6789",
    "lastUpdate": "2023-04-04T16:40:00Z",
    "followings": [
      {"user": "user009"},
      {"user": "user010"}
    ],
    "external": [
      {"type": "youtube", "url": "https://youtube.com/channel/yeeun_shin"}
    ]
  },
  {
    "uid": "user013",
    "userType": "normal",
    "name": "권동현",
    "profileImage": "https://example.com/profiles/user013.jpg",
    "cardImage": "https://example.com/cards/user013.jpg",
    "email": "donghyun.kwon@example.com",
    "team": "법무팀",
    "company": "리걸 어드바이저",
    "phone": "010-3456-7890",
    "fax": "02-3456-7890",
    "lastUpdate": "2023-04-03T09:55:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user014",
    "userType": "premium",
    "name": "조은서",
    "profileImage": "https://example.com/profiles/user014.jpg",
    "cardImage": "https://example.com/cards/user014.jpg",
    "email": "eunseo.cho@example.com",
    "team": "국제사업팀",
    "company": "글로벌 비즈니스",
    "phone": "010-4567-8901",
    "fax": "02-4567-8901",
    "lastUpdate": "2023-04-02T13:20:00Z",
    "followings": [
      {"user": "user011"},
      {"user": "user012"}
    ],
    "external": [
      {"type": "linkedin", "url": "https://linkedin.com/in/eunseo-cho"}
    ]
  },
  {
    "uid": "user015",
    "userType": "normal",
    "name": "백승훈",
    "profileImage": "https://example.com/profiles/user015.jpg",
    "cardImage": "https://example.com/cards/user015.jpg",
    "email": "seunghoon.baek@example.com",
    "team": "보안팀",
    "company": "시큐리티 쉴드",
    "phone": "010-5678-9012",
    "fax": "02-5678-9012",
    "lastUpdate": "2023-04-01T11:35:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user016",
    "userType": "premium",
    "name": "유지민",
    "profileImage": "https://example.com/profiles/user016.jpg",
    "cardImage": "https://example.com/cards/user016.jpg",
    "email": "jimin.yoo@example.com",
    "team": "교육팀",
    "company": "러닝 허브",
    "phone": "010-6789-0123",
    "fax": "02-6789-0123",
    "lastUpdate": "2023-03-31T15:50:00Z",
    "followings": [
      {"user": "user013"},
      {"user": "user014"}
    ],
    "external": [
      {"type": "twitter", "url": "https://twitter.com/jimin_yoo"}
    ]
  },
  {
    "uid": "user017",
    "userType": "normal",
    "name": "남기태",
    "profileImage": "https://example.com/profiles/user017.jpg",
    "cardImage": "https://example.com/cards/user017.jpg",
    "email": "kitae.nam@example.com",
    "team": "물류팀",
    "company": "스마트 로지스틱스",
    "phone": "010-7890-1234",
    "fax": "02-7890-1234",
    "lastUpdate": "2023-03-30T10:05:00Z",
    "followings": [],
    "external": []
  },
  {
    "uid": "user018",
    "userType": "premium",
    "name": "홍서영",
    "profileImage": "https://example.com/profiles/user018.jpg",
    "cardImage": "https://example.com/cards/user018.jpg",
    "email": "seoyoung.hong@example.com",
    "team": "고객경험팀",
    "company": "CX 이노베이터",
    "phone": "010-8901-2345",
    "fax": "02-8901-2345",
    "lastUpdate": "2023-03-29T14:30:00Z",
    "followings": [
      {"user": "user015"},
      {"user": "user016"}
    ],
    "external": [
      {"type": "facebook", "url": "https://facebook.com/seoyoung.hong"}
    ]
  },
  {
    "uid": "user019",
    "userType": "normal",
    "name": "장민석",
    "profileImage": "https://example.com/profiles/user019.jpg",
    "cardImage": "https://example.com/cards/user019.jpg",
    "email": "minseok.jang@example.com",
    "team": "환경안전팀",
    "company": "에코 세이프티",
    "phone": "010-9012-3456",
    "fax": "02-9012-3456",
    "lastUpdate": "2023-03-28T09:45:00Z",
    "followings": [],
    "external": []
  },
];
