import 'dart:io';

import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/image/custom_image_provider.dart';
import 'package:biz_card_app/features/presentation/providers/wallet/wallet_provider.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/provider/notification_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class WalletMethod {
  final WidgetRef ref;

  WalletMethod(this.ref);

  Future<void> add(ControllerManager manager) async {
    try {
      // 카드 이미지 경로 불러오기
      final File? imagePath = await ref.read(customImageProvider);

      // Uid init
      final String uid = const Uuid().v4();

      print(imagePath);
      print(uid);
      // print(manager.controllers.company.text);

      // 데이터 만들기
      final OtherUserInfoModel newData = OtherUserInfoModel.fromController(imagePath, uid, manager);

      await ref.read(walletProvider.notifier).add(newData);
    } catch (e) {
      print(e);
      ref.read(notificationProvider.notifier).update('wallet.add 실패');
      rethrow;
    }
  }

  Future<void> edit(ControllerManager manager, String uid) async {
    try {
      // 카드 이미지 경로 불러오기
      final File? imagePath = await ref.read(customImageProvider);

      // 데이터 만들기
      final OtherUserInfoModel newData = OtherUserInfoModel.fromController(imagePath, uid, manager);

      await ref.read(walletProvider.notifier).edit(uid, newData);
    } catch (e) {
      print(e);
      ref.read(notificationProvider.notifier).update('wallet.edit 실패');
    }
  }

  Future<void> delete(String uid) async {
    await ref.read(walletProvider.notifier).delete(uid);
  }
}
