enum AuthState {
  initial, // 초기 상태
  loading, // 인증 진행 중
  authenticated, // 인증됨
  authenticatedButIncomplete, // 인증은 되었지만 정보가 불완전함
  unauthenticated, // 인증되지 않음
  error // 오류 발생
}

enum LoginType { none, email, google, naver, kakao }

enum ControllerType { signIn, signUp, register, search, edit }

enum SizeType { small, medium, large }

enum ThemeType { light, dark }

enum UpdateType { add, delete, change }

enum GetImageMethod { gallery, camera }

enum SettingType {
  main,
  auth,
  profile,
  custom,
  display,
  language,
}

enum InputType { string, bool, select }

enum UserType { normal, premium, master }

// ControllerItems enum 정의
enum ControllerItems {
  email,
  password,
  confirmPassword,
  name,
  team,
  company,
  phone,
  fax,
  search,
}
