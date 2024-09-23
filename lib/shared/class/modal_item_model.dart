import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/shared/provider/modal/modal_toggle_provider.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ModalItemModel {
  ModalItemModel({
    required this.icon,
    required this.title,
    required this.onTap,
    this.userType = UserType.normal,
  });

  final String icon;
  final String title;
  final void Function() onTap;
  final UserType userType;

  static Widget transWidget(
      ModalItemModel item, UserType userType, int index, int length, WidgetRef ref, BuildContext context) {
    final bool isPremium = userType.index >= item.userType.index;

    final bool isFirst = index == 0;
    final bool isLast = index == length;

    BorderRadiusGeometry borderRadius = _getBorderRadius(isFirst, isLast);

    return Expanded(
      child: InkWell(
        onTap: () {
          ref.read(modalToggleProvider.notifier).hide();
          item.onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: context.colorScheme.surface.withOpacity(isPremium ? 1 : .5),
          ),
          child: Row(
            children: [
              if (isPremium)
                Padding(
                  padding: Dimensions.ssPaddingHorizontal,
                  child: BasicAssetSvg(
                    item: item.icon,
                    color: Colors.black,
                  ),
                ),
              if (!isPremium)
                Padding(
                  padding: Dimensions.ssPaddingHorizontal,
                  child: BasicAssetSvg(
                    item: AppSvg.getSvgName(AppSvg.lock),
                    color: Colors.black,
                  ),
                ),
              BasicText(
                title: item.title,
              ),
              if (!isPremium)
                BasicText(
                  title: 'For Premium User',
                  color: context.colorScheme.onSurface,
                ),
            ],
          ),
        ),
      ),
    );
  }

  static BorderRadiusGeometry _getBorderRadius(bool isFirst, bool isLast) {
    if (isFirst && isLast) {
      return BorderRadius.circular(Dimensions.ssBorderRadiusMedium);
    } else if (isFirst) {
      return BorderRadius.vertical(top: Radius.circular(Dimensions.ssBorderRadiusMedium));
    } else if (isLast) {
      return BorderRadius.vertical(bottom: Radius.circular(Dimensions.ssBorderRadiusMedium));
    } else {
      return BorderRadius.zero;
    }
  }
}
