import 'package:biz_card_app/config/app/app_enum.dart';

class CustomSettingModel {
  final ThemeType theme;
  final String language;
  final bool notificationsEnabled;

  CustomSettingModel({
    required this.theme,
    required this.language,
    required this.notificationsEnabled,
  });

  factory CustomSettingModel.fromJson(Map<String, dynamic> json) {
    return CustomSettingModel(
      theme: ThemeType.values.byName(json['theme']),
      language: json['language'],
      notificationsEnabled: json['notificationsEnabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme.name,
      'language': language,
      'notificationsEnabled': notificationsEnabled,
    };
  }

  factory CustomSettingModel.init(String language) {
    return CustomSettingModel(
      language: language,
      theme: ThemeType.light,
      notificationsEnabled: true,
    );
  }

  CustomSettingModel copyWith({
    ThemeType? theme,
    String? language,
    bool? notificationsEnabled,
  }) {
    return CustomSettingModel(
      theme: theme ?? this.theme,
      language: language ?? this.language,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }

  @override
  String toString() {
    return 'CustomSettingModel(theme: $theme, language: $language, notificationsEnabled: $notificationsEnabled)';
  }
}
