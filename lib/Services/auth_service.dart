
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';


import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
 final _auth = FirebaseAuth.instance;

  Stream<FirebaseUSer> get  _currentUser => _auth.onAuthStateChanged;
  Future<AuthResult> signInWithCredential(AuthCredential credential) => _auth.signInWithCredential(credential);

  Future<void> logout() => _auth.signOut();
  
}



  // Google sign in
  // signInWithGoogle() async {
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: gAuth.accessToken, idToken: gAuth.idToken);
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  // Future<dynamic> signIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on Exception catch (e) {
  //     // TODO
  //     print('exception->$e');
  //   }
  // }

