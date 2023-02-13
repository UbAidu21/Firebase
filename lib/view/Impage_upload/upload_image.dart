import 'dart:io';

import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/view/splash/splash_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImageView extends StatefulWidget {
  const UploadImageView({super.key});

  @override
  State<UploadImageView> createState() => _UploadImageViewState();
}

class _UploadImageViewState extends State<UploadImageView> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  File? _image;
  final picker = ImagePicker();
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('posts');

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        Utilities().toastMessage('Image Not Picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Image Upload'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                getImageGallery();
              },
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.teal[200],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    )),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                        ),
                        child: Image.file(
                          _image!.absolute,
                          fit: BoxFit.cover,
                        ))
                    : const Icon(
                        Icons.add_a_photo_rounded,
                        size: 100,
                      ),
              ),
            ),
          ),
          fixheight,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
              text: 'Upload',
              height: 60,
              borderRadius: 30,
              onPressed: () async {
                firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref('/foldername'+'123');
                firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

                await Future.value(uploadTask);

                var newUrl = ref.getDownloadURL();
              },
            ),
          )
        ],
      ),
    );
  }
}
