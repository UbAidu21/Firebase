import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_2/muti_page_sign_up/view/contact_view.dart';
import 'package:firebase_2/muti_page_sign_up/view/student_info.dart';
import 'package:firebase_2/muti_page_sign_up/view_model/student_view_model.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentInfoView extends StatefulWidget {
  const StudentInfoView({super.key});

  @override
  State<StudentInfoView> createState() => _StudentInfoViewState();
}

class _StudentInfoViewState extends State<StudentInfoView> {
  //Controllers
  final regNoController = TextEditingController();
  final departmentController = TextEditingController();
  final semesterController = TextEditingController();

  //Loading
  ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: regNoController,
              hint: '2020-Fu.Cs-02',
              label: 'Registration No.',
            ),
            fixheight,
            CustomTextField(
              controller: departmentController,
              hint: 'e.g. Computer Science',
              label: 'Department',
            ),
            fixheight,
            CustomTextField(
              controller: semesterController,
              hint: 'e.g.4th 5th',
              label: 'Semester',
            ),
            fixheight,
            fixheight,
            ValueListenableBuilder(
              valueListenable: _loading,
              builder: (context, value, child) {
                return AppButton(
                  text: 'Next',
                  height: 60,
                  borderRadius: 30,
                  loading: _loading.value,
                  onPressed: () {
                    _loading.value = true;
                    if (regNoController.text == null ||
                        regNoController.text.isEmpty) {
                          _loading.value = false;
                      Utilities().toastMessage('Enter Registration No.');
                    } else if (departmentController.text == null ||
                        departmentController.text.isEmpty) {
                      Utilities().toastMessage('Enter Department');
                      _loading.value = false;
                    } else {
                      _loading.value = false;
                      provider.updateStudentInfo(departmentController.text,
                          semesterController.text, regNoController.text);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ContactView();
                      }));
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
