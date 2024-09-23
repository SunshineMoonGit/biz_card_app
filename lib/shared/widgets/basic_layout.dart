import 'package:biz_card_app/config/ui/theme/custom_system_ui.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/provider/notification_provider.dart';
import 'package:biz_card_app/shared/widgets/notification/custom_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicLayout extends ConsumerWidget {
  const BasicLayout({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorMessage = ref.watch(notificationProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (errorMessage != null) {
        customNotification(context, errorMessage);
        ref.read(notificationProvider.notifier).clear();
      }
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: CustomSystemUI.getSystemUIOverlayStyle(context.colorScheme.background),
        child: Scaffold(
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          body: SafeArea(
            top: true,
            bottom: false,
            child: body,
          ),
        ),
      ),
    );
  }
}
