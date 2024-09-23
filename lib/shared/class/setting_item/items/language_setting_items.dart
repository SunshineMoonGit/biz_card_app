part of '../setting_item_model.dart';

class LanguageSettingItems {
  final BuildContext context;
  final WidgetRef ref;

  LanguageSettingItems(this.context, this.ref);

  List<SettingItemModel> get items {
    // 여기에 메인 설정 항목들을 구현합니다.

    return [
      _shortCut(AppString.en),
      _shortCut(AppString.ko),
    ];
  }

  SettingItemModel _shortCut(String language) {
    return SettingItemModel(
      title: language,
      onTap: (_) => AppMethod(ref).theme.changeLanguage(language),
      value: ref.watch(customSettingProvider).language == language,
      rowType: InputType.select,
    );
  }
}
