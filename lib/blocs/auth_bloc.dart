import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../services/auth.dart';

class AuthBloc {
  final authService = AuthService();
  final googleSignin = GoogleSignIn(scopes: ['email']);
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  Stream<User> get currentUserChange => authService.currentUserChange;
  
  User get currentUser => authService.getCurrentUser();

  loginGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await googleSignin.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      //Firebase Sign in
      final result = await authService.singnInWithCredential(credential);

      print('${result.user.displayName}');
    } catch (error) {
      print(error);
    }
  }

  Future<void> loginFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        AuthCredential credential =
            FacebookAuthProvider.credential(accessToken.token);
        final a = await authService.singnInWithCredential(credential);
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        break;
      default:
        //print('ERRORRRRRRRRRRRRRRRRRRRRRRRRRRRR');
    }
  }

  logout() {
    authService.logOut();
    googleSignin.signOut();
  }

  Future<Null> _logOut() async {
    authService.logOut();
    await facebookSignIn.logOut();
  }
}
