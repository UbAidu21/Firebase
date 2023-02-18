import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/muti_page_sign_up/view/student_info.dart';
import 'package:firebase_2/muti_page_sign_up/view_model/student_view_model.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirebaseServicesData {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> uploadData(BuildContext context) async {
    final provider = Provider.of<StudentViewModel>(context, listen: false);

    final id = DateTime.now();
    final studentData = _db.collection('Students Data').doc(id.toString());

    studentData.set({
      'Name': '${provider.studentModel.fName} ${provider.studentModel.lName}',
      'Email': provider.studentModel.email,
      'Password': provider.studentModel.password,
      'Department': provider.studentModel.department,
      'Semester': provider.studentModel.semester,
      'Registration No.': provider.studentModel.regNo,
      'Contact': provider.studentModel.contact
    });
  }

  Future<void> regUser(BuildContext context) async {
    final provider = Provider.of<StudentViewModel>(context, listen: false);

    _auth
        .createUserWithEmailAndPassword(
            email: provider.studentModel.email!,
            password: provider.studentModel.password!)
        .then((value) {
      Utilities().toastMessage('Sign Up ');
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const StudentInfoView();
      }));
    }).onError((error, stackTrace) {
      Utilities().toastMessage(error.toString());
      return;
    });
  }
}
