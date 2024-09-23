import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/shared/services/ss_print.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ExternalModel {
  final String platform;
  final String key;

  ExternalModel({
    required this.platform,
    required this.key,
  });

  factory ExternalModel.fromJson(Map<String, dynamic> json) {
    return ExternalModel(
      platform: json['platform'] as String,
      key: json['key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'platform': platform,
      'key': key,
    };
  }

  Future<void> launchApp() async {
    final urls = _getUrls();
    try {
      await launchUrlString(urls.nativeUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      ssPrint(e.toString(), 'ss_external_model');
      await launchUrlString(urls.webUrl, mode: LaunchMode.platformDefault);
    }
  }

  _UrlPair _getUrls() {
    switch (platform) {
      case AppSvg.instagram:
        return _UrlPair("instagram://user?username=$key", "https://www.instagram.com/$key");
      case AppSvg.youtube:
        return _UrlPair("youtube://$key", "https://www.youtube.com/@$key");
      case AppSvg.facebook:
        return _UrlPair("fb://profile/$key", "https://www.facebook.com/$key");
      case AppSvg.github:
        return _UrlPair("https://github.com/$key", "https://github.com/$key");
      case AppSvg.soundCloud:
        return _UrlPair("", "https://soundcloud.com/$key");
      case AppSvg.x:
        return _UrlPair("twitter://user?screen_name=$key", "https://twitter.com/$key");
      default:
        return _UrlPair(key, key);
    }
  }
}

class _UrlPair {
  final String nativeUrl;
  final String webUrl;

  _UrlPair(this.nativeUrl, this.webUrl);
}

List<String> platforms = [
  AppSvg.youtube,
  AppSvg.x,
  AppSvg.facebook,
  AppSvg.github,
  AppSvg.instagram,
  AppSvg.soundCloud,
];
