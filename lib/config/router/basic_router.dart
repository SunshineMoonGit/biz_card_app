import 'dart:io';

import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/features/data/models/user/base_user_info_model.dart';
import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_state_provider.dart';
import 'package:biz_card_app/features/presentation/views/activity/edit/activity_edit_screen.dart';
import 'package:biz_card_app/features/presentation/views/activity/edit/edit_my_profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/register_my_profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/register_other_profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/activity/register/register_self_screen.dart';
import 'package:biz_card_app/features/presentation/views/home/home_screen.dart';
import 'package:biz_card_app/features/presentation/views/profile/profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/viewer/image_viewer_screen.dart';
import 'package:biz_card_app/features/presentation/views/login/auth_with_email_screen.dart';
import 'package:biz_card_app/features/presentation/views/login/sign_in_with_email_screen.dart';
import 'package:biz_card_app/features/presentation/views/login/sign_up_with_email_screen.dart';
import 'package:biz_card_app/features/presentation/views/login_select/auth_select_screen.dart';
import 'package:biz_card_app/features/presentation/views/profile/auth_profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/profile/user_profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/search/search_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_auth_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_display_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_edit_text_form_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_language_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_profile_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_string_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_select_screen.dart';
import 'package:biz_card_app/features/presentation/views/splash/splash_screen.dart';
import 'package:biz_card_app/features/presentation/views/viewer/qr_code_viewer_screen.dart';
import 'package:biz_card_app/shared/class/setting_item/setting_item_model.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/select_setting_item_model.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/string_setting_item_model.dart';
import 'package:biz_card_app/shared/provider/controller_provider.dart';
import 'package:biz_card_app/shared/services/ss_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

part 'router_observer.dart';
part 'router_redirect.dart';
part 'router_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final redirectProvider = _RedirectNotifier(ref);

  return GoRouter(
    initialLocation: SplashScreen.route,
    routes: _routes,
    redirect: redirectProvider._redirectLogic,
    refreshListenable: redirectProvider,
    observers: [GoRouterObserver(ref)],
  );
});
