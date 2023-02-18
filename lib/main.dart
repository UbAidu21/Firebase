import 'package:firebase_2/muti_page_sign_up/view/name_view.dart';
import 'package:firebase_2/muti_page_sign_up/view_model/student_view_model.dart';
import 'package:firebase_2/provider/view/my_home_view.dart';
import 'package:firebase_2/provider/view_model/user_view_model.dart';
import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/routs/routs.dart';
import 'package:firebase_2/firebase_asif_taj/view/firestore/firestore_list_view.dart';
import 'package:firebase_2/firebase_asif_taj/view_model/controllers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(create: (_)=> StudentViewModel(),child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase App',
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      theme: ThemeData(
                // brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(
          color: Colors.teal
        )
      ),
      home:  NameView(),
      

      // initialRoute: RoutesName.splash,
      // onGenerateRoute: Routes.generateRoute,
    ),);
    
  }
} 
