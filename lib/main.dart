import 'package:firebase_2/utils/routs/routes_name.dart';
import 'package:firebase_2/utils/routs/routs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      title: 'Firebase App',
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      theme: ThemeData(
                brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(
          color: Colors.teal
        )
      ),
      // home: const SplashView(),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
    );
  }
} 
