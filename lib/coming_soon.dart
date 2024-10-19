import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar( leading: IconButton(onPressed: () {  
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
          title : Text(' Coming Soon',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: const Color.fromRGBO(0, 0, 0, 1))),
                          centerTitle: true,),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: LottieBuilder.asset(
              'assets/coming_soon.json',animate: true,repeat: true,
            )
          ),
        ),
      ),
     );
  }
}