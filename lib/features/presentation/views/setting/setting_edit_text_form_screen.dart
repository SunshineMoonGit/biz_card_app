import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/class/setting_item/setting_item_model.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:biz_card_app/shared/widgets/sliver/basic_sliver_app_bar.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:biz_card_app/shared/widgets/text_form_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingEditTextFormScreen extends ConsumerStatefulWidget {
  static String get route => '/setting_edit_text_form';

  final SettingItemModel setting;

  const SettingEditTextFormScreen({
    super.key,
    required this.setting,
  });

  @override
  ConsumerState<SettingEditTextFormScreen> createState() => _EditSettingTextScreenState();
}

class _EditSettingTextScreenState extends ConsumerState<SettingEditTextFormScreen> {
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
    final MyUserInfoModel oldValue = ref.read(authInfoProvider);

    return BasicLayout(
      body: CustomScrollView(
        slivers: [
          const BasicSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimensions.ssPaddingHorizontal,
              child: CustomTextField(
                basicController: manager.controllers[0],
              ),
            ),
          ),
          _renderComplete(oldValue, ref),
        ],
      ),
    );
  }

  SliverToBoxAdapter _renderComplete(MyUserInfoModel oldValue, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: ElevatedButton(
          onPressed: () {
            // ref.read(authInfoProvider.notifier).update(
            //       oldValue.typeCopyWith(
            //         type: widget.setting.title,
            //         value: controller.text,
            //       ),
            //     );
            context.pop();
          },
          child: BasicText(
            title: AppString.modify,
            style: ref.textTheme.headlineSmall!,
            color: context.colorScheme.onSecondary,
          ),
        ),
      ),
    );
  }
}
