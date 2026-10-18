import 'package:package_info_plus/package_info_plus.dart';

class GlobalServices {
  static String _appVersion = "";
  static String get appVersion => _appVersion;
  static Future<void> getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _appVersion = packageInfo.version;
    } catch (e) {
      print("App version error $e");
    }
  }
}
