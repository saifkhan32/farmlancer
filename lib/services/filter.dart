import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmlancer/apply_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class FilterData extends StatefulWidget {
  String title;
  
  FilterData({super.key,required this.title});

  @override
  State<FilterData> createState() => _FilterDataState();
}

class _FilterDataState extends State<FilterData> {
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
      title : Text(widget.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: const Color.fromRGBO(0, 0, 0, 1))),
                        centerTitle: true,),
      body : StreamBuilder(
          
            stream: _firestore.collection('post')
            .where("desc" , isEqualTo: widget.title)
            .where("approval" , isEqualTo: "true").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
        
              else if (snapshot.hasData) {
                
         return ListView.separated(
           itemCount: snapshot.data!.docs.length,
           shrinkWrap: true,
           
          itemBuilder: (context,index)
          {
            final QueryDocumentSnapshot documentReference = snapshot.data!.docs[index];
            return SingleChildScrollView(
              child: SizedBox(
              
                child: ListTile(
                 
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        
                        Text('Title - '+ documentReference["title"]),
                         Text('Description - ' + documentReference["desc"]),
                      Text('Budget - '+ documentReference["budget"]),
                         Text('Deadline - '+ documentReference["deadline"]),
                      ],
                    ),
                  
                    trailing:  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                              child: Text("Apply"),
                              onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ApplyScreen(uid: documentReference["uid"],)));
                              },
                            ),
                            
                  ),
                        
                
                    
                  
              ));
          
          }, separatorBuilder: (BuildContext context, int index) { 
        return Divider();
           },
         );
        }
        return Center(child: Text("No Post To Approve"));}),
    );
  }
}