import 'package:farmlancer/edit_profile_one.dart';
import 'package:farmlancer/home_page.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:farmlancer/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<AuthProvider>(context, listen: true).isLoading;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: isLoading == true ? Center(child: CircularProgressIndicator(
              color: Colors.green,
            ))
                :Column(children: [
                Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: (){},
                  child: const Icon(Icons.arrow_back),
                )),
              Container(
                  width: MediaQuery
                      .sizeOf(context)
                      .width,
                  height: MediaQuery
                      .sizeOf(context)
                      .height,
                  margin: const EdgeInsets.all(10),
                  child: Column(children: [
                    SizedBox(
                        width: 194,
                        height: 61,
                        child: Image.asset('assets/farmLanser.png')),
                    const SizedBox(height: 30),
                    const SizedBox(
                        width: 219,
                        height: 27,
                        child: Text('Verification',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 70, 67, 1),
                              
                              // height:27.32,
                            ),
                            textAlign: TextAlign.center)),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 230,
                      height: 40,
                      child: Text('Enter the otp sent to your mobile phone',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                        ), textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // SizedBox(
                    //     width: 312,
                    //     height: 75,
                    //     child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           SizedBox(
                    //               width: 67,
                    //               height: 19,
                    //               child: Text('Password',
                    //                   style: GoogleFonts.manrope(
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w600,
                    //                       color: const Color.fromRGBO(
                    //                           0, 0, 0, 1)))),
                    //           const SizedBox(height: 8),
                            //   Container(
                            //       width: 312,
                            //       height: 48,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(8),
                            //         border: Border.all(
                            //             width: 1,
                            //             color: const Color.fromRGBO(
                            //                 196, 196, 196, 1)),
                            //       ),
                            //       child: Container(
                            //           margin: const EdgeInsets.only(top: 10),
                            //           child: TextField(
                            //             obscureText: !_passwordVisible,
                            //             decoration: InputDecoration(
                            //               contentPadding: EdgeInsets.only(
                            //                   left: 20),
                            //
                            //               hintText: "Enter your password",
                            //               border: InputBorder.none,
                            //
                            //               suffixIcon: IconButton(
                            //                 icon: Icon(
                            //                   // Based on passwordVisible state choose the icon
                            //                   _passwordVisible
                            //                       ? Icons.visibility
                            //                       : Icons.visibility_off,
                            //
                            //                 ), onPressed: () {
                            //                 setState(() {
                            //                   _passwordVisible =
                            //                   !_passwordVisible;
                            //                 });
                            //               },
                            //               ),
                            //             ),
                            //           ))
                            //   )
                            // ])),
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green.shade400,
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 50,
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.green),
                        child: Text("Verify"),
                        onPressed: () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          } else {
                            showSnackBar(context, "Enter 6-Digit code");
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Didn't receive any code?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                        "Resend New Code",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        )),
                    // const SizedBox(height: 30),
                    // SizedBox(
                    //     width: 312,
                    //     height: 73,
                    //     child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           SizedBox(
                    //               width: 167,
                    //               height: 19,
                    //               child: Text('Confirm Password',
                    //                   style: GoogleFonts.manrope(
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.w600,
                    //                       color: const Color.fromRGBO(0, 0, 0, 1)))),
                    //           const SizedBox(height: 8),
                    //           Container(
                    //               width: 312,
                    //               height: 46,
                    //               decoration: BoxDecoration(
                    //                 borderRadius: BorderRadius.circular(8),
                    //                 border: Border.all(
                    //                     width: 1,
                    //                     color: const Color.fromRGBO(196, 196, 196, 1)),
                    //               ),
                    //               child: Container(
                    //                 margin: const EdgeInsets.only(top: 10),
                    //                 child: TextField(
                    //                   obscureText : !_passwordVisible2,
                    //                   decoration: InputDecoration(
                    //                       contentPadding: const EdgeInsets.only(left: 20),
                    //                       hintText: "Enter your confirmed password ",
                    //                       border: InputBorder.none,
                    //                          suffixIcon: IconButton(
                    //                             icon: Icon(
                    //                               // Based on passwordVisible state choose the icon
                    //                               _passwordVisible2
                    //                               ? Icons.visibility
                    //                               : Icons.visibility_off,
                    //
                    //                               ), onPressed: () {
                    //                                 setState(() {
                    //                                   _passwordVisible2 = !_passwordVisible2;
                    //                                 });
                    //
                    //                                },
                    //                   )),
                    //                 ),
                    //               ))
                    //         ])),
                    // const SizedBox(height: 30),
                    // SizedBox(
                    //     width: 290,
                    //     height: 38,
                    //     child: Text(
                    //         'I have read and agreed to User Agreement and Privacy Policy',
                    //         style: GoogleFonts.manrope(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.w600,
                    //             color: const Color.fromRGBO(117, 117, 117, 1)))),
                    // const SizedBox(height: 30),
                    // Container(
                    //     width: 312,
                    //     height: 48,
                    //     decoration: BoxDecoration(
                    //         color: const Color.fromRGBO(74, 181, 90, 1),
                    //         borderRadius: BorderRadius.circular(100)),
                    //     child: Container(
                    //       width: 50,
                    //       height: 19,
                    //       child: TextButton(
                    //         onPressed: () {
                    //           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    //          },
                    //         child: Text('Sign up',
                    //             textAlign: TextAlign.center,
                    //             style: GoogleFonts.manrope(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: const Color.fromRGBO(255, 255, 255, 1))),
                    //       ),
                    //     )),
                    const SizedBox(height: 30),
                  ]))
            ]),
          ),
        ));
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: (){
      // checking whether user exists or not
          ap.checkExistingUser().then((value) async
          {
            if(value == true)
              {
                //user exists
                 ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
              }
              else
                {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileUi(),
                    ),
                          (Route<dynamic> route) => false
                  );
                }
          });
        });
  }

}
