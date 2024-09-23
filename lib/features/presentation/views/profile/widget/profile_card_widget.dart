import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/config/ui/theme_extension.dart';
import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    required this.userData,
    super.key,
  });

  final UserInfoModel userData;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: Dimensions.ssPaddingAll,
        child: AspectRatio(
          aspectRatio: Dimensions.standardCardRatio,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: context.colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Text(userData.name[0], style: const TextStyle(fontSize: 32, color: Colors.black)),
                ),
                const SizedBox(height: 16),
                Text(userData.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(userData.company, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
                Text(userData.team, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
