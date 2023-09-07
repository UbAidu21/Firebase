import 'package:firebase_2/firebase_asif_taj/view/splash/splash_view.dart';
import 'package:firebase_2/utils/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

class IconsCheck extends StatefulWidget {
  const IconsCheck({super.key});

  @override
  State<IconsCheck> createState() => _IconsCheckState();
}

class _IconsCheckState extends State<IconsCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.icons,
          size: 50,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Buttons(color1: 0xFFEC6F66,color2: 0xFFF3A183,),
              Buttons(color1: 0xFF000428,color2: 0xFF004E92,),            
              Buttons(color1: 0xFFFAACAB,color2: 0xFFDDD6F3,),
              Buttons(color1: 0xFF7B4397,color2: 0xFFDC2430,),
              Buttons(color1: 0xFF43CEA2,color2: 0xFF185A9D,),
              Buttons(color1: 0xFFBA5370,color2: 0XFFF4E2D8,),
              Buttons(color1: 0xFF4568DC,color2: 0XFFB06AB3,),
              Buttons(color1: 0xFFFFD89B,color2: 0XFF19547B,),
              Buttons(color1: 0xFF3A1C71,color3: 0xFFD76D77, color2: 0XFFFFAF7B,),

        
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class Buttons extends StatelessWidget {
   Buttons({
    super.key,
    this.color1,
    this.color2,
    this.color3,
    
  });
  int? color1;
  int? color2;
  int? color3;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      // padding: EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33),
        gradient:  LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            
            // Color(colorString!),
            Color(color1!),
            Color(color3 ?? 0xFFD76D77),
            Color(color2!),
            
          ],
        ),
      ),
      child: Center(
          child: AppText(
        text: 'Signup',
        fontSize: 30,
        color: Colors.white,
        fontFamily: 'Nunito',
        fontWeight: FontWeight.w700,
      )),
    );
  }
}
