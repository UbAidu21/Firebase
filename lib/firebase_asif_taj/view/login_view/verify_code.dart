import 'package:firebase_2/utils/functions/utilites.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyNumber extends StatefulWidget {
  final String verification;
  const VerifyNumber({
    required this.verification,
    super.key,
  });

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final codeController = TextEditingController();
  ValueNotifier<bool> loading = ValueNotifier(false);
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Verify'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.phone,
                size: 150,
              ),
              CustomTextField(
                controller: codeController,
                hint: 'eg.3938',
                label: 'Code',
                textInputType: TextInputType.number,
              ),
              fixheight,
              ValueListenableBuilder(
                  valueListenable: loading,
                  builder: (context, value, child) {
                    return AppButton(
                      height: 60,
                      borderRadius: 30,
                      text: 'Verify',
                      loading: loading.value,
                      onPressed: () async {
                        loading.value = true;
                        final authCredential = PhoneAuthProvider.credential(
                          verificationId: widget.verification,
                          smsCode: codeController.text.toString(),
                        );

                        try{
                          await auth.signInWithCredential(authCredential);
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, RoutesName.home);
                          loading.value = false;
                        }catch(e){
                          Utilities().toastMessage(e.toString());
                          loading.value = false;
                        }
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
