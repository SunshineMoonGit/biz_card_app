import 'package:biz_card_app/features/data/models/user/base_user_info_model.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/presentation/views/profile/widget/profile_action_widget.dart';
import 'package:biz_card_app/features/presentation/views/profile/widget/profile_app_bar_widget.dart';
import 'package:biz_card_app/features/presentation/views/profile/widget/profile_card_widget.dart';
import 'package:biz_card_app/features/presentation/views/profile/widget/profile_detail_widget.dart';
import 'package:biz_card_app/features/presentation/views/profile/widget/profile_external_widget.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen<T extends BaseUserInfoModel> extends ConsumerWidget {
  static String get route => '/profile';

  const ProfileScreen({
    super.key,
    required this.data,
  });

  final T data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMyProfile = T == MyUserInfoModel;

    return BasicLayout(
      body: CustomScrollView(
        slivers: [
          // 앱바
          ProfileAppBarWidget(title: isMyProfile ? 'My Profile' : 'Profile'),

          // 프로필 상단(카드 모양으로 이름, 사명, 직군
          ProfileCardWidget(userData: data),

          // 카드 하단에는 버튼 2개(카드 보기, 친구 추가))
          ProfileActionWidget(userData: data, isMyProfile: isMyProfile),

          // 디테일 정보
          ProfileDetailWidget(userData: data),

          // external
          ProfileExternalWidget(external: data.external, isMyProfile: isMyProfile),
        ],
      ),
    );
  }
}
