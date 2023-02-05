import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/view/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final postController = TextEditingController();
  final auth = FirebaseAuth.instance;
  int id = 0;
  final databaseRef = FirebaseDatabase.instance;
  ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Create Post'),
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
                      var user = auth.currentUser!.uid;
                      loading.value = true;

                      var db = databaseRef.ref(user);
                      db
                          .child(
                              '${DateTime.now().year}:${DateTime.now().month}:${DateTime.now().day}:${DateTime.now().minute}:${DateTime.now().second}')
                          .set(
                        {
                          'id' : id++,
                          'post': postController.text.toString(),
                        },
                      ).then((value) {
                        loading.value = false;
                        Utilities().toastMessage("Data Okhata");
                      }).onError((error, stackTrace) {
                        loading.value = false;
                        Utilities().toastMessage(error.toString());
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
