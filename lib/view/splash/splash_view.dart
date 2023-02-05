import 'package:firebase_2/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    
    super.initState();
    splashServices.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.flutter_dash,
              size: 150,
              color: Colors.blue[300],
            ),
            fixheight,
            const Text(
              'Splash Activity',
              style: TextStyle(color: Colors.black54,fontSize: 25,),
            ),
            fixheight,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:  38.0),
              child: LinearProgressIndicator(color: Colors.lightBlueAccent,minHeight: 2),
            )
          ],
        ),
      ),
    );
  }
}

const fixheight =  SizedBox(
  height: 20,
);
const fixwidth = SizedBox(
  width: 20,
);
