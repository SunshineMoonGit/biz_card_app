class BasicMapper {
  static T? enumFromJson<T extends Enum>(String value, List<T> enumValues) {
    return enumValues.firstWhere((e) => e.toString().split('.').last == value,
        orElse: () => enumValues.firstWhere((e) => false));
  }

  static String? enumToJson(Enum value) {
    return value.toString().split('.').last;
  }

  static String stringFromJson(String? value) {
    return value ?? '';
  }

  static String stringToJson(String? value) {
    return value ?? '';
  }
}
