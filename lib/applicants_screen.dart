

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmlancer/services/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicantsScreen extends StatelessWidget {
ApplicantsScreen({super.key});

  final CollectionReference dataf = FirebaseFirestore.instance.collection('applicants');
  @override
  Widget build(BuildContext context) {
     final ap = Provider.of<AuthProvider>(context, listen: false);
     String uid = ap.userModel!.phoneNumber;
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Applicant Details'),
      ),
      body:  SizedBox
      (
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: StreamBuilder(
            stream: dataf.where("uid" , isEqualTo: uid).snapshots(),
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
                height: 200,
                width: 100,
                child: ListTile(
                 
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [
                        
                        Text('Name - '+ documentReference["name"]),
                         Text('Budget Expectations - Rs ' + documentReference["budget"]),
                      Text('Phone No - '+ documentReference["contact"]),
                         Text('Work Applied For - '+ documentReference["work"]),
                         Text('${'Time Availability - '+ documentReference["time"]} hours')
                      ],
                    ),
                   
                    
                  ),
                        
                
                    
                  ),
              );
          
          }, separatorBuilder: (BuildContext context, int index) { 
        return Divider();
           },
         );
        }
        else
        {
        return Center(child: Text("No Applicants"));}
        }),
      ),
    );
        }
          
  }
