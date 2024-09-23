class KeySettingModel {
  final String updateTime;
  final List<String> favorites;
  final List<String> recent;

  KeySettingModel({
    required this.updateTime,
    required this.favorites,
    required this.recent,
  });

  factory KeySettingModel.fromJson(Map<String, dynamic> json) {
    return KeySettingModel(
      updateTime: json['updateTime'],
      favorites: json['favorites'],
      recent: json['recent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updateTime': updateTime,
      'favorites': favorites,
      'recent': recent,
    };
  }

  factory KeySettingModel.init() {
    return KeySettingModel(
      updateTime: DateTime.now().toIso8601String(),
      favorites: [],
      recent: [],
    );
  }

  KeySettingModel copyWith({
    String? updateTime,
    List<String>? favorites,
    List<String>? recent,
  }) {
    return KeySettingModel(
      updateTime: updateTime ?? this.updateTime,
      favorites: favorites ?? this.favorites,
      recent: recent ?? this.recent,
    );
  }
}
