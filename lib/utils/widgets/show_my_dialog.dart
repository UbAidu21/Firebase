import 'package:firebase_2/utils/functions/utilites.dart';

import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';

Future<void> showMyDialog(String title, String id, BuildContext context) async {
  final editController = TextEditingController();
  final auth = FirebaseAuth.instance;

  final user = auth.currentUser!.uid;

  final ref = FirebaseDatabase.instance.ref(user);
  editController.text = title;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AppText(text: 'Update '),
          content: Container(
            child: CustomTextField(
              controller: editController,
              hint: 'Edit',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: AppText(text: 'cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ref
                    .child(id)
                    .update({'post': editController.text})
                    .then((value) => Utilities().toastMessage('Post Updated'))
                    .onError(
                      (error, stackTrace) {
                        Utilities().toastMessage(error.toString());
                      },
                    );
              },
              child: AppText(text: 'Update'),
            ),
          ],
        );
      });
}
