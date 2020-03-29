import 'package:firebase_auth/firebase_auth.dart';

class FireUser {
  final FirebaseUser fUser;

  const FireUser(this.fUser);

  ///convert user fie
  Map<String, String> getUserDict() {
    return <String, String>{"email": fUser.email, "pic_url": fUser.photoUrl};
  }
}