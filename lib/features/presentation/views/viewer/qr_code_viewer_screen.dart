import 'package:biz_card_app/config/ui/app_dimensions.dart';
import 'package:biz_card_app/shared/widgets/basic_layout.dart';
import 'package:biz_card_app/shared/widgets/sliver/basic_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeViewerScreen extends StatelessWidget {
  static String get route => '/qr_code_viewer';

  const QrCodeViewerScreen({
    super.key,
    required this.qrImage,
  });

  final QrImage qrImage;

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      body: CustomScrollView(
        slivers: [
          const BasicSliverAppBar(),
          SliverToBoxAdapter(
            child: Padding(
              padding: Dimensions.ssPaddingAll,
              child: PrettyQrView(
                qrImage: qrImage,
                decoration: const PrettyQrDecoration(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
