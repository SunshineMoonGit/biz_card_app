import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationProvider =
    NotifierProvider<NotificationProviderNotifier, String?>(() => NotificationProviderNotifier());

class NotificationProviderNotifier extends Notifier<String?> {
  @override
  build() {
    return null;
  }

  void update(String e) {
    state = e;
  }

  void result(Result result) {
    state = result.toString();
  }

  void clear() {
    state = null;
  }
}
