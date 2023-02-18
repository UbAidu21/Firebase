import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_2/muti_page_sign_up/view/email_password_view.dart';
import 'package:firebase_2/muti_page_sign_up/view_model/student_view_model.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NameView extends StatefulWidget {
  const NameView({super.key});

  @override
  State<NameView> createState() => _NameViewState();
}

class _NameViewState extends State<NameView> {
  //Controllers
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentViewModel>(context,listen: false);
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
              controller: firstNameController,
              hint: 'First Name',
              label: 'First Name',
            ),
            fixheight,
            CustomTextField(
              controller: lastNameController,
              hint: 'Last Name',
              label: 'Last Name',
            ),
            fixheight,
            fixheight,
            AppButton(
              text: 'Next',
              height: 60,
              borderRadius: 30,
              onPressed: () {
                if (firstNameController.text == null ||
                    firstNameController.text.isEmpty) {
                  Utilities().toastMessage('Enter First Name');
                } else if (lastNameController.text == null ||
                    lastNameController.text.isEmpty) {
                  Utilities().toastMessage('Enter Last Name');
                } else {
                  provider.updateName(
                      firstNameController.text, lastNameController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const EmailPasswordView();
                  }));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
