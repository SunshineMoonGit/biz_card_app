// import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_action_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_app_bar_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_card_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_delete_button_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_detail_widget.dart';
// import 'package:biz_card_app/features/presentation/views/profile/widget/profile_external_widget.dart';
// import 'package:biz_card_app/shared/widgets/basic_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UserProfileScreen extends ConsumerWidget {
//   final UserInfoModel userData;

//   static String get route => '/auth_user_info';

//   const UserProfileScreen({
//     required this.userData,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return BasicLayout(
//       body: CustomScrollView(
//         slivers: [
//           // 앱바
//           const ProfileAppBarWidget(),

//           // 프로필 상단(카드 모양으로 이름, 사명, 직군
//           ProfileCardWidget(userData: userData),

//           // 카드 하단에는 버튼 2개(카드 보기, 친구 추가))
//           ProfileActionWidget(userData: userData, isMyProfile: false),

//           // 디테일 정보
//           ProfileDetailWidget(userData: userData),

//           // external
//           ProfileExternalWidget(external: userData.external, isMyProfile: false),
//         ],
//       ),
//       bottomNavigationBar: ProfileDeleteButtonWidget(uid: userData.uid),
//     );
//   }
// }
