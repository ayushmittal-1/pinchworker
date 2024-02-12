import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:easy_vahan/common/data_store.dart';
import 'package:easy_vahan/models/user.dart';

class AuthRepo {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  late DataStore store;

  AuthRepo({required this.store});

  Future<UserModel?> getUserById(String uid) async {
    var user = await _firebaseFirestore.collection('users').doc(uid).get();

    UserModel userMod = UserModel(
      uid: user['uid'],
      email: user['email'],
      name: user['name'],
    );

    return userMod;
  }

  Future<UserModel?> _userFromFirebase({required auth.User? user}) async {
    if (user == null) {
      return null;
    }
    UserModel? userMod = await getUserById(user.uid);

    return userMod;
  }

  Future<UserModel?> signInWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );

    if (!credential.user!.emailVerified) {
      signOut();
      throw FirebaseAuthException(code: 'unverified-email');
    }

    return _userFromFirebase(user: credential.user);
  }

  Future<UserModel?> createUserWithEmailAndPassword({
    String? name,
    String? email,
    String? password,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    // credential.user!.sendEmailVerification();

    return UserModel(
      uid: credential.user!.uid,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    store.delete(key: 'uid');
    store.delete(key: 'loggedIn');
  }
}
