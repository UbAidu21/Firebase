import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Home Screen'),
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.pushReplacementNamed(context, RoutesName.login);
                }).onError(
                  (error, stackTrace) {
                    Utilities().toastMessage(error.toString());
                  },
                 );
              },
              icon: const Icon(
                Icons.logout,
                size: 30,
              ))
        ],
      ),
      body: Column(
        children: [
          AppText(text: 'Home Screen'),
        ],
      ),
    );
  }
}
