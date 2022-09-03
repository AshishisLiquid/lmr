import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signUpWithEmailandPassword(
      String email, String password, String displayname) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  // Future<User> signInWithEmailAndPassword(String email, String password) async {
  //   UserCredential result =
  //       await auth.signInWithEmailAndPassword(email: email, password: password);
  //   final User user = result.user!;

  //   return user;
  // }

  Future<String> signInWithEmailAndPassword(String email, String password) async {
  // ignore: unused_local_variable
  User? user;
  String? errorMessage;
  
  try {
    UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
    user = result.user;
  } on FirebaseAuthException catch (e) {
    errorMessage = e.message;
  }

  // ignore: unnecessary_null_comparison
  if(errorMessage != null){
    return Future.error(errorMessage);
  }
  return user!.uid;
}

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      log(e.message!);
    }
  }
}
