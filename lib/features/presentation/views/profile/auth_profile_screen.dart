// import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
// import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_action_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_app_bar_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_card_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_detail_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_external_widget.dart';
// import 'package:biz_card_app/shared/widgets/basic_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthProfileScreen extends ConsumerWidget {
//   static String get route => '/auth_profile';

//   const AuthProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final UserInfoModel myInfo = ref.watch(authInfoProvider);

//     return BasicLayout(
//       body: CustomScrollView(
//         slivers: [
//           // 앱바
//           const ProfileAppBarWidget(title: 'profile'),

//           // 프로필 상단(카드 모양으로 이름, 사명, 직군
//           ProfileCardWidget(userData: myInfo),

//           // 카드 하단에는 버튼 2개(카드 보기, 친구 추가))
//           ProfileActionWidget(userData: myInfo, isMyProfile: true),

//           // 디테일 정보
//           ProfileDetailWidget(userData: myInfo),

//           // external
//           ProfileExternalWidget(external: myInfo.external, isMyProfile: true),
//         ],
//       ),
//     );
//   }
// }
