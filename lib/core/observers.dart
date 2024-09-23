import 'package:biz_card_app/shared/services/ss_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observers extends ProviderObserver {
  @override
  void didUpdateProvider(
      ProviderBase<Object?> provider, Object? previousValue, Object? newValue, ProviderContainer container) {
    ssPrint(
      '$newValue ',
      '${provider.name ?? provider.runtimeType}',
      'didUpdateProvider',
      false,
    );
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  final WidgetRef ref;

  MyNavigatorObserver(this.ref);

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // 특정 페이지가 pop될 때 수행할 작업
    print(route.settings.name);
    // if (route.settings.name == '/myPage') {
    //   ref.invalidate(myNotifierProvider);
    // }
  }
}
