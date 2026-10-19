import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Future launch(Uri url) async {
    try {
      await launchUrl(url);
    } catch (e) {
      debugPrint("error launch $e");
    }
  }
}
