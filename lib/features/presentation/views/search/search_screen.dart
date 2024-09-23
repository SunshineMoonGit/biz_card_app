import 'package:biz_card_app/features/presentation/views/search/widget/search_result_widget.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  static String get route => '/search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final SearchControllerManager controller = ref.watchSearchController();

    return const BasicLayout(
      body: CustomScrollView(
        slivers: [
          // Search Input
          // SearchAppBarWidget(controller: controller),

          // // Search Result
          // if (searchResult.isEmpty)
          //   const SliverToBoxAdapter(
          //     child: BasicText(title: '검색 결과 없음'),
          //   ),

          // if (searchResult.isNotEmpty)
          //   SliverToBoxAdapter(
          //     child: Column(
          //       children: searchResult[0].result.map((e) => WalletItem(userInfo: e)).toList(),
          //     ),
          //   ),
          SearchResultWidget(),
        ],
      ),
    );
  }
}
