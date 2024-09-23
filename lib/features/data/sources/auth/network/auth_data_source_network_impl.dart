import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/data/sources/auth/network/auth_data_source_network.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:biz_card_app/shared/services/error_handler/firebase_error_handler.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';
import 'package:biz_card_app/shared/services/ss_print.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSourceNetworkImpl extends AuthDataSourceNetwork {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final HiveStorageService _storageService;

  AuthDataSourceNetworkImpl(this._storageService);

  @override
  Future<Result<MyUserInfoModel>> signInWithEmail(String email, String pw) async {
    try {
      final UserCredential res = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: pw);

      if (res.user == null) {
        return Result.failure('사용자 정보를 찾을 수 없습니다.');
      }

      // local auth -> 나머지 정보
      Result<MyUserInfoModel> result = await get(res.user!.uid);

      return result.when(
        success: (value) async {
          // 로컬에 저장하기
          await _storageService.auth.update(value);

          return Result.success(value);
        },
        failure: (error) => Result.failure('사용자 정보를 찾을 수 없습니다.'),
      );
    } on FirebaseAuthException catch (e) {
      return Result.failure(handleFirebaseAuthError(e));
    } catch (e) {
      return Result.failure('로그인 실패: ${e.toString()}');
    }
  }

  @override
  Future<Result<MyUserInfoModel>> signUpWithEmail(String email, String pw) async {
    try {
      final UserCredential res = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: pw);

      final MyUserInfoModel result = MyUserInfoModel.fromUser(res.user!);

      // firebase 저장
      await _db.collection("users").doc(res.user!.uid).set(result.toJson());

      // 로컬에 저장하기
      await _storageService.auth.update(result);

      return Result.success(result);
    } on FirebaseAuthException catch (e) {
      return Result.failure(handleFirebaseAuthError(e));
    } catch (e) {
      return Result.failure('회원가입 실패: ${e.toString()}');
    }
  }

  @override
  Future<Result> update(MyUserInfoModel data) async {
    try {
      // update -> copyWith 필수

      // 업데이트
      await _db.collection("users").doc(data.uid).set(data.toJson());

      return Result.success('정보 업데이트 성공.');
    } catch (e) {
      ssPrint(e.toString(), 'AuthDataSourceNetworkImpl', 'update');
      return Result.failure('정보 업데이트 실패.');
    }
  }

  @override
  Future<Result<MyUserInfoModel>> get(String uid) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef = _db.collection("users").doc(uid);

      final DocumentSnapshot<Map<String, dynamic>> doc = await docRef.get();

      if (!doc.exists || doc.data() == null) {
        return Result.failure("데이터가 없습니다.");
      }

      final Map<String, dynamic> data = doc.data()!;

      try {
        return Result.success(MyUserInfoModel.fromJson(data));
      } catch (e) {
        return Result.failure("데이터 파싱 실패: ${e.toString()}");
      }
    } catch (e) {
      return Result.failure("데이터 불러오기 실패: ${e.toString()}");
    }
  }

  Future<MyUserInfoModel> userSetting(UserCredential res, KeySettingModel settings) async {
    final User user = res.user!;

    final MyUserInfoModel result = MyUserInfoModel.fromUser(user);

    // await _storageService.key.update(settings.copyWith());

    return result;
  }

  // GOOGLE
  @override
  Future<Result<MyUserInfoModel>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential res = await FirebaseAuth.instance.signInWithCredential(credential);

      final MyUserInfoModel result = MyUserInfoModel.fromUser(res.user!);

      // 로컬에 저장하기
      await _storageService.auth.update(result);

      return Result.success(result);
    } catch (e) {
      return Result.failure('Google 로그인 실패: ${e.toString()}');
    }
  }
}
