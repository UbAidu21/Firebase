import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/utils/widgets/show_my_dialog.dart';
import 'package:firebase_2/view/firestore/add_firestore_data.dart';
import 'package:firebase_2/view/home/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class FirestoreListView extends StatefulWidget {
  const FirestoreListView({super.key});

  @override
  State<FirestoreListView> createState() => _FirestoreListViewState();
}

class _FirestoreListViewState extends State<FirestoreListView> {
  final auth = FirebaseAuth.instance;
  final searchController = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = auth.currentUser!.uid;
    final ref = FirebaseDatabase.instance.ref(user);
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Firestore'),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: AppText(
                      text: 'text',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddFirestoreData(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
