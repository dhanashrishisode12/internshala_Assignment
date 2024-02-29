import 'package:flutter/material.dart';
import 'package:interenshala_assignment/OnBoardingPages/onboarding_screen.dart';
import 'package:interenshala_assignment/Pages/forgot_password.dart';
import 'package:interenshala_assignment/Pages/login.dart';
import 'package:interenshala_assignment/singleton.dart';

void main() async {
  //no binding has yet been initialized, the [WidgetsFlutterBinding]
  // class is used to create and initialize one.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase using the singleton class
  await FirebaseSingleton.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AssignMent",
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}
