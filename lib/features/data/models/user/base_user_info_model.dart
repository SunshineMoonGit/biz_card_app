import 'package:biz_card_app/shared/class/external_model.dart';

abstract class BaseUserInfoModel {
  String get uid;
  String get name;
  String get profileImage;
  String get cardImage;
  String get email;
  String get team;
  String get company;
  String get phone;
  String get fax;
  List<ExternalModel> get external;
  String get lastUpdate;
  String get createdAt;
}
