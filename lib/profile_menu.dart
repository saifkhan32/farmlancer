import 'package:farmlancer/applicants_screen.dart';
import 'package:farmlancer/post_job.dart';
import 'package:farmlancer/services/admin_approval.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/update.dart';
import 'package:farmlancer/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile_menu extends StatefulWidget {
  const Profile_menu({super.key});

  @override
  State<Profile_menu> createState() => _Profile_menuState();
}

class _Profile_menuState extends State<Profile_menu> {
  @override
  Widget build(BuildContext context) {
     final ap = Provider.of<AuthProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar( leading: IconButton(onPressed: () {  
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
          title : Text(' My Profile',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: const Color.fromRGBO(0, 0, 0, 1))),
                          centerTitle: true,
                           actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                        ),
                         (Route<dynamic> route) => false
                      
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                  width: 353,
                  height: 72,
                  margin: const EdgeInsets.only(top: 24, left: 20),
                  child: Row(children: [
                    SizedBox(
                        width: 72,
                        height: 72,
                        child: CircleAvatar(
            backgroundColor: Colors.purple,
            backgroundImage: NetworkImage(ap.userModel!.profilePic),
            radius: 50,
          )),
            
                    const SizedBox(
                      width: 5,
                    ),
            
                    SizedBox(
                        width: 160,
                        height: 64,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height: 18,
                                  width: 210,
                                  child: Text(ap.userModel!.name,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)))),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                height: 18,
                                width: 250,
                                child: Text(ap.userModel!.email,
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color.fromRGBO(0, 0, 0, 1))),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              SizedBox(
                                  height: 15,
                                  width: 100,
                                  child: Text(ap.userModel!.phoneNumber,
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1)))),
                            ])),
                    const SizedBox(
                      width: 60,
                    ),
      
                    
                      SizedBox(
                        height: 30,
                        width: 20,
                        child: IconButton(icon: Icon(Icons.arrow_forward_ios_outlined),
                         
                             onPressed: () { 
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateProfile()));
                              },),
                      ),
                     
                  ])),
              const SizedBox(height: 60),
              Container(
                  width: 339,
                  height: 174,
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Settings',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(0, 0, 0, 1))),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/lock.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 110,
                                  height: 23,
                                  child: Text('Privacy Policy',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))),
                              const SizedBox(
                                width: 160,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: 20,
                                  child: IconButton(icon: const Icon(Icons.arrow_forward,size: 20.0),
                       
                           onPressed: () { 
                                launchUrl(Uri.parse(
                                      'https://www.mhtechin.com/privacy-policy-web/'));
                            },),)
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/cancelation.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 110,
                                  height: 23,
                                  child: Text('Cancellation Policy',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))),
                              const SizedBox(
                                width: 160,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: 20,
                                  child:   IconButton(icon: const Icon(Icons.arrow_forward,size: 20.0),
                       
                           onPressed: () { 
                                  launchUrl(Uri.parse(
                                      'https://www.mhtechin.com/refunds-cancellations/'));
                            },),)
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/triangle.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 110,
                                  height: 23,
                                  child: Text('Disclaimer',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))),
                              const SizedBox(
                                width: 158,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: 20,
                                  child:  IconButton(icon: const Icon(Icons.arrow_forward,size: 20.0),
                       
                           onPressed: () { 
                                launchUrl(Uri.parse(
                                      'https://www.mhtechin.com/disclaimer'));
                            },),)
                            ])),
                      ])),
              const SizedBox(
                height: 50,
              ),
              Container(
                  width: 339,
                  height: 222,
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Support',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(0, 0, 0, 1))),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/bell.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 270,
                                  height: 222,
                                  child: Text('Terms and Condition',
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))),
                            
                              SizedBox(
                                  height: 30,
                                  width: 22,
                                  child:   IconButton(icon: const Icon(Icons.arrow_forward,size: 20.0),
                       
                           onPressed: () { 
                                launchUrl(Uri.parse(
                                          'https://www.mhtechin.com/terms-and-conditions/')); 
                            },),)
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/lock.png')),
                              const SizedBox(
                                width: 7,
                              ),
                             
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 110,
                                  height: 23,
                                  child: ap.userModel?.role == "user" ? 
                                  Text('Contact us',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1))): 
                                               Text('Admin ',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))
                                              ),
                              const SizedBox(
                                width: 150,
                              ),
                               IconButton(onPressed: () {
                                ap.userModel?.role == "admin" ? 
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>  AdminApprovalPage())):  
                                   launchUrl(Uri.parse(
                                          'https://www.mhtechin.com/contact-us/')); },
                                  icon:  const Icon(Icons.arrow_forward, size: 20.0)),
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/about_us.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 110,
                                  height: 23,
                                  child: Text('About us',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))),
                              const SizedBox(
                                width: 160,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: 20,
                                  child:   IconButton(icon: const Icon(Icons.arrow_forward,size: 20.0),
                       
                           onPressed: () { 
                                    launchUrl(Uri.parse(
                                      'https://www.mhtechin.com/about-us/'));
                            },),)
                            ])),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            height: 24,
                            width: 339,
                            child: Row(children: [
                              SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset('assets/about_us.png')),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 2),
                                  width: 110,
                                  height: 23,
                                  child: Text('Job Posting Account',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              117, 117, 117, 1)))),
                              const SizedBox(
                                width: 160,
                              ),
                              SizedBox(
                                  height: 30,
                                  width: 20,
                                  child:   IconButton(icon: const Icon(Icons.arrow_forward,size: 20.0),
                       
                           onPressed: () { 
                             
                            },),)
                            ])),
                      ])),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 10),
                    child: Container(
                        width: 130,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(74, 181, 90, 1),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(196, 196, 196, 1)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: SizedBox(
                            width: 100,
                            height: 20,
                            child: TextButton(
                              onPressed: () { 
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplicantsScreen()));
                               },
                              child: Text('Get Applicants',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                  )),
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Container(
                        width: 120,
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(74, 181, 90, 1),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromRGBO(196, 196, 196, 1)),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: SizedBox(
                            width: 65,
                            height: 20,
                            child: TextButton(
                              onPressed: () { 
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Postjob()));
                               },
                              child: Text('Post a Job',
                                  style: GoogleFonts.inter(
                                    
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: const Color.fromRGBO(0, 0, 0, 1),
                                  )),
                            ))),
                  ),
                ],
              ),
            ]),
          ),
         ),
    );
  }
}
