// import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
// import 'package:biz_card_app/features/presentation/views/activity/edit/widget/edit_app_bar_widget.dart';
// import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_bottom_modal_widget.dart';
// import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_input_card_widget.dart';
// import 'package:biz_card_app/shared/widgets/basic_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ActivityEditScreen extends ConsumerWidget {
//   static String get route => '/activity/edit';

//   const ActivityEditScreen({
//     super.key,
//     required this.userData,
//   });

//   final UserInfoModel userData;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final RegisterControllerManager controllers = ref.watchRegisterController();

//     // controllers.setUserInfo(userData);

//     return const Stack(
//       children: [
//         BasicLayout(
//           body: CustomScrollView(
//             slivers: [
//               // 앱바
//               EditAppBarWidget(),

//               // 카드 입력란
//               SelfInputCardWidget(),

//               // 기본 정보 입력란
//               // SelfInputFieldWidget(controllers: controllers, title: AppString.basicInfo),
//             ],
//           ),
//           // 저장 버튼
//           // bottomNavigationBar: EditBottomButtonWidget(controllers: controllers, uid: userData.uid),
//         ),
//         SelfBottomModalWidget(),
//       ],
//     );
//   }
// }
