import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_2/muti_page_sign_up/utils/firebase/firebase_firestore.dart';
import 'package:firebase_2/muti_page_sign_up/view_model/student_view_model.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailPasswordView extends StatefulWidget {
  const EmailPasswordView({super.key});

  @override
  State<EmailPasswordView> createState() => _EmailPasswordViewState();
}

class _EmailPasswordViewState extends State<EmailPasswordView> {
  //Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firebaseServicesData = FirebaseServicesData();

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
              controller: emailController,
              hint: 'Email',
              label: 'Email',
            ),
            fixheight,
            CustomTextField(
              controller: passwordController,
              hint: 'Password',
              label: 'Password',
            ),
            fixheight,
            fixheight,
            AppButton(
              text: 'Next',
              height: 60,
              borderRadius: 30,
              onPressed: () {
                // ignore: unnecessary_null_comparison
                if (emailController.text == null ||
                    emailController.text.isEmpty) {
                  Utilities().toastMessage('Enter Email');
                  // ignore: unnecessary_null_comparison
                } else if (passwordController.text == null ||
                    passwordController.text.isEmpty) {
                  Utilities().toastMessage('Enter Password');
                } else {

                  //Save Data to 
                    provider.updateEmailPassword(
                        emailController.text.toString(), passwordController.text.toString());

                  firebaseServicesData.regUser(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
