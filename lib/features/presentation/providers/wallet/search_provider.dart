import 'package:biz_card_app/features/presentation/views/search/search_controller_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchProviderNotifier extends Notifier<List<SearchState>> {
  @override
  build() {
    return [];
  }

  void update(List<SearchState> result) {
    state = result;
  }

  void search(String searchString) {
    // 로컬 데이터 불러오기

    // 찾기

    // state 업데이트
  }
}

final searchProvider = NotifierProvider<SearchProviderNotifier, List<SearchState>>(SearchProviderNotifier.new);
