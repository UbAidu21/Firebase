import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/view/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddFirestoreData extends StatefulWidget {
  const AddFirestoreData({super.key});

  @override
  State<AddFirestoreData> createState() => _AddFirestoreDataState();
}

class _AddFirestoreDataState extends State<AddFirestoreData> {
  final postController = TextEditingController();
  final auth = FirebaseAuth.instance;
  ValueNotifier<bool> loading = ValueNotifier(false);

  final firestoredb = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Add Data Firestore'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller: postController,
                hint: 'What is your mind?',
                label: 'Post',
                maxLines: 4,
              ),
              fixheight,
              ValueListenableBuilder(
                valueListenable: loading,
                builder: (context, value, child) {
                  return AppButton(
                    text: 'Upload Data',
                    height: 60,
                    borderRadius: 30,
                    loading: loading.value,
                    onPressed: () {
                      loading.value = true;

                      String id = DateTime.now().millisecondsSinceEpoch.toString();
                      firestoredb
                          .collection('users')
                          .doc(id)
                          .set({
                            'id' : id,
                            'title': postController.text.toString(),

                          })
                          .then((value) {
                            loading.value = false;
                            Utilities().toastMessage('Data added to Firestore');
                            Navigator.pop(context);
                          })
                          .onError((error, stackTrace) {
                            Utilities().toastMessage(error.toString());
                            loading.value = false;
                          });
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
