import '../utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;
  final _firebaseStore = FirebaseFirestore.instance;

  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;
  signInWithGoogle(BuildContext context) async {
    bool res = false;
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          _firebaseStore.collection('user').doc(user.uid).set({
            'username': user.displayName,
            'userImage': user.photoURL,
            'uid': user.uid,
          });
        } else {}
        res = true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      res = false;
    }
    return res;
  }

  signOut() async {
    await _auth.signOut();
  }
}
