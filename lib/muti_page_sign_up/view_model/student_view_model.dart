import 'package:firebase_2/muti_page_sign_up/model/student_model.dart';
import 'package:flutter/material.dart';

class StudentViewModel with ChangeNotifier {
  final StudentModel _studentModel = StudentModel();

  StudentModel get studentModel => _studentModel;

  void updateName(String firstName, String lastName) {
    _studentModel.fName = firstName;
    _studentModel.lName = lastName;
    notifyListeners();
  }

  void updateEmailPassword(String email, String password) {
    _studentModel.email = email;
    _studentModel.password = password;
    notifyListeners();
  }

  void updateStudentInfo(String department, String semester, String regNo) {
    _studentModel.regNo = regNo;
    _studentModel.department = regNo;
    _studentModel.semester = semester;
    notifyListeners();
  }

  void updateContact(String contact) {
    _studentModel.contact = contact;
    notifyListeners();
  }

  // final ControllersFields controllers =ControllersFields();
}
