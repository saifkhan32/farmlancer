   import 'package:farmlancer/notification_permission.dart';
import 'package:farmlancer/services/perms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationPermission extends StatefulWidget {
  const LocationPermission({super.key});

  @override
  State<LocationPermission> createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () {},
          ),
        ),
        body: Center(
            child: Container(
                height: 487,
                width: 316,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(81, 252, 78, 1),
                        Color.fromRGBO(177, 254, 175, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                        Color.fromRGBO(255, 255, 255, 1),
                      ],
                    )),
                child: Stack(children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 47,
                        left: 89,
                        child: SizedBox(
                            //margin: EdgeInsets.only(top:237, left:128.26),
                            width: 147,
                            height: 111,
                            child: Image.asset('assets/locatio1.png')),
                      ),
                      Positioned(
                        top: 50,
                        left: 130,
                        child: SizedBox(
                            //margin: EdgeInsets.only(top:237, left:128.26),
                            width: 87,
                            height: 87,
                            child: Image.asset('assets/locatio2.png')),
                      ),
                    ],
                  ),
                  Positioned(
                      top: 185,
                      left: 115,
                      child: Text('Location',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ))),
                  Positioned(
                      top: 230,
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 274,
                        height: 52,
                        child: Text(
                            'Allow maps to access your location while you use the app?',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color.fromRGBO(96, 98, 104, 1))),
                      )),
                  Positioned(
                    top: 310,
                    left: 35,
                    child: Container(
                        width: 240,
                        height: 44,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(74, 181, 90, 1),
                            borderRadius: BorderRadius.circular(100)),
                        child: SizedBox(
                          width: 32,
                          height: 19,
                          child: TextButton(
                               onPressed: () { 
                                Perms.location();
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context)=> const NotificationPermission())
                          );},
                            child: Text('Turn On',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1))),
                          ),
                        )),
                  ),
                  Positioned(
                    top: 380,
                    left: 35,
                    child: Container(
                        width: 240,
                        height: 44,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(74, 181, 90, 1),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: SizedBox(
                          width: 38,
                          height: 19,
                          child: TextButton(
                               onPressed: () { 
                                Perms.location();
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context)=> const NotificationPermission())
                          );},
                            child: Text('Skip for now ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(74, 181, 90, 1),
                                )),
                          ),
                        )),
                  ),
                ]))));
  }
}
