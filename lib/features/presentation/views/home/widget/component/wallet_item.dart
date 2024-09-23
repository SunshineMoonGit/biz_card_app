import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/component/custom_avatar.dart';
import 'package:biz_card_app/features/presentation/views/profile/profile_screen.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WalletItem extends ConsumerWidget {
  const WalletItem({
    super.key,
    required this.userInfo,
  });

  final OtherUserInfoModel userInfo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => context.push(ProfileScreen.route, extra: userInfo),
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: Row(
          children: [
            CustomAvatar(
              imagePath: userInfo.profileImage,
            ),
            Dimensions.ssHorizontalSpaceMedium,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicText(
                  title: userInfo.name,
                  style: ref.textTheme.bodyLarge,
                ),
                BasicText(
                  title: userInfo.company,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
