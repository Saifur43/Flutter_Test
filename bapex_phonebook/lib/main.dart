import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_test/widgets/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDyeh1Q6YP8k0MAvTSCV63iGC4WXGardow",
        authDomain: "flutter-firebase-test-81216.firebaseapp.com",
        projectId: "flutter-firebase-test-81216",
        storageBucket: "flutter-firebase-test-81216.appspot.com",
        messagingSenderId: "908511230845",
        appId: "1:908511230845:web:006d55c58fd8ee7b932a14",
        measurementId: "G-930987T9JF",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
