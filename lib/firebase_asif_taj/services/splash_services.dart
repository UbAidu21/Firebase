import 'dart:async';

import 'package:firebase_2/firebase_asif_taj/view/Impage_upload/upload_image.dart';
import 'package:firebase_2/firebase_asif_taj/view/firestore/firestore_list_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/home/home_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/login_view/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    // Timer.periodic(Duration(seconds: 3), (timer) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) {
    //         return LoginView();
    //       },
    //     ),
    //   );
    // });

    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginView();
              })));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginView();
              })));
    }
  }
}
