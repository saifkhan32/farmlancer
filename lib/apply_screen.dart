import 'package:farmlancer/home_page.dart';
import 'package:farmlancer/model/model2.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ApplyScreen extends StatefulWidget {
  String uid;
  ApplyScreen({super.key, required this.uid});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
    final appNameController= TextEditingController();
   final appPhoneController= TextEditingController();
    final appPosController= TextEditingController();
    final workController= TextEditingController();
    final appbudgetController= TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(  appBar: AppBar(
      title : Text('Apply For A Job',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: const Color.fromRGBO(0, 0, 0, 1))),
                        centerTitle: true,),
        body: SingleChildScrollView(
          child: Column(
            children: [
    const SizedBox(height: 40),
            Container(
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Column(children: [
                  SizedBox(
                      width: 312,
                      height: 73,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 19,
                                child: Text('Enter your name',
                                    style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            74, 181, 90, 1)))),
                            const SizedBox(height: 8),
                            Container(
                                width: 312,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          const Color.fromRGBO(74, 181, 90, 1)),
                                ),
                                child:  TextField(
                                  controller: appNameController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Enter your name",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(74, 181, 90, 1)),
                                  ),
                                ))
                          ])),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 312,
                      height: 73,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 19,
                                child: Text('Mobile no.',
                                    style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            74, 181, 90, 1)))),
                            const SizedBox(height: 8),
                            Container(
                                width: 312,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          const Color.fromRGBO(74, 181, 90, 1)),
                                ),
                                child:  TextField(
                                  controller: appPhoneController,
                                  keyboardType: TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Enter your mobile no. ",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(74, 181, 90, 1)),
                                  ),
                                ))
                          ])),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 312,
                      height: 73,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 19,
                                child: Text('Work Name',
                                    style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            74, 181, 90, 1)))),
                            const SizedBox(height: 8),
                            Container(
                                width: 312,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          const Color.fromRGBO(74, 181, 90, 1)),
                                ),
                                child: TextField(
                                  controller: appPosController,        
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Enter the position you applying for",
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(74, 181, 90, 1)),
                                  ),
                                ))
                          ])),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 312,
                      height: 73,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 19,
                                child: Text('Budget',
                                    style: GoogleFonts.manrope(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                            74, 181, 90, 1)))),
                            const SizedBox(height: 8),
                            Container(
                                width: 312,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          const Color.fromRGBO(74, 181, 90, 1)),
                                ),
                                child: TextField(
                                  controller: appbudgetController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Budget Expectation",
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(74, 181, 90, 1)),
                                    border: InputBorder.none,
                                  ),
                                ))
                          ])),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 312,
                      height: 73,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 19,
                                child: Text('Work Availability ',
                                    style: GoogleFonts.manrope(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(74, 181, 90, 1),
                                    ))),
                            const SizedBox(height: 8),
                            Container(
                                width: 312,
                                height: 46,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 2,
                                      color:
                                          const Color.fromRGBO(74, 181, 90, 1)),
                                ),
                                child: TextField(
                                  controller: workController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 20),
                                    hintText: "Availability of work in hours",
                                    hintStyle: TextStyle(
                                        color: Color.fromRGBO(74, 181, 90, 1)),
                                    border: InputBorder.none,
                                  ),
                                ))
                          ])),
                  const SizedBox(height: 30),
                  Container(
                      width: 312,
                      height: 48,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(74, 181, 90, 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: SizedBox(
                        width: 32,
                        height: 19,
                        child: TextButton(
                          onPressed: () { 
                              updateApplicantData(uid1 : widget.uid);
                              showSnackBar(context, "Applied Successfully");
                        Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(
                            builder: (context) => HomePage()),(Route<dynamic> route) => false);
                           },
                          child: Text('Submit Details',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(255, 255, 255, 1))),
                        ),
                      )),
                ]))
          ]),
        )
        );
       
  }
  void updateApplicantData({required String uid1} ) async{
     final ap = Provider.of<AuthProvider>(context, listen: false); 
     
    ApplicantModel applicantModel = ApplicantModel(
      uid : uid1,
      name: appNameController.text,
        work: appPosController.text ,
      contact: appPhoneController.text.trim(),
      budget: appbudgetController.text.trim(),
      time : workController.text,
      
    );
    ap.createApplicants(applicationModel: applicantModel);
}
@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    appNameController.dispose();
  appPhoneController.dispose();
  appPosController.dispose();
    appbudgetController.dispose();
    workController.dispose();

    super.dispose();
  }
}