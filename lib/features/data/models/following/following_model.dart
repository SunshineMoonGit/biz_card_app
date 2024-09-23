// import 'package:biz_card_app/features/data/models/user/user_info_model.dart';

// class FollowingModel {
//   final UserInfoModel user;
//   final bool isLinked;

//   FollowingModel({
//     required this.user,
//     this.isLinked = false,
//   });

//   factory FollowingModel.fromJson(Map<String, dynamic> json) {
//     return FollowingModel(
//       user: UserInfoModel.fromJson(json['user']),
//       isLinked: json['isLinked'] ?? false,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'user': user.toJson(),
//       'isLinked': isLinked,
//     };
//   }

//   FollowingModel copyWith({
//     UserInfoModel? user,
//     bool? isLinked,
//   }) {
//     return FollowingModel(
//       user: user ?? this.user,
//       isLinked: isLinked ?? this.isLinked,
//     );
//   }

//   @override
//   String toString() {
//     return 'FollowingModel(user: ${user.toString()}, isLinked: $isLinked)';
//   }
// }
