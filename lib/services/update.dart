import 'dart:io';

import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
// for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
        
      title : Text('Profile',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: const Color.fromRGBO(0, 0, 0, 1))),
                        centerTitle: true,),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: ListView(children: [
              Center(
                child: Stack(
                  children: [
               InkWell(
                        onTap: () {},
                        child: image == null
                            ? const CircleAvatar(
                                backgroundColor: Colors.purple,
                                radius: 50,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : CircleAvatar(
                                backgroundImage: NetworkImage(ap.userModel!.profilePic),
                                radius: 50,
                              ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 4, color: Colors.white),
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 312,
                  //height: 75,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: 114,
                            height: 19,
                            child: Text('Name',
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 1)))),
                        const SizedBox(height: 8),
                        Container(
                            width: 312,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: nameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                
                                hintText: ap.userModel?.name,
                                border: InputBorder.none,
                              ),
                            ))
                      ])),

              //const SizedBox(height: 20,),

              Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 312,
                  //height: 75,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 114,
                            height: 19,
                            child: Text('E-mail ',
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 1)))),
                        const SizedBox(height: 8),
                        Container(
                            width: 312,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                            ),
                            child:  TextField(
                              controller: emailController ,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: ap.userModel?.email,
                                border: InputBorder.none,
                              ),
                            ))
                      ])),

              Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 312,
                  //height: 75,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 114,
                            height: 19,
                            child: Text('Mobile Number',
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 1)))),
                        const SizedBox(height: 8),
                        Container(
                            width: 312,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                            ),
                            child:  TextField(
                              readOnly: true,
                            
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: ap.userModel?.phoneNumber,
                                border: InputBorder.none,
                              ),
                            ))
                      ])),

              Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: 312,
                  //height: 75,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            width: 114,
                            height: 19,
                            child: Text('Address',
                                style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: const Color.fromRGBO(0, 0, 0, 1)))),
                        const SizedBox(height: 8),
                        Container(
                            width: 312,
                            height: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                            ),
                            child: TextField(
                              controller: addressController,
                              readOnly: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: ap.userModel?.address,
                                border: InputBorder.none,
                              ),
                            ))
                      ])),

              const SizedBox(height: 40),
              Container(
                  width: 300,
                  height: 48,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(74, 181, 90, 1),
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    width: 45,
                    height: 19,
                   
                    child: TextButton(
                      onPressed: ()=> updateDocuments(),
                      child: Text('Update',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(255, 255, 255, 1))),
                    ),
                  )),
            ])),
        );
  }
   Future<void> updateDocuments() async {



   }


 @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    addressController.dispose();
  emailController.dispose();
    super.dispose();
  }
    
  }
