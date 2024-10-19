// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmlancer/edit_profile_one.dart';
import 'package:farmlancer/model/model.dart';
import 'package:farmlancer/model/model2.dart';
import 'package:farmlancer/otp_screen.dart';
import 'package:farmlancer/services/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Phone Authentication
class AuthProvider extends ChangeNotifier {
  String user1 = '';
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fire = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String? _uid;
  String? get uid => _uid; // Removed force unwrap
  UserModel? _userModel;
  UserModel? get userModel => _userModel; // Removed force unwrap
  PostModel? _postModel;
  PostModel? get postModel => _postModel;

  AuthProvider() {
    checkSignIn();
  }

//Check whether user is signed in before or not
  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  Future setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool("is_signedin", true);
    _isSignedIn = true;
    notifyListeners();
  }

  void signInwithPhone(BuildContext context, String phoneNumber) async {
    user1  = '';
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted:
              (PhoneAuthCredential phoneAuthCredential) async {
            await _auth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            throw Exception(error.message);
          },
          codeSent: (verificationId, forceResendingToken) {
            if (context.mounted) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          OtpScreen(verificationId: verificationId)));
            }
          },
          codeAutoRetrievalTimeout: (verificationID) {});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }

//verify otp
  void verifyOtp(
      {required BuildContext context,
      required String verificationId,
      required String userOtp,
      required Function onSuccess}) async {
    _isLoading = true;
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);

      User? user = (await _auth.signInWithCredential(creds)).user;

      if (user != null) {
        _uid = user.uid;
        onSuccess();
      }
      _isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

  //Database Operations
  Future<bool> checkExistingUser() async {
    if (_uid == null) return false;

    DocumentSnapshot snapshot = await _fire.collection("users").doc(_uid).get();
    if (snapshot.exists) {
      log("USER EXISTS");
      return true;
    } else {
      log("NEW USER");
      return false;
    }
  }

  void saveUserDataToFirebase({
    required BuildContext context,
    required UserModel userModel,
    dynamic profilePic,
    required Function onSuccess,
  }) async {
    _isLoading = true;
    notifyListeners();

    if (_auth.currentUser == null) {
      showSnackBar(context, "User not signed in.");
      _isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await storeFileToStorage("profilePic/$_uid", profilePic).then((value) {
        userModel.profilePic = value;
        userModel.createdAt = DateTime.now().millisecondsSinceEpoch.toString();
        if (user1 != "Google") {
          userModel.phoneNumber = _auth.currentUser!.phoneNumber!;
          userModel.uid = _auth.currentUser!.phoneNumber!;
        } else {
          userModel.uid = userModel.phoneNumber;
        }
      });
      _userModel = userModel;

      await _fire
          .collection("users")
          .doc(_uid)
          .set(userModel.toMap())
          .then((value) {
        onSuccess();
        _isLoading = false;
        notifyListeners();
      });
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
      _isLoading = false;
      notifyListeners();
    }
  }

//Photo in storage
  Future<String> storeFileToStorage(String ref, File file) async {
    UploadTask uploadTask = _storage.ref().child(ref).putFile(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future getDataFromFirestore() async {
    if (_auth.currentUser == null) return;

    await _fire
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      _userModel = UserModel(
          name: snapshot.get('name') ?? '',
          email: snapshot.get('email') ?? '',
          createdAt: snapshot.get('createdAt') ?? '',
          address: snapshot.get('address') ?? '',
          uid: snapshot.get('uid') ?? '',
          profilePic: snapshot.get('profilePic') ?? '',
          phoneNumber: snapshot.get('phoneNumber') ?? '',
          role: snapshot.get('role') ?? '');
      _uid = _userModel!.uid;
    });
  }

  // STORING DATA LOCALLY
  Future saveUserDataToSP() async {
    if (_userModel == null) return;

    SharedPreferences s = await SharedPreferences.getInstance();
    await s.setString("user_model", jsonEncode(_userModel!.toMap()));
  }

  Future getDataFromSP() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String data = s.getString("user_model") ?? '';
    _userModel = UserModel.fromMap(jsonDecode(data));
    _uid = _userModel?.uid;
    notifyListeners();
  }

  Future userSignOut() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    await _auth.signOut();
    // await googleSignIn.signOut();
    _isSignedIn = false;
    notifyListeners();
    s.clear();
  }

  //Post Data
  Future<void> createPost({
    required PostModel postModel,
  }) async {
    await _fire.collection("post").doc().set(postModel.toMap());
  }

  Future<void> createApplicants({
    required ApplicantModel applicationModel,
  }) async {
    await _fire.collection("applicants").doc().set(applicationModel.toMap());
  }

  // Google Sign-In
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      user1 = 'Google';
      EasyLoading.show();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      EasyLoading.dismiss();
      if (googleUser == null) {
        showSnackBar(context, "Sign-in process was canceled by the user.");
        return null;
      }


      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Navigate to the next screen after a successful sign-in
if(googleUser != null)
  {

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => EditProfileUi()),
  );

  }
  return userCredential;
    } on FirebaseAuthException catch (e) {
      log('Error during Google sign-in: ${e.code} ${e.message}');
      showSnackBar(context, "Google sign-in failed: ${e.message}");
    }
    return null;
  }

 
}
