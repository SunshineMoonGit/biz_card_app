// import 'dart:io';

// import 'package:biz_card_app/config/app/app_enum.dart';
// import 'package:biz_card_app/config/app/app_string.dart';
// import 'package:biz_card_app/config/mapper/user_info_mapper.dart';
// import 'package:biz_card_app/shared/class/controller_manager.dart';
// import 'package:biz_card_app/shared/class/external_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserInfoModel {
//   final String uid;
//   final UserType userType;
//   final LoginType loginType;
//   final String name;
//   final String profileImage;
//   final String cardImage;
//   final String email;
//   final String team;
//   final String company;
//   final String phone;
//   final String fax;
//   final String lastUpdate;
//   final List<ExternalModel> external;
//   final String createdAt;
//   final String lastLoginAt;

//   UserInfoModel({
//     this.uid = '',
//     this.loginType = LoginType.email,
//     this.userType = UserType.normal,
//     this.name = '',
//     this.profileImage = '',
//     this.cardImage = '',
//     this.email = '',
//     this.team = '',
//     this.company = '',
//     this.phone = '',
//     this.fax = '',
//     this.lastUpdate = '',
//     this.external = const [],
//     this.createdAt = '',
//     this.lastLoginAt = '',
//   });

//   factory UserInfoModel.fromJson(Map<String, dynamic> json) {
//     return UserInfoMapper.fromJson(json);
//   }

//   Map<String, dynamic> toJson() {
//     return UserInfoMapper.toJson(this);
//   }

//   UserInfoModel copyWith({
//     String? uid,
//     UserType? userType,
//     LoginType? loginType,
//     String? name,
//     String? profileImage,
//     String? cardImage,
//     String? email,
//     String? team,
//     String? company,
//     String? phone,
//     String? fax,
//     String? lastUpdate,
//     List<ExternalModel>? external,
//     String? createdAt,
//     String? lastLoginAt,
//   }) {
//     return UserInfoModel(
//       uid: uid ?? this.uid,
//       userType: userType ?? this.userType,
//       loginType: loginType ?? this.loginType,
//       name: name ?? this.name,
//       profileImage: profileImage ?? this.profileImage,
//       cardImage: cardImage ?? this.cardImage,
//       email: email ?? this.email,
//       team: team ?? this.team,
//       company: company ?? this.company,
//       phone: phone ?? this.phone,
//       fax: fax ?? this.fax,
//       lastUpdate: lastUpdate ?? this.lastUpdate,
//       external: external ?? this.external,
//       createdAt: createdAt ?? this.createdAt,
//       lastLoginAt: lastLoginAt ?? this.lastLoginAt,
//     );
//   }

//   List get searchInfo => [name, email, company, team, phone, fax];

//   List<dynamic> get detailInfo => [
//         [AppString.email, email],
//         [AppString.phone, phone],
//         [AppString.fax, fax],
//       ];

//   factory UserInfoModel.fromUser(User user) {
//     return UserInfoMapper.fromUser(user);
//   }

//   @override
//   String toString() {
//     return 'UserInfoModel(uid: $uid, userType: $userType, loginType: $loginType, name: $name, profileImage: $profileImage, cardImage: $cardImage, email: $email, team: $team, company: $company, phone: $phone, fax: $fax, lastUpdate: $lastUpdate, external: $external, createdAt: $createdAt, lastLoginAt: $lastLoginAt)';
//   }

//   factory UserInfoModel.fromController(File? imagePath, String uid, ControllerManager controllers) {
//     return UserInfoMapper.fromController(imagePath, uid, controllers);
//   }
// }

// // 추가 메서드 정의
// extension UserInfoModelX on UserInfoModel {
//   UserInfoModel typeCopyWith({
//     required String type,
//     required String value,
//   }) {
//     switch (type) {
//       case AppString.name:
//         return copyWith(name: value);
//       case AppString.email:
//         return copyWith(email: value);
//       case AppString.team:
//         return copyWith(team: value);
//       case AppString.company:
//         return copyWith(company: value);
//       case AppString.phone:
//         return copyWith(phone: value);
//       case AppString.fax:
//         return copyWith(fax: value);
//       default:
//         return this;
//     }
//   }

//   UserInfoModel update({required UserInfoModel updateData}) {
//     return copyWith(
//       name: updateData.name,
//       profileImage: updateData.profileImage,
//       cardImage: updateData.cardImage,
//       email: updateData.email,
//       team: updateData.team,
//       company: updateData.company,
//       phone: updateData.phone,
//       fax: updateData.fax,
//       // followings: updateData.followings,
//       external: updateData.external,
//       lastUpdate: updateData.lastUpdate,
//     );
//   }
// }
