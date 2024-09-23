part of 'basic_router.dart';

List<GoRoute> _routes = [
  // Splash 화면
  GoRoute(
    path: SplashScreen.route,
    builder: (context, state) => SplashScreen(settingUpdate: state.extra == null ? false : state.extra as bool),
  ),

  // 인증 관련 화면
  GoRoute(
    path: AuthSelectScreen.route,
    builder: (context, state) => const AuthSelectScreen(),
  ),
  GoRoute(
    path: SignInWithEmailScreen.route,
    builder: (context, state) => const SignInWithEmailScreen(),
  ),
  GoRoute(
    path: SignUpWithEmailScreen.route,
    builder: (context, state) => const SignUpWithEmailScreen(),
  ),

  // 홈 화면
  GoRoute(
    path: HomeScreen.route,
    builder: (context, state) => const HomeScreen(),
  ),

  // 사용자 프로필 및 이미지 뷰어
  GoRoute(
    path: ProfileScreen.route,
    builder: (context, state) => ProfileScreen(data: state.extra as BaseUserInfoModel),
  ),
  GoRoute(
    path: ImageViewerScreen.route,
    builder: (context, state) => ImageViewerScreen(imageUrl: state.extra as String),
  ),

  // 활동 관련 화면
  GoRoute(
    path: EditMyProfileScreen.route,
    builder: (context, state) => const EditMyProfileScreen(),
  ),
  GoRoute(
    path: RegisterMyProfileScreen.route,
    builder: (context, state) => const RegisterMyProfileScreen(),
  ),
  GoRoute(
    path: RegisterOtherProfileScreen.route,
    builder: (context, state) => const RegisterOtherProfileScreen(),
  ),
  // GoRoute(
  //   path: ActivityEditScreen.route,
  //   builder: (context, state) => ActivityEditScreen(userData: state.extra as UserInfoModel),
  // ),

  // 검색
  GoRoute(
    path: SearchScreen.route,
    builder: (context, state) => const SearchScreen(),
  ),

  // 마이 페이지 및 설정 화면
  // GoRoute(
  //   path: AuthProfileScreen.route,
  //   builder: (context, state) => const AuthProfileScreen(),
  // ),
  GoRoute(
    path: SettingScreen.route,
    builder: (context, state) => const SettingScreen(),
  ),
  GoRoute(
    path: SettingProfileScreen.route,
    builder: (context, state) => const SettingProfileScreen(),
  ),
  GoRoute(
    path: SettingStringScreen.route,
    builder: (context, state) => SettingStringScreen(setting: state.extra as StringSettingItemModel),
  ),
  GoRoute(
    path: SettingSelectScreen.route,
    builder: (context, state) => SettingSelectScreen(title: state.extra as String),
  ),
  // GoRoute(
  //   path: SettingAuthScreen.route,
  //   builder: (context, state) => const SettingAuthScreen(),
  // ),
  // GoRoute(
  //   path: SettingLanguageScreen.route,
  //   builder: (context, state) => const SettingLanguageScreen(),
  // ),
  // GoRoute(
  //   path: SettingDisplayScreen.route,
  //   builder: (context, state) => const SettingDisplayScreen(),
  // ),
  GoRoute(
    path: SettingEditTextFormScreen.route,
    builder: (context, state) => SettingEditTextFormScreen(
      setting: state.extra as SettingItemModel,
    ),
  ),

  // viewer
  GoRoute(
    path: QrCodeViewerScreen.route,
    builder: (context, state) => QrCodeViewerScreen(
      qrImage: state.extra as QrImage,
    ),
  )
];
