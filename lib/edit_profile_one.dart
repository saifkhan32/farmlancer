import 'dart:io';

import 'package:farmlancer/home_page.dart';
import 'package:farmlancer/model/model.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileUi extends StatefulWidget {
  const EditProfileUi({super.key});

  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUi> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  // For selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color.fromRGBO(0, 0, 0, 1))),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(children: [
          Center(
            child: Stack(
              children: [
                InkWell(
                  onTap: () => selectImage(),
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
                          backgroundImage: FileImage(image!),
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
          buildTextField("Name", nameController, "Enter your Name"),
          buildTextField("E-mail", emailController, "Enter your email"),
          buildTextField(
              "Mobile Number", phoneController, "Enter your Mobile no."),
          buildTextField("Address", addressController, "Enter your Address"),
          const SizedBox(height: 40),
          Container(
            width: 300,
            height: 48,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(74, 181, 90, 1),
                borderRadius: BorderRadius.circular(100)),
            child: TextButton(
              onPressed: () => storeData(),
              child: Text('Submit',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(255, 255, 255, 1))),
            ),
          ),
        ]),
      ),
    );
  }

  // Build a common text field
  Widget buildTextField(
      String label, TextEditingController controller, String hint) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      width: 312,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          SizedBox(
              width: 114,
              height: 19,
              child: Text(label,
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
                    width: 1, color: const Color.fromRGBO(196, 196, 196, 1)),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: hint,
                  border: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }

  // Store data to the database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: phoneController.text.trim(), // Use the phone number entered
      uid: "", // Keep UID null as per requirement
      role: 'user',
    );

    // Ensure phone number is not empty
    if (userModel.phoneNumber.isEmpty) {
      showSnackBar(context, "Phone number is required for Google sign-in.");
      return;
    }

    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then((value) => ap.setSignIn().then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route<dynamic> route) => false);
              }));
        },
      );
    } else {
      showSnackBar(context, "Please upload a profile picture.");
    }
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    nameController.dispose();
    addressController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
