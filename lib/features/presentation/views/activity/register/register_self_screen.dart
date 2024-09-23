// import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_app_bar_widget.dart';
// import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_bottom_modal_widget.dart';
// import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_input_card_widget.dart';
// import 'package:biz_card_app/shared/widgets/basic_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// class RegisterSelfScreen extends ConsumerWidget {
//   static String get route => '/register_my_profile';

//   const RegisterSelfScreen({
//     super.key,
//     required this.isMyProfile,
//   });

//   final bool isMyProfile;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final bool isMyProfile = GoRouterState.of(context).uri.queryParameters['isMyProfile'] == 'true';

//     // final RegisterControllerManager controllers = ref.watchRegisterController();

//     // 내 정보 입력 페이지 일 때 이미 아는 정보 채워줌
//     // if (isMyProfile) {
//     //   final UserInfoModel myInfo = ref.read(authInfoProvider);
//     //   controllers.name.text = myInfo.name;
//     //   controllers.email.text = myInfo.email;
//     //   controllers.team.text = myInfo.team;
//     //   controllers.company.text = myInfo.company;
//     //   controllers.phone.text = myInfo.phone;
//     //   controllers.fax.text = myInfo.fax;
//     // }

//     return Stack(
//       children: [
//         BasicLayout(
//           body: CustomScrollView(
//             slivers: [
//               // 앱바
//               SelfAppBarWidget(isMyProfile: isMyProfile),

//               // 카드 입력란
//               const SelfInputCardWidget(),

//               // 기본 정보 입력란
//               // SelfInputFieldWidget(controllers: controllers, title: AppString.basicInfo),
//             ],
//           ),
//           // 저장 버튼
//           // bottomNavigationBar: SelfSaveButtonWidget(controllers: controllers, isMyProfile: isMyProfile),
//         ),
//         const SelfBottomModalWidget(),
//       ],
//     );
//   }
// }
