import 'package:biz_card_app/features/data/models/user/base_user_info_model.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodeService {
  static String _detail(BaseUserInfoModel userData) {
    final buffer = StringBuffer();

    buffer.write('com.sunshinemoongit.biz_card_app://open?');

    buffer.write('uid=${Uri.encodeComponent(userData.uid)}');
    buffer.write('&name=${Uri.encodeComponent(userData.name)}');
    buffer.write('&profileImage=${Uri.encodeComponent(userData.profileImage)}');
    buffer.write('&cardImage=${Uri.encodeComponent(userData.cardImage)}');
    buffer.write('&email=${Uri.encodeComponent(userData.email)}');
    buffer.write('&team=${Uri.encodeComponent(userData.team)}');
    buffer.write('&company=${Uri.encodeComponent(userData.company)}');
    buffer.write('&phone=${Uri.encodeComponent(userData.phone)}');
    buffer.write('&fax=${Uri.encodeComponent(userData.fax)}');
    buffer.write('&lastUpdate=${Uri.encodeComponent(userData.lastUpdate)}');
    buffer.write('&createdAt=${Uri.encodeComponent(userData.createdAt)}');
    // 나머지 필드들도 같은 방식으로 추가

    return buffer.toString();
  }

  static QrImage toQrCode(BaseUserInfoModel userData) {
    final QrCode qrCode = QrCode.fromData(
      data: _detail(userData),
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    return QrImage(qrCode);
  }
}
