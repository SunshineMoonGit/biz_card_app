import 'dart:io';

import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/image/custom_image_provider.dart';
import 'package:biz_card_app/shared/provider/modal/modal_toggle_provider.dart';
import 'package:biz_card_app/shared/widgets/card/basic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelfInputCardWidget extends ConsumerWidget {
  const SelfInputCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final File? cardImagePath = ref.watch(customImageProvider);

    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: GestureDetector(
          onTap: () {},
          child: BasicCard(
            color: context.colorScheme.shadow,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
              child: _renderBusinessCardImage(
                onTap: () => ref.read(modalToggleProvider.notifier).show(),
                cardImgUrl: cardImagePath,
                addIconColor: context.colorScheme.onSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderBusinessCardImage({
    required Function()? onTap,
    required File? cardImgUrl,
    required Color addIconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: cardImgUrl != null
          ? Image.file(
              cardImgUrl,
              fit: BoxFit.cover,
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Dimensions.ssBorderRadiusMedium,
                ),
              ),
              child: Center(
                child: Icon(Icons.add, color: addIconColor),
              ),
            ),
    );
  }
}
