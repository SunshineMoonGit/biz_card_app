import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/shared/class/external_model.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ProfileExternalWidget extends ConsumerWidget {
  const ProfileExternalWidget({
    super.key,
    required this.external,
    required this.isMyProfile,
  });

  final List<ExternalModel> external;
  final bool isMyProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.surface,
            borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
            border: Border.all(color: context.colorScheme.outline),
          ),
          padding: Dimensions.ssPaddingAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BasicText(
                    title: AppString.external,
                    style: ref.textTheme.bodyLarge!,
                    color: context.colorScheme.onBackground,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (external.isEmpty)
                const BasicText(
                  title: '해당 유저가\n연결한 링크가 없습니다.',
                ),
              if (external.isNotEmpty)
                Builder(
                  builder: (context) {
                    int itemCount = external.length; // 예시 아이템 개수
                    double itemWidth = 100; // 각 아이템의 너비
                    double itemHeight = 100; // 각 아이템의 높이
                    double spacing = 10; // 아이템 간의 간격

                    int crossAxisCount = (MediaQuery.of(context).size.width / (itemWidth + spacing)).floor();
                    double gridHeight = (itemHeight + spacing) * ((itemCount / crossAxisCount).ceil());

                    return SizedBox(
                      height: gridHeight,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: itemWidth + spacing,
                          mainAxisSpacing: spacing,
                          crossAxisSpacing: spacing,
                          childAspectRatio: itemWidth / itemHeight,
                        ),
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          // ExternalModel data = ExternalModel.renderPlatform(external[index]);
                          return GestureDetector(
                            // onTap: () => data.onTap!(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.ssBorderRadiusMedium),
                                color: Colors.white,
                              ),
                              width: 20,
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: SvgPicture.asset(
                                  height: 5,
                                  width: 5,
                                  AppSvg.getSvgPlatform(external[index].platform),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
