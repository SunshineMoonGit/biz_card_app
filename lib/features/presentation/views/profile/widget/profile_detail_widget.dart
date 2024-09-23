import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/custom_container_with_title.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileDetailWidget extends ConsumerWidget {
  const ProfileDetailWidget({
    super.key,
    required this.userData,
  });

  final UserInfoModel userData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: CustomContainerWithTitle(
        title: 'detail_info',
        child: Container(
          padding: Dimensions.ssPaddingAll,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
            border: Border.all(color: context.colorScheme.outline),
            color: context.colorScheme.surface,
          ),
          child: Column(
            children: userData.detailInfo
                .map(
                  (e) => Padding(
                    padding: Dimensions.ssPaddingVerticalSmall,
                    child: Row(
                      children: [
                        BasicAssetSvg(item: AppSvg.getSvgName(e[0]), size: 24),
                        Dimensions.ssHorizontalSpaceMedium,
                        BasicText(title: e[1]),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
