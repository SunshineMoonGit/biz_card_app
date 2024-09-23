import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_app_bar_widget.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_bottom_modal_widget.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_input_card_widget.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_input_field_widget.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/widget/self/self_save_button_widget.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:flutter/material.dart';

class RegisterMyProfileScreen extends StatefulWidget {
  static String get route => '/register_my_profile';

  const RegisterMyProfileScreen({super.key});

  @override
  State<RegisterMyProfileScreen> createState() => _RegisterMyProfileScreenState();
}

class _RegisterMyProfileScreenState extends State<RegisterMyProfileScreen> {
  late final ControllerManager manager;

  @override
  void initState() {
    super.initState();
    manager = ControllerManager(type: ControllerType.register);
  }

  @override
  void dispose() {
    manager.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BasicLayout(
          body: CustomScrollView(
            slivers: [
              // 앱바
              const SelfAppBarWidget(isMyProfile: true),

              // 카드 입력란
              const SelfInputCardWidget(),

              // 기본 정보 입력란
              SelfInputFieldWidget(manager: manager, title: AppString.basicInfo),
            ],
          ),
          // 저장 버튼
          bottomNavigationBar: SelfSaveButtonWidget(manager: manager, isMyProfile: true),
        ),
        const SelfBottomModalWidget(),
      ],
    );
  }
}
