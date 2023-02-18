import 'package:firebase_2/provider/model/user_model.dart';
import 'package:firebase_2/provider/services/controllers.dart';
import 'package:firebase_2/provider/view_model/user_view_model.dart';
import 'package:firebase_2/utils/widgets/app_button.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:firebase_2/utils/widgets/custom_text_field.dart';
import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  
  final controller = ControllersFields();

  void _submitData() {
    final userDataModel = Provider.of<UserViewModel>(context, listen: false);
    final data = UserModel(
      fname: controller.fnameController.text,
      registrationNo:controller. regNoController.text,
      department: controller.departmentController.text,
      semester: controller.semesterController.text,
      email: controller.emailController.text,
      contact: controller.contactController.text,
      password:controller. passwordController.text,
    );

    userDataModel.saveUserData(data);
    // userDataModel.myData(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: 'Using Provider'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                controller:controller. fnameController,
                hint: 'Name',
                label: 'Name',
              ),
              fixheight,
              CustomTextField(
                controller: controller.regNoController,
                hint: '2020-Fu.Cs-01',
                label: 'Registration No.',
              ),
              fixheight,
              CustomTextField(
                controller:controller. departmentController,
                hint: 'e.g Computer Science',
                label: 'Department',
              ),
              fixheight,
              CustomTextField(
                controller: controller.semesterController,
                hint: 'Semester',
                label: 'Semester',
              ),
              fixheight,
              CustomTextField(
                controller:controller. emailController,
                hint: 'email@gmail.com',
                label: 'Email',
              ),
              fixheight,
              CustomTextField(
                controller:controller. contactController,
                hint: '+92 340 9421345',
                label: 'Contact',
              ),
              fixheight,
              CustomTextField(
                controller:controller. passwordController,
                hint: 'ABCdef@123',
                label: 'Password',
              ),
              fixheight,
              AppButton(
                text: 'Submit Form',
                onPressed: (){
                  _submitData();
                  
                  // Navigator.push(context, MaterialPageRoute(builder: (context){return }))
                },
                height: 60,
                borderRadius: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
