import 'package:firebase_core/firebase_core.dart';

class FirebaseSingleton {
  static final FirebaseSingleton _instance = FirebaseSingleton._internal();

  factory FirebaseSingleton() {
    return _instance;
  }

  FirebaseSingleton._internal();

  static Future<void> initialize() async {
    try {
      // Ensure Firebase is initialized
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyA8U5iyPIm5BdioKK0u_ko_4SXn0Gc9-Ag",
              appId: "1:706250449687:ios:276de53a47919075968d52",
              messagingSenderId: "706250449687",
              projectId: "internshalaassignment-ac77a"));
      print("Firebase initialized successfully");
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }
}
