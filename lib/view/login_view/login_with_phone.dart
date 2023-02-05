import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/view/login_view/verify_code.dart';
import 'package:firebase_2/view/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final phoneNumberController = TextEditingController();
  ValueNotifier<bool> loading = ValueNotifier(false);
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.phone,
                size: 150,
              ),
              CustomTextField(
                controller: phoneNumberController,
                hint: '+92 340 9421345',
                label: 'Mobile Number',
                textInputType: TextInputType.number,
              ),
              fixheight,
              ValueListenableBuilder(
                  valueListenable: loading,
                  builder: (context, value, child) {
                    return AppButton(
                      height: 60,
                      borderRadius: 30,
                      text: 'Log in',
                      loading: loading.value,
                      onPressed: () {
                        loading.value = true;
                        auth.verifyPhoneNumber
                        (
                          phoneNumber: phoneNumberController.text,
                        verificationCompleted: (_){
                          loading.value = false;
                        },
                        verificationFailed: (error) {
                           Utilities().toastMessage(error.toString());
                           loading.value = false;
                         },
                        codeSent:(String verificationId,int? token) {
                          // Navigator.pushNamed(context, RoutesName.verifyNumber);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyNumber(verification: verificationId)));
                          loading.value = false;
                        } , 
                        codeAutoRetrievalTimeout: (e){
                          Utilities().toastMessage(e.toString());
                          loading.value = false;
                        },);

                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
