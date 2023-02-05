

import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/view/home/home_view.dart';
import 'package:firebase_2/view/login_view/login_view.dart';
import 'package:firebase_2/view/login_view/login_with_phone.dart';
import 'package:firebase_2/view/login_view/verify_code.dart';
import 'package:firebase_2/view/signup_view/signup_view.dart';
import 'package:firebase_2/view/splash/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeView());
      
      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      
      case RoutesName.loginWithPhone:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginWithPhone());
      
      case RoutesName.verifyNumber:
        // return MaterialPageRoute(builder: (BuildContext context) => const VerifyNumber());


        
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: AppText(text: 'Page Not found'),
            ),
          ),
        );
    }
  }
}