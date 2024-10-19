import 'dart:async';

import 'package:farmlancer/location_perms.dart';
import 'package:farmlancer/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
var hasSeenOnboarding1 = false;
class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {


    @override
      void initState()
 {
    super.initState();
    
    hasSeenOnboarding();
 
}
//To Not Display The Onboarding Screen After The Installation
void hasSeenOnboarding() async{
 SharedPreferences prefs = await SharedPreferences.getInstance();
  hasSeenOnboarding1 = prefs.getBool("hasSeenOnboarding") ?? false;
  await prefs.setBool("hasSeenOnboarding",true);
    Timer(const Duration(seconds: 5),(){
      if(hasSeenOnboarding1) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LocationPermission()));
      }
    });
}
      @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 194, height: 61, child: Image.asset('assets/farmLanser.png')),
            ]),
      ],
    ));
  }
}
