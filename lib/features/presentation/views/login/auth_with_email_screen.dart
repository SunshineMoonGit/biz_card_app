// import 'package:biz_card_app/config/app/app_enum.dart';
// import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_app_bar.dart';
// import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_submit_button.dart';
// import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_text_filed.dart';
// import 'package:biz_card_app/features/presentation/views/login/widget/auth_with_email_to_route.dart';
// import 'package:biz_card_app/shared/controller_manager/basic_controller_manager.dart';
// import 'package:biz_card_app/shared/provider/controller_provider.dart';
// import 'package:biz_card_app/shared/widgets/basic_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AuthWithEmailScreen extends ConsumerStatefulWidget {
//   static String get route => '/auth_with_email';

//   final ControllerType cType;

//   const AuthWithEmailScreen({
//     super.key,
//     required this.cType,
//   });

//   @override
//   ConsumerState<AuthWithEmailScreen> createState() => _AuthWithEmailScreenState();
// }

// class _AuthWithEmailScreenState extends ConsumerState<AuthWithEmailScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   late final TextEditingController emailController;
//   late final TextEditingController pwController;
//   late final TextEditingController pwConfirmController;

//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     pwController = TextEditingController();
//     pwConfirmController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     pwController.dispose();
//     pwConfirmController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     late final BasicControllerManager controllers;

//     if (widget.cType == ControllerType.signIn) {
//       controllers = ref.watchSignInController();
//     } else {
//       controllers = ref.watchSignUpController();
//     }

//     return BasicLayout(
//       body: Form(
//         key: _formKey,
//         child: CustomScrollView(
//           slivers: [
//             // 앱바
//             AuthWithEmailAppBar(cType: widget.cType),

//             // 입력란
//             AuthWithEmailTextField(controllers: controllers),

//             // 추가 이동 (회원가입/로그인)
//             AuthWithEmailToRoute(cType: widget.cType),
//           ],
//         ),
//       ),
//       // 제출
//       bottomNavigationBar: AuthWithEmailSubmitButton(controllers: controllers, formKey: _formKey),
//     );
//   }
// }
