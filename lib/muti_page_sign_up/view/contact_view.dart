import 'package:firebase_2/firebase_asif_taj/view/home/home_view.dart';
import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_2/muti_page_sign_up/utils/firebase/firebase_firestore.dart';
import 'package:firebase_2/muti_page_sign_up/view_model/student_view_model.dart';
import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  //Controllers
  final contactController = TextEditingController();
  final FirebaseServicesData firebaseServicesData = FirebaseServicesData();

  ValueNotifier<bool> loading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: contactController,
              hint: '0283039',
              label: 'Contact',
            ),
            fixheight,
            fixheight,
            ValueListenableBuilder(
              valueListenable: loading,
              builder: (context, value, child) {
                return AppButton(
                  text: 'Submit',
                  height: 60,
                  borderRadius: 30,
                  loading: loading.value,
                  onPressed: () {
                    loading.value = true;
                    if (contactController.text == null ||
                        contactController.text.isEmpty) {
                      Utilities().toastMessage('Enter First Name');
                      loading.value = false;
                    } else {
                      provider.updateContact(contactController.text);

                      firebaseServicesData.uploadData(context).then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeView();
                        }));
                        loading.value = false;
                      }).onError((error, stackTrace) {
                        Utilities().toastMessage(error.toString());
                        loading.value = false;
                        print(error);
                      });
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
