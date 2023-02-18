import 'package:firebase_2/firebase_asif_taj/databases/firebase/user_register.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/firebase_asif_taj/view/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../splash/splash_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> toggle = ValueNotifier(true);

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Login'),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.flutter_dash,
                      size: 200,
                    ),
                    fixheight,
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: emailController,
                            label: 'Email',
                            hint: 'Email',
                            prefixIcon: const Icon(Icons.person_outline),
                          ),
                          fixheight,
                          ValueListenableBuilder(
                              valueListenable: toggle,
                              builder: (context, value, child) {
                                return CustomTextField(
                                  controller: passwordController,
                                  obscureText: toggle.value,
                                  prefixIcon: const Icon(Icons.lock_open),
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
                                    if (p0 == null || p0.isEmpty) {
                                      return 'Enter Password';
                                    } else if (p0.length < 6) {
                                      return 'Password must be 6 digits';
                                    }
                                  },
                                );
                              }),
                        ],
                      ),
                    ),
                    fixheight,
                    fixheight,
                    AppButton(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          UserAuth().userLogin(context, emailController.text,
                              passwordController.text);
                        }
                      },
                      borderRadius: 30,
                      height: 60,
                    ),
                    fixheight,
                    Align
                    (alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordView()));
                        },
                        child: AppText(text: 'Forgot Password?'),
                      ),
                    ),
                    fixheight,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: 'Don\'t have an account',
                          fontSize: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RoutesName.signup);
                          },
                          child: AppText(
                            text: 'Sign Up',
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.loginWithPhone);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.white38)),
                        child: Center(
                          child: AppText(text: 'Login with Phone'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
