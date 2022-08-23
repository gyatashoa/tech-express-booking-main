// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../Home/Homepage.dart';
import '../Models/users.dart';

class Auth {
  UserModel userModel = UserModel();

  //firebase initializing
  static Future<FirebaseApp> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  //creating account
  void updateAccount(String username, String number, String uid) async {
    if (FirebaseAuth.instance.currentUser != null) {
      Future.wait([
        FirebaseAuth.instance.currentUser!.updateDisplayName(username),
        FirebaseAuth.instance.currentUser!.updatePhotoURL(number)
      ]);
    }

    // _updatePhoneNumber(uid, number);
  }

  //SignUp
  Future signUpAuth(
    BuildContext context,
    GlobalKey<FormState> keyForm,
    String username,
    String email,
    String number,
    String pass,
  ) async {
    if (keyForm.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: pass)
            .then((uid) {
          updateAccount(username, number, uid.user!.uid);
        });
        await AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Account Created',
          desc: 'Account Successfully Created',
          btnOkOnPress: () {},
        ).show().then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const Homepage()),
            (route) => false));
      } on FirebaseAuthException catch (e) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Invalid Authentication',
          desc: '${e.message}',
          btnOkOnPress: () {},
        ).show();
      } on Exception {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Invalid Authentication',
          desc: 'Error creating account',
          btnOkOnPress: () {},
        ).show();
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Invalid Form',
        desc: 'Please enter invalid data into the fields',
        btnOkOnPress: () {},
      ).show();
    }
  }

  //loggging In
  loginAuth(BuildContext context, GlobalKey<FormState> keyForm, String email,
      String pass) async {
    if (keyForm.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass)
            .then((value) => {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Homepage(),
                      ))
                });
      } on FirebaseAuthException catch (e) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Invalid Authentication',
          desc: '${e.message}',
          btnOkOnPress: () {},
        ).show();
      } on Exception {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Invalid Authentication',
          desc: 'Error logging in',
          btnOkOnPress: () {},
        ).show();
      }
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Invalid Form',
        desc: 'Please enter invalid data into the fields',
        btnOkOnPress: () {},
      ).show();
    }
  }

  //google signIn

  //check user availability
  static void checkSignedIn(BuildContext context) {
    Auth.initializeFirebase();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Homepage()));
    }
  }

  //password reset
  static void resetPassword(BuildContext context, String email) {
    final auth = FirebaseAuth.instance;
    auth.sendPasswordResetEmail(email: email);
  }

  //signout user
  static Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
