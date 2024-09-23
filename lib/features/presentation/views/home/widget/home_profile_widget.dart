import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
import 'package:biz_card_app/features/presentation/views/home/widget/component/custom_avatar.dart';
import 'package:biz_card_app/features/presentation/views/profile/profile_screen.dart';
import 'package:biz_card_app/shared/extensions/build_context_extensions.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeProfileWidget extends ConsumerWidget {
  const HomeProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyUserInfoModel myInfo = ref.watch(authInfoProvider);

    return SliverToBoxAdapter(
      child: GestureDetector(
        // onTap: () => context.push(AuthProfileScreen.route),
        onTap: () => context.push(ProfileScreen.route),
        child: Padding(
          padding: Dimensions.ssPaddingHorizontal,
          child: Row(
            children: [
              //! 아바타 svg 색상 변경 필요
              const CustomAvatar(),

              Dimensions.ssHorizontalSpaceMedium,

              // 이름
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BasicText(
                      title: 'hello',
                      style: context.textTheme.bodyLarge,
                      color: context.colorScheme.shadow,
                    ),
                    BasicText(
                      title: '${myInfo.name} 👋',
                      style: context.textTheme.bodyLarge!.copyWith(fontSize: 25),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
