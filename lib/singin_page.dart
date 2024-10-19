


import 'package:country_picker/country_picker.dart';
import 'package:farmlancer/coming_soon.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
// bool _passwordVisible = false;
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final phoneController = TextEditingController();
  Country country = Country(
    phoneCode: "91", 
    countryCode: "IN", 
    e164Sc: 0, 
    geographic: true, 
    level: 1,
     name: "India", 
     example: "India",
      displayName: "India",
       displayNameNoCountryCode: "IN",
        e164Key: ""
    );
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(offset: phoneController.text.length));
    return Scaffold(
        resizeToAvoidBottomInset : false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                    SizedBox(
                      width : MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
               
                child: Column(children: [
                  
                  SizedBox(
                      width: 194, height: 61, child: Image.asset('assets/farmLanser.png')),
                  const SizedBox(height: 30),
                  const SizedBox(
                      width: 219,
                      height: 27,
                      child: Text('Sign in to your account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 70, 67, 1),
                            // height:27.32,
                          ))),
                          SizedBox(height: 10,),
                          SizedBox(
                            width: 230,
                            height: 40,
                            child: Text('Add your phone number. We will send you a verification code',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                            ),textAlign: TextAlign.center,
                            ),
                          ),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: 312,
                      height: 75,
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 70,
                                height: 19,
                                child: Text('Mobile no.',
                                    style: GoogleFonts.manrope(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(0, 0, 0, 1)))),
                            const SizedBox(height: 8),
                            Container(
                                width: 312,
                                height: 48,
                                
                                padding: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color.fromRGBO(196, 196, 196, 1)),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  onChanged: (value){
                                    setState(() {
                                      phoneController.text = value;
                                    });
                                  },
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19,color: Colors.black45),
                                  decoration: InputDecoration(
                                    prefixIcon: Container(
                                      padding: EdgeInsets.all(5),
                                      child: InkWell(
                                        onTap: (){},
                                        child: Text(
                                          "${country.flagEmoji} +${country.phoneCode}",
                                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    suffixIcon: phoneController.text.length > 9 ?
                                    Container(
                                      height: 30,
                                      width: 30,
                                      margin: EdgeInsets.all(5.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green
                                      ),
                                      child: const Icon(
                                        Icons.done,
                                       color:  Colors.white,
                                       size: 20,
                                      ),
                                    ): null,
                                    contentPadding: const EdgeInsets.only(left: 20),
                                    hintText: "Enter your mobile no ",
                                    hintStyle: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),
                                    border: InputBorder.none,
                                  ),
                                ))
                          ])),
                  const SizedBox(height: 30),
                  const SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.only(left: 12.0),
                    child: RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'I have read and agreed to',
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(117, 117, 117, 1))),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' User Agreement ',
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 70, 67, 1))),
                      TextSpan(
                          text: 'and ',
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(117, 117, 117, 1))),
                      TextSpan(
                          recognizer: TapGestureRecognizer()..onTap = () {},
                          text: ' Privacy Policy ',
                          style: GoogleFonts.manrope(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(0, 70, 67, 1)),)
                    ])),
                  ),
                  const SizedBox(height: 30),
                  Container(
                      width: 312,
                      height: 48,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(74, 181, 90, 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: SizedBox(
                        width: 45,
                        height: 19,
                        child: TextButton(
                          child: Text('Sign in',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(255, 255, 255, 1))),
                        onPressed : () => sendPhoneNumber(),),
                      )),
            
                  const SizedBox(height: 15),
                SizedBox(
                    height: 15,
                  ),
                  // SizedBox(
                  //   height: 48,
                  //   width: 312,
                  //   child: OutlinedButton.icon(
                  //     style: OutlinedButton.styleFrom(
                  //         shape: StadiumBorder(),
                  //         side: BorderSide(color: Colors.grey.shade300),
                  //         backgroundColor: Colors.white),
                  //     icon: Image.asset(
                  //       'assets/googleicon.png',
                  //       height: 24,
                  //     ),
                  //     onPressed: () async {
                  //       final ap =
                  //           Provider.of<AuthProvider>(context, listen: false);
                  //       await ap.signInWithGoogle(context); 
                  //     },
                  //     label: Text(
                  //       'Sign in using Google',
                  //       style: GoogleFonts.manrope(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600,
                  //           color: Color.fromRGBO(117, 117, 117, 1)),
                  //     ),
                  //   ),
                  // ),
                      SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: SizedBox(
                    
                        width: 300,
                        height: 16,
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Dont have an account?  ',
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(117, 117, 117, 1))),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () { Navigator.push(context, MaterialPageRoute(builder: (context)=> ComingSoonScreen()));
                              },
                              text: 'Create Account',
                              style: GoogleFonts.manrope(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(0, 70, 67, 1))),
                        ])),
                      ),
                  ),
                  
                ]))
                  ]),
            ),
          ),
    );
  }
void sendPhoneNumber()
{
  final ap = Provider.of<AuthProvider>(context,listen : false);
  String phoneNumber = phoneController.text.trim();
  ap.signInwithPhone(context, "+${country.phoneCode}$phoneNumber");
}
  }

