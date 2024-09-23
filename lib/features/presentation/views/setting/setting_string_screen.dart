import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/features/presentation/views/setting/widget/setting_screen_layout.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/string_setting_item_model.dart';
import 'package:biz_card_app/shared/widgets/text_form_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingStringScreen extends ConsumerStatefulWidget {
  static String get route => '/setting_string';

  const SettingStringScreen({super.key, required this.setting});

  final StringSettingItemModel setting;

  @override
  ConsumerState<SettingStringScreen> createState() => _SettingStringScreenState();
}

class _SettingStringScreenState extends ConsumerState<SettingStringScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ControllerManager manager;

  @override
  void initState() {
    super.initState();
    manager = ControllerManager(type: ControllerType.edit);
  }

  @override
  void dispose() {
    manager.disposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingScreenLayout(
      bottomButtonToggle: false,
      children: [
        SliverToBoxAdapter(
          child: Padding(
            padding: Dimensions.ssPaddingHorizontal,
            child: CustomTextField(basicController: manager.controllers[0]),
          ),
        ),
      ],
    );
  }
}
