import 'package:biz_card_app/features/presentation/providers/wallet/wallet_provider.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/component/wallet_item.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeWalletWidget extends ConsumerWidget {
  const HomeWalletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletList = ref.watch(walletProvider);

    if (walletList.isEmpty) {
      return const SliverToBoxAdapter(
        child: Center(
          child: BasicText(
            title: '저장한 명함이 없습니다.',
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Column(
        children: walletList.map((e) => WalletItem(userInfo: e)).toList(),
      ),
    );
  }
}
