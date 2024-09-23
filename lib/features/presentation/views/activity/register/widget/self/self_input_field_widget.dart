import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:biz_card_app/shared/widgets/text_form_field/custom_text_field.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfInputFieldWidget extends ConsumerWidget {
  const SelfInputFieldWidget({
    super.key,
    required this.manager,
    required this.title,
  });

  final ControllerManager manager;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _RenderTitle(title: title),
          _RenderTextField(manager: manager),
        ],
      ),
    );
  }
}

class _RenderTitle extends ConsumerWidget {
  const _RenderTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: Dimensions.ssPaddingHorizontal,
      child: BasicText(
        title: title,
        style: ref.textTheme.headlineMedium!,
        color: context.colorScheme.onBackground,
      ),
    );
  }
}

class _RenderTextField extends ConsumerWidget {
  const _RenderTextField({required this.manager});

  final ControllerManager manager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: List.generate(
        manager.controllers.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BasicText(
                  title: manager.controllers[index].name,
                  style: ref.textTheme.bodySmall!,
                  color: context.colorScheme.onBackground,
                ),
                Dimensions.ssVerticalSpaceSmall,
                CustomTextField(
                  basicController: manager.controllers[index],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
