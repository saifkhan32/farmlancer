import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Askai extends StatefulWidget {
  const Askai({super.key});

  @override
  State<Askai> createState() => _AskaiState();
}

class  _AskaiState extends  State<Askai>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          // width:374,height:598,

          margin: const EdgeInsets.only(
            left: 9,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text('Ask AI Former',
                  style: GoogleFonts.poppins(
                    color: const Color.fromRGBO(21, 101, 78, 1),
                    fontSize: 16,
                  ))
            ]),
          )),
      const SizedBox(height: 5),
      SizedBox(
          width: 342,
          height: 38,
          child: Text(
              'Please help me to re-managed my task based on the latest monitering data',
              style: GoogleFonts.poppins(
                color: const Color.fromRGBO(13, 24, 20, 1),
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ))),
      const SizedBox(height: 5),
      Expanded(
        child: SizedBox(
            width: 342,
            height: 290,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(143, 224, 151, 1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                            'Of course, here’s your new task based on latest monitoring data',
                            style: GoogleFonts.poppins(
                              color: Color.fromRGBO(13, 24, 20, 1),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            )),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          width: 278,
                          height: 80,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                'Of course, here’s your new task based on latest monitoring data',
                                style: GoogleFonts.poppins(
                                  color: const Color.fromRGBO(13, 24, 20, 1),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                )),
                          ),
                        ),
                      ),
                    ],
                  )),
            )),
      ),
      SizedBox(
          width: 342,
          height: 48,
          child: Row(children: [
            Container(
                width: 282,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    border: Border.all(
                        width: 1,
                        color: const Color.fromRGBO(288, 231, 230, 1))),
                child: const TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20),
                    hintText: "Ask your question ",
                    border: InputBorder.none,
                  ),
                )),
            const SizedBox(width: 2),
            SizedBox(width: 48, height: 48, child: Image.asset('assets/Frame.png'))
          ]))
    ]));
  }
}

