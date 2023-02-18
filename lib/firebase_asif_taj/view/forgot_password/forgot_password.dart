import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppText(text: 'Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              hint: 'Email',
              label: 'Email',
            ),
            fixheight,
            AppButton(
              text: 'Continue',
              height: 60,
              borderRadius: 30,
              onPressed: () {
                auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                  Utilities().toastMessage('We have sent you email to recover your password, Please Check email');
                }).onError((error, stackTrace){
                  Utilities().toastMessage(error.toString());
                })  ;
              },
            )
          ],
        ),
      ),
    );
  }
}
