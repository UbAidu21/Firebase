

import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/firebase_asif_taj/view/Impage_upload/upload_image.dart';
import 'package:firebase_2/firebase_asif_taj/view/firestore/firestore_list_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/home/home_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/login_view/login_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/login_view/login_with_phone.dart';

import 'package:firebase_2/firebase_asif_taj/view/signup_view/signup_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
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
      
      
      case RoutesName.firestoreList:
        return MaterialPageRoute(builder: (BuildContext context) => const FirestoreListView());
      
      case RoutesName.verifyNumber:
        // return MaterialPageRoute(builder: (BuildContext context) => const VerifyNumber());
      
      case RoutesName.uploadImage:
        return MaterialPageRoute(builder: (BuildContext context) => const UploadImageView());


        
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
