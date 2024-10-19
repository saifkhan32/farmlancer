import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmlancer/Components/Bottom_bar.dart';
import 'package:farmlancer/apply_screen.dart';
import 'package:farmlancer/services/filter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: SizedBox(
                width: 500,
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text('नमस्ते ',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                          color: const Color.fromRGBO(0, 0, 0, 1))),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Container(
                margin: const EdgeInsets.all(5),
                width: MediaQuery.sizeOf(context).width,
                height: 40,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            width: 102,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(73, 116, 227, 1),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 60,
                                height: 23,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FilterData(title: 'On Field')));
                                  },
                                  child: Text('On Field',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      )),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                            width: 102,
                            height: 37,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(74, 181, 90, 1),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 60,
                                height: 23,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FilterData(
                                                  title: 'Transport',
                                                )));
                                  },
                                  child: Text('Transport',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      )),
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                            width: 102,
                            height: 37,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(74, 181, 90, 1),
                              border: Border.all(
                                  width: 1,
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                                width: 60,
                                height: 23,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FilterData(
                                                  title: 'Support',
                                                )));
                                  },
                                  child: Text('Support',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      )),
                                ))),
                      ),
                    ])),
            const SizedBox(
              height: 20,
            ),
            Container(
                width: MediaQuery.sizeOf(context).width,
                height: 34,
                margin: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 130,
                          height: 36,
                          child: Text('Find Work',
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ))),
                      const Spacer(),
                      Container(
                          margin: const EdgeInsets.only(right: 15),
                          width: 70,
                          height: 18,
                          child: Text('Show more',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(117, 117, 117, 1),
                              )))
                    ])),
            Expanded(
              child: StreamBuilder(
                  stream: _firestore
                      .collection('post')
                      .where("approval", isEqualTo: "true")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final QueryDocumentSnapshot documentReference =
                              snapshot.data!.docs[index];

                          return SingleChildScrollView(
                              child: SizedBox(
                            child: ListTile(
                              title: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title - ' + documentReference["title"]),
                                  Text('Description - ' +
                                      documentReference["desc"]),
                                  Text('Budget - ' +
                                      documentReference["budget"]),
                                  Text('Deadline - ' +
                                      documentReference["deadline"]),
                                ],
                              ),
                              trailing: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty
                                      .all<Color>(Colors.green),
                                ),
                                child: Text("Apply"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ApplyScreen(
                                                uid: documentReference["uid"],
                                              )));
                                },
                              ),
                            ),
                          ));
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      );
                    }
                    return Center(child: Text("No Post To Show"));
                  }),
            )
          ]),
        ),
        bottomNavigationBar: BottomBar());
  }
}
