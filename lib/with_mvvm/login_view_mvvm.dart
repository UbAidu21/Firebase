import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/with_mvvm/google_home.dart';
import 'package:firebase_2/with_mvvm/google_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginViewMvvm extends StatefulWidget {
  const LoginViewMvvm({super.key});

  @override
  State<LoginViewMvvm> createState() => _LoginViewMvvmState();
}

class _LoginViewMvvmState extends State<LoginViewMvvm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GoogleServices googleServices = GoogleServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  debugPrint('Logging in With Google');
                  googleServices.handleGoogleSignIn(context);
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, -1),
                            blurRadius: 25)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Logo(Logos.google),
                  ),
                ),
              ),
              100.ph,
              TextButton(
                onPressed: () {
                  FirebaseAuth _auth = FirebaseAuth.instance;

                  _auth.signOut().then((value){Utilities().toastMessage('User Has been Sign Out');});
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context){return GoogleHomeScreen(user: user)}))
                }
                ,
                child: AppText(text: 'Log out'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}
