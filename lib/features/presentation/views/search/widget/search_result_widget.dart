import 'package:biz_card_app/features/presentation/providers/wallet/search_provider.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/component/wallet_item.dart';
import 'package:biz_card_app/features/presentation/views/search/search_controller_manager.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchResultWidget extends ConsumerWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SearchState> searchResult = ref.watch(searchProvider);

    if (searchResult.isEmpty) {
      return const SliverToBoxAdapter(
        child: BasicText(
          title: 'No Data',
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Column(
        children: searchResult.map(
          (e) {
            return Column(
              children: [
                if (e.result.isNotEmpty) BasicText(title: e.title),
                ...e.result.map((t) => WalletItem(userInfo: t)),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
