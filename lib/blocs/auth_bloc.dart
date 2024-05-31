import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:interenshala_assignment/Services/auth_service.dart';

class AuthBloc {
  final authService = AuthService();
  final fb = FacebookLogin();
  Stream<FirebaseUSer> get currentUser => authService.currentUser;

  loginFacebook(){
    print("starting facebook login");
  }
}
