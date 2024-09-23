part of 'basic_router.dart';

class _RedirectNotifier extends ChangeNotifier {
  final Ref ref;

  _RedirectNotifier(this.ref) : super() {
    ref.listen<AuthState>(
      authStateProvider,
      (previous, next) {
        if (previous != next) {
          notifyListeners();
        }
      },
    );
  }

  List<String> urls = [SplashScreen.route, SignInWithEmailScreen.route, SignUpWithEmailScreen.route];

  Future<String?> _redirectLogic(_, GoRouterState state) async {
    final AuthState authState = await ref.watch(authStateProvider);
    ssPrint('Current path: ${state.uri.path}', 'Current authState: $authState', '_redirectLogic', false);

    if (urls.contains(state.uri.path)) {
      switch (authState) {
        case AuthState.authenticated:
          return HomeScreen.route;
        case AuthState.unauthenticated:
          if (state.uri.path == SignInWithEmailScreen.route) return null;
          return AuthSelectScreen.route;

        case AuthState.authenticatedButIncomplete:
          return RegisterMyProfileScreen.route;

        default:
          return null; // initial, loading, error 등의 상태에��는 리다이렉트하지 않음
      }
    }
    return null;
  }
}
