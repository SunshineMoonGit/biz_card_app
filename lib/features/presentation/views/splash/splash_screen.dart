import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:biz_card_app/shared/widgets/text/custom_logo_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static String get route => '/splash';

  final bool settingUpdate;

  const SplashScreen({
    super.key,
    this.settingUpdate = false,
  });

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppMethod(ref).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const BasicLayout(
      body: Center(
        child: CustomLogoText(),
      ),
    );
  }
}
