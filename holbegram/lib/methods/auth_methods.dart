import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return "Please fill all the fields";
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } catch (e) {
      // Handle login failure
      return e.toString();
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return "Please fill all the fields";
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        Users users = Users(
          uid: user.uid,
          email: email,
          username: username,
          bio: '',
          photoUrl: '',
          followers: [],
          following: [],
          posts: [],
          saved: [],
          searchKey: '',
        );

        await _firestore.collection("users").doc(user.uid).set(users.toJson());
      }

      return "success";
    } catch (e) {
      // Handle signup failure
      return e.toString();
    }
  }

  Future<Users> getUserDetails() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await _firestore.collection("users").doc(user.uid).get();
        return Users.fromSnapshot(userDoc);
      }
      throw Exception("User not found");
    } catch (e) {
      // Handle error
      rethrow;
    }
  }

  loginUser({required String email, required String password}) {}
}