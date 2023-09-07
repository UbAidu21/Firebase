import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/with_mvvm/google_services.dart';
import 'package:firebase_2/with_mvvm/login_view_mvvm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleHomeScreen extends StatefulWidget {
  GoogleHomeScreen({super.key, required User user}) : _user = user;

  final User _user;

  @override
  State<GoogleHomeScreen> createState() => _GoogleHomeScreenState();
}

class _GoogleHomeScreenState extends State<GoogleHomeScreen> {
  late User _user;
  final _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleServices googleServices = GoogleServices();

  final  _db = FirebaseFirestore.instance.collection('Google Users').snapshots();
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('Google Users');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user = widget._user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Fetch Data'),
        actions: [
          IconButton(
              onPressed: () {
                googleServices.handleGoogleSignOut(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          200.ph,
          // ClipRRect(
          //     borderRadius: BorderRadius.all(Radius.circular(50)),
          //     child: Image.network(
          //       '${_user.photoURL}',
          //       height: 100,
          //       width: 100,
          //     )),
          // Center(
          //     child: AppText(
          //   text: '${_user.displayName}',
          //   fontSize: 30,
          //   fontWeight: FontWeight.bold,
          // )),
          // Center(
          //     child: AppText(
          //   text: '{${_user.email}}',
          //   fontSize: 20,
          // )),
          // 50.ph,
          // AppButton(
          //     text: 'Sign Out',
          //     onPressed: () {
          //       googleServices.handleGoogleSignOut(context);
          //     }),

          ////This is Fetch Data from Firebase
          StreamBuilder<QuerySnapshot>(
            stream: _db,
              builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: AppText(
                  text: 'Something went Wrong',
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network(
                            '${snapshot.data!.docs[index]['Picture']}'),
                      ),
                    );
                  },
                ),
              );
            }
          })
        ],
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
