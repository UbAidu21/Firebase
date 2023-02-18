import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/provider/model/user_model.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  final _db = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel data) async {

    var id = DateTime.now();
    final docRef = _db.collection('Users_With_Provider').doc(id.toString());
    await docRef.set(data.toMap()).then((value) {
      Utilities().toastMessage('Data Uploaded');
    }).onError(
      (error, stackTrace) {
        Utilities().toastMessage(error.toString());
      },
    );
  }
}
