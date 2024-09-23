// import 'package:biz_card_app/config/app/app_enum.dart';
// import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
// import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
// import 'package:biz_card_app/features/presentation/providers/setting/setting_language_temp_provider.dart';
// import 'package:biz_card_app/features/presentation/views/setting/widget/setting_column_widget.dart';
// import 'package:biz_card_app/features/presentation/views/setting/widget/setting_row_widget.dart';
// import 'package:biz_card_app/features/presentation/views/setting/widget/setting_screen_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class SettingLanguageScreen extends ConsumerWidget {
//   static String get route => '/setting_language';

//   const SettingLanguageScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String languageTemp = ref.watch(settingLanguageTempProvider);
//     final CustomSettingModel settings = ref.watch(customSettingProvider)!;

//     return SettingScreenLayout(
//       appBarTitle: 'language',
//       bottomButtonToggle: false,
//       onBottomButtonTap: () {
//         ref.read(customSettingProvider.notifier).update(
//               settings.copyWith(language: languageTemp),
//             );
//       },
//       children: const [
//         SettingColumnWidget(
//           child: SettingRowWidget(type: SettingType.language),
//         ),
//       ],
//     );
//   }
// }
