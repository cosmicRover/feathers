
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feathers/services/fire_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDServices{
  final FirebaseUser user;

  CRUDServices(this.user);

  final CollectionReference _userCollectionRef = Firestore.instance.collection("users");

  ///add a user to fireStore using FireUser model
  Future<void> _addNewUser() async {
    FireUser _user = FireUser(user);
    await _userCollectionRef
        .document("${user.email}")
        .setData(_user.getUserDict());
  }

  ///getters for functions
  Future<void> get addNewUser async => await _addNewUser();
}