import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class FirebaseApp {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }
}
