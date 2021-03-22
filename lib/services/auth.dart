import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {
  
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> singnInWithCredential(AuthCredential credential) => auth.signInWithCredential(credential);
  Future<void> logOut() => auth.signOut();
  Stream<User> get currentUser => auth.authStateChanges();
  final googleSignin = GoogleSignIn(scopes: ['email']);
}