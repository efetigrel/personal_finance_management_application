import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;

  Future<String?> forgotPassword(String email) async {
    String? res;
    try {
      final result = await firebaseAuth.sendPasswordResetEmail(email: email);
      print("Check your mailbox");
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        res = "Mail Already Registered.";
      }
    }
    return null;
  }

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          res = "User Not Found";
          break;
        case "wrong-password":
          res = "Wrong Password";
          break;
        case "user-disabled":
          res = "User Disabled";
          break;
        default:
          res = "An error was encountered, please try again in a moment.";
          break;
      }
    }
    return res;
  }

  Future<String?> signUp(String email, String fullname, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      try {
        await firebaseFirestore.collection("Users").doc(result.user!.uid).set({
          "email": email,
          "fullname": fullname,
        });
        res = "success";
      } catch (e) {
        print("Firestore Error: $e");
        res = "An error occurred while saving user data.";
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "Mail Already Registered.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Invalid Mail";
          break;
        default:
          res = "An error was encountered, please try again in a moment.";
          break;
      }
    }
    return res;
  }
}
