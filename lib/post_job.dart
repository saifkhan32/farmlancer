import 'package:farmlancer/Components/Bottom_bar.dart';
import 'package:farmlancer/home_page.dart';
import 'package:farmlancer/model/model2.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Postjob extends StatefulWidget {
  const Postjob({super.key});

  @override
  State<Postjob> createState() => _PostjobState();
}

class _PostjobState extends State<Postjob> {
  final titleController= TextEditingController();
   final descController= TextEditingController();
    final budgetController= TextEditingController();
     final deadlineController= TextEditingController();
    final contactController= TextEditingController();

 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      title : Text(' Post A Job',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: const Color.fromRGBO(0, 0, 0, 1))),
                        centerTitle: true,),
        body: SingleChildScrollView(
          child: Column(
            children: [
            const SizedBox(height: 50),
            
            Container(
                  margin: const EdgeInsets.only(
                    left: 25,
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  height:  MediaQuery.sizeOf(context).height,
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
                                  child: Text('Job Title',
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
                                    controller: titleController,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Enter your job title",
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
                                  child: Text('Job Description',
                                      style: GoogleFonts.manrope(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromRGBO(
                                              74, 181, 90, 1)))),
                              const SizedBox(height: 8),
                              Container(
                                  width: 312,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        width: 2,
                                        color:
                                            const Color.fromRGBO(74, 181, 90, 1)),
                                  ),
                                  child:  TextField(
                                    controller: descController,
                                    decoration: InputDecoration(
                                      
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: " Enter job description ",
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
                                  child:  TextField(
                                    controller: budgetController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Enter your budget ",
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
                                  child: Text('Deadline',
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
                                    controller: deadlineController,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Enter your deadline in format yyyy-Mm-dd",
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
                                  child: Text('Contact no.',
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
                                    controller: contactController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: "Enter your contact no.",
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
                            onPressed: ()
                            { 
                              updatepostData();
                              showSnackBar(context, "Post Have Been Sent For The Review");
                        Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(
                            builder: (context) => HomePage()),(Route<dynamic> route) => false);}
                            ,
                            child: Text('Submit Details',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(255, 255, 255, 1))),
                          ),
                        )),
                  ])),
            
          ]),
        ),

        bottomNavigationBar: BottomBar());
  }void updatepostData() async{
     final ap = Provider.of<AuthProvider>(context, listen: false);
    PostModel postModel = PostModel(
      uid : ap.userModel!.uid,
      title: titleController.text,
        desc: descController.text,
      contact: contactController.text.trim(),
      budget: budgetController.text.trim(),
      deadline: deadlineController.text,
      approval: "false",
    );
    ap.createPost(postModel: postModel);
  }
 @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    deadlineController.dispose();
  budgetController.dispose();
    descController.dispose();
    contactController.dispose();

    super.dispose();
  }
}
