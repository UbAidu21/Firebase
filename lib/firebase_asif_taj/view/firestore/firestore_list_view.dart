import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/utils/widgets/show_my_dialog.dart';
import 'package:firebase_2/firebase_asif_taj/view/firestore/add_firestore_data.dart';
import 'package:firebase_2/firebase_asif_taj/view/home/add_post.dart';
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

  final firestoredb =
      FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference collection_ref =
      FirebaseFirestore.instance.collection('users');

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
          StreamBuilder<QuerySnapshot>(
              stream: firestoredb,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return AppText(text: 'Something went wrong');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              collection_ref
                                  .doc(snapshot.data!.docs[index]['id']
                                      .toString())
                                  .update({'title': 'Update Ho Ja Bhai'})
                                  .then((value) {
                                     Utilities().toastMessage('Updated');
                                  })
                                  .onError((error, stackTrace) {
                                    Utilities().toastMessage(error.toString());
                                  });
                            },
                            title: AppText(
                              text: '${snapshot.data!.docs[index]['title']}',
                            ),
                            subtitle: AppText(
                              text: snapshot.data!.docs[index].id,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
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
