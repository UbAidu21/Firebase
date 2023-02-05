import 'package:firebase_2/databases/firebase/user_register.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/view/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ValueNotifier<bool> toggle = ValueNotifier(true);

  // //For Form
  // bool? obscureText = false;
  // String? hint;
  // String? label;
  // Widget? suffixIcon;
  // Widget? prefixIcon;

  final _auth = FirebaseAuth.instance;

  ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    numberController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.flutter_dash,
                  size: 200,
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomTextField(
                      controller: nameController,
                      label: 'Name',
                      hint: 'Name',
                      prefixIcon: const Icon(Icons.person_outline),
                      textInputType: TextInputType.name,
                      validator: (p0) {
                        if (p0== null || p0.isEmpty ) {
                          return 'Fill the Field';
                        }
                      },
                    ),
                    fixheight,
                    CustomTextField(
                      controller: emailController,
                      label: 'Email',
                      hint: 'Email',
                      prefixIcon:const Icon(Icons.alternate_email),
                      textInputType: TextInputType.emailAddress,
                      validator: (p0) {
                        if (p0!.isEmpty || p0 == null) {
                          return 'Fill the Field';
                        }
                      },
                    ),
                    fixheight,
                    CustomTextField(
                      controller: numberController,
                      label: 'Number',
                      hint: 'Number',
                      prefixIcon: const Icon(Icons.phone),
                      textInputType: TextInputType.number,
                      validator: (p0) {
                        if ( p0 == null ||p0.isEmpty ) {
                          return 'Fill the Field';
                        }
                      },
                    ),
                    fixheight,
                    ValueListenableBuilder(
                        valueListenable: toggle,
                        builder: (context, value, child) {
                          return CustomTextField(
                            controller: passwordController,
                            obscureText: toggle.value,
                            prefixIcon:const Icon(Icons.lock_open),
                            textInputType: TextInputType.visiblePassword,
                            suffixIcon: InkWell(
                              onTap: () {
                                toggle.value = !toggle.value;
                              },
                              child: Icon(toggle.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            hint: 'Password',
                            label: 'Password',
                            validator: (p0) {
                              if ( p0 == null ||p0.isEmpty) {
                                return 'Enter Password';
                              } else if (p0.length < 6) {
                                return 'Password must be 6 digits';
                              }
                            },
                          );
                        }),
                    fixheight,
                    ValueListenableBuilder(
                        valueListenable: loading,
                        builder: (context, value, child) {
                          return AppButton(
                              text: 'Sign Up',
                              height: 60,
                              borderRadius: 50,
                              loading: loading.value,
                              onPressed: () {
                                loading.value = false;
                                if (formKey.currentState!.validate()) {
                                  // Navigator.pushReplacementNamed(
                                  //     context, RoutesName.HOME);

                                  // firebaseSignUp();

                                  var fullName = nameController.text.trim();
                                  var email = emailController.text.trim();
                                  var password = passwordController.text.trim();
                                  var contact = numberController.text.trim();

                                  UserAuth().userSignup(
                                    emailController.text,
                                    passwordController.text,
                                  );

                                  UserAuth().userData(fullName, email, contact,
                                      password, context);
                                  // loading.value = false;
                                }
                              });
                        }),
                    fixheight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: 'Already have an Account',
                          fontSize: 15,
                        ),
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: AppText(
                              text: 'Sign In',
                              fontSize: 15,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void firebaseSignUp() {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      loading.value = false;
    }).onError((error, stackTrace) {
      Utilities().toastMessage(error.toString());
      loading.value = false;
    });
  }
}
