import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  ///Sign in user and return the user
  Future<FirebaseUser> _signInUser() async {
    try {
      GoogleSignInAccount account = await _googleSignIn.signIn();
      GoogleSignInAuthentication _googleSignInAuthentication =
      await account.authentication;

      AuthCredential _credentials = GoogleAuthProvider.getCredential(
          idToken: _googleSignInAuthentication.idToken,
          accessToken: _googleSignInAuthentication.accessToken);

      AuthResult _result = await _auth.signInWithCredential(_credentials);
      print("auth working");
      return _result.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  ///getters for functions
  Future<FirebaseUser> get signInUser async =>await _signInUser();
}