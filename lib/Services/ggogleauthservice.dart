import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// import 'package:google_sign_in/google_sign_in.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _googleSignIn = GoogleSignIn(scopes: ['dhanashrishisode17@gmail.com']);

  void signIn() async {
    print('pavan sisode');
    try {
      await _googleSignIn.signIn();
      print('Signed in successfully, handle the result as needed');
    } catch (error) {
      print('Error signing in: $error');
    }
  }

   signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
   }

  

  @override
  Widget build(BuildContext context) {
    signIn();
    return const Text("Welcome to Google");
  }
}
