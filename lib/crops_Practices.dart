
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';



class Crops extends StatelessWidget {
  const Crops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {  
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp)),
          title: Center(
              child: Container(
                padding: EdgeInsets.only(right: 40),
               
                child: Text("Crops & Practices",
                  style: GoogleFonts.inter(
                    fontSize:20,
                    fontWeight: FontWeight.w600
                  ),
                ),
              )
          ),
        ),
        body: SingleChildScrollView(
            
            child: Center(
                  child: Container(
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 57 ),
                            child: Container(
                              height: 200,
                              width: 337,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(74, 181, 90, 1),
                                  width: 3
                                ),
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage('assets/farmersImg.png'), // Replace with your image path
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                       
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: SizedBox(
                              height: 121,
                              width: 364,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:"Work is worship !"'\n',
                                      style:GoogleFonts.inter(
                                        color: Color.fromRGBO(122, 232, 95, 1),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(height: 5), // Adds 16 pixels of space
                                    ),
                                    TextSpan(
                                        text:"So find work"'\n',
                                        style:GoogleFonts.inter(
                                          color: Color.fromRGBO(95, 232, 113, 1),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                        )
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(height: 10), // Adds 16 pixels of space
                                    ),
                                    TextSpan(
                                        text:"Get Work and Do Work"'\n',
                                        style:GoogleFonts.inter(
                                          color: Color.fromRGBO(111, 232, 95, 1),
                                          fontSize: 32,
                                          fontWeight: FontWeight.w700,
                                        )
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          ),
            
                          
                            Container(

                                  
                                child : Column(
                                    children: [
                                      Text(
                                         "Invite your friends to do work,"'\n',
                                          style:GoogleFonts.inter(
                                            color: Color.fromRGBO(95, 133, 232, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          )),
                                      
                                      Text(
                                        "Find work near you"'\n',
                                          style:GoogleFonts.inter(
                                            color: Color.fromRGBO(95, 133, 232, 1),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          )
                                      ),
                                    ]
                                
                              ),
                            ),
                          
                          SizedBox
                          (
                            height: 24,
                            child: GestureDetector(
                              onTap: (){},
                              child: Text("Terms and Conditions" '\n',
                                  style:GoogleFonts.inter(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  )
                              ),
                            ),
                          ),
                      
                            Container(
                              height: 15,
                              width: 230,
                            constraints: BoxConstraints(minHeight: 64),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(51, 95, 209, 1),
                              ),
                              child: Center(
                                child: TextButton(
                                  
                                  onPressed: () { 
                                       Share.share(
                              'Check out this amazing app: https://play.google.com/store/apps/details?id=com.mhtechin.farmlancer');
                                   },
                                  
                                  child: Text("INVITE FRIENDS",
                                    style:GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white
                                    ) ,
                                  ),
                                ),
                              ),
                            ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
          ),
    );
  }
}
