import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
import 'package:biz_card_app/features/presentation/views/activity/edit/activity_edit_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_screen.dart';
import 'package:biz_card_app/features/presentation/views/viewer/qr_code_viewer_screen.dart';
import 'package:biz_card_app/shared/services/share/qr_code/qr_code_service.dart';
import 'package:biz_card_app/shared/widgets/button/basic_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileActionWidget extends ConsumerWidget {
  const ProfileActionWidget({
    super.key,
    required this.isMyProfile,
    required this.userData,
  });

  final bool isMyProfile;
  final UserInfoModel userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Widget> buttons = _getButtons(
      userData,
      isMyProfile,
      context,
      ref,
    );

    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: Row(children: buttons),
      ),
    );
  }

  List<Widget> _getButtons(UserInfoModel userData, bool isMyProfile, BuildContext context, WidgetRef ref) {
    // MyProfile
    if (isMyProfile) {
      return [
        Expanded(
          child: BasicButton(
            title: 'profile_edit',
            backgroundColor: context.colorScheme.surface,
            border: Border.all(color: context.colorScheme.outline),
            onTap: () => context.push(SettingScreen.route, extra: false),
          ),
        ),
        Dimensions.ssHorizontalSpaceMedium,
        Expanded(
          child: BasicButton(
            title: '공유하기',
            backgroundColor: context.colorScheme.surface,
            border: Border.all(color: context.colorScheme.outline),
            onTap: () => context.push(QrCodeViewerScreen.route, extra: QrCodeService.toQrCode(userData)),
          ),
        ),
      ];
    } else {
      // Other User Profile
      return [
        Expanded(
          child: BasicButton(
            title: 'profile_edit',
            backgroundColor: context.colorScheme.surface,
            border: Border.all(color: context.colorScheme.outline),
            onTap: () {
              context.push(ActivityEditScreen.route, extra: userData);
            },
          ),
        ),
        Dimensions.ssHorizontalSpaceMedium,
        Expanded(
          child: BasicButton(
            title: 'view_card',
            backgroundColor: context.colorScheme.surface,
            border: Border.all(color: context.colorScheme.outline),
            onTap: () {},
          ),
        ),
      ];
    }
  }
}
