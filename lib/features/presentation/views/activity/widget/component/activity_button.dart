import 'package:biz_card_app/shared/widgets/basic_asset_svg.dart';
import 'package:biz_card_app/shared/widgets/text/basic_text.dart';
import 'package:flutter/material.dart';

class ActivityButton extends StatelessWidget {
  const ActivityButton({
    super.key,
    required this.assetName,
    required this.desc,
    required this.onTap,
  });

  final String assetName;
  final String desc;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth * 0.12; // 화면 너비의 12%로 설정

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(screenWidth * 0.03), // 화면 너비의 3%로 패딩 설정
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BasicAssetSvg(item: assetName, size: iconSize),

            SizedBox(height: screenWidth * 0.02), // 화면 너비의 2%로 간격 설정
            BasicText(title: desc),
          ],
        ),
      ),
    );
  }
}
