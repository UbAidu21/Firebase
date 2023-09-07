import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/with_mvvm/google_home.dart';
import 'package:firebase_2/with_mvvm/login_view_mvvm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleServices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void handleGoogleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final FirebaseFirestore _db = FirebaseFirestore.instance;

      User user = userCredential.user!;

      await _db.collection('Google Users').doc(userCredential.user!.uid).set(
        {
          'Email': userCredential.user!.email,
          'Name': userCredential.user!.displayName,
          'Picture': userCredential.user!.photoURL,
        },
      ).then((value) {
        Utilities().toastMessage('Sign in Succefully');
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return GoogleHomeScreen(
            user: user,
          );
        }));
      }).onError((error, stackTrace) {
        Utilities().toastMessage('$error');
        print(error);
      });
    } catch (e) {
      Utilities().toastMessage('$e');
      print(e);
    }
  }

  void handleGoogleSignOut(BuildContext context) async {
    try {
      googleSignIn.disconnect().then((value) {
        googleSignIn.signOut().then((value) {
          _auth.signOut();
        }).then((value) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const LoginViewMvvm();
          }));
        });
      }).onError((error, stackTrace) {
        Utilities().toastMessage(error.toString());
      });
    } on Exception catch (e) {
      return Utilities().toastMessage(e.toString());
    }
  }
}
