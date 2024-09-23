import 'package:firebase_auth/firebase_auth.dart';

String handleFirebaseAuthError(FirebaseAuthException e) {
  switch (e.code) {
    case 'invalid-credential':
      return '인증 정보가 올바르지 않거나 만료되었습니다.';
    case 'user-disabled':
      return '해당 사용자 계정이 비활성화되었습니다.';
    case 'user-not-found':
      return '해당 이메일로 등록된 사용자를 찾을 수 없습니다.';
    case 'wrong-password':
      return '잘못된 비밀번호입니다.';
    case 'invalid-email':
      return '유효하지 않은 이메일 주소입니다.';
    case 'email-already-in-use':
      return '이미 사용 중인 이메일 주소입니다.';
    case 'weak-password':
      return '비밀번호가 너무 약합니다.';
    case 'operation-not-allowed':
      return '이 작업은 허용되지 않습니다.';
    case 'account-exists-with-different-credential':
      return '이미 다른 인증 방법으로 등록된 계정입니다.';
    case 'invalid-verification-code':
      return '유효하지 않은 인증 코드입니다.';
    case 'invalid-verification-id':
      return '유효하지 않은 인증 ID입니다.';
    case 'quota-exceeded':
      return '요청 할당량을 초과했습니다. 나중에 다시 시도해 주세요.';
    case 'network-request-failed':
      return '네트워크 연결에 실패했습니다.';
    case 'too-many-requests':
      return '너무 많은 요청이 발생했습니다. 잠시 후 다시 시도해 주세요.';
    default:
      return '인증 오류가 발생했습니다: ${e.message}';
  }
}
