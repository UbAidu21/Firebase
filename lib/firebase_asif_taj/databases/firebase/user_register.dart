import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class UserAuth {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> userSignup(String email, String password) async {
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {})
        .onError((error, stackTrace) {});
  }

  Future<void> userLogin(
      BuildContext context, String email, String password) async {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      Utilities().toastMessage(error.toString());
    });
  }

  Future<void> userData(String fullName, String email, String contact,
      String password, BuildContext context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    firebaseFirestore.collection('Users').doc(DateTime.now().toString()).set({
      'Name': fullName,
      'Email': email,
      'Number': contact,
      'Password': password
    }).then((value) {
      // loading;
      Navigator.pop(context);

      Fluttertoast.showToast(msg: 'Data Added Succefully');
    }).onError((error, stackTrace) {
      // loading;
      
      Fluttertoast.showToast(msg: error.toString());
    });
  }
}
