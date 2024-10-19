
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmlancer/Notifications/send_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DataList extends StatelessWidget {
  DataList({super.key});

  final CollectionReference dataf =
      FirebaseFirestore.instance.collection('post');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: StreamBuilder(
          stream: dataf.where("approval", isEqualTo: "false").snapshots(),
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
                      height: 200,
                      width: 100,
                      child: ListTile(
                        title: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title - ' + documentReference["title"]),
                            Text('Description - ' + documentReference["desc"]),
                            Text('Budget - ' + documentReference["budget"]),
                            Text('Deadline - ' + documentReference["deadline"]),
                          ],
                        ),
                        trailing: Wrap(
                          children: <Widget>[
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              FloatingActionButton.small(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.check),
                                onPressed: () async  {
                                  print(documentReference.id);
                                  approvePost(documentReference.id);
                                  EasyLoading.show();
                                    await SendNotificationService.sendNotificationUsingApi(
                                      token: '', 
                                      title: "Hey Annadata!", 
                                      body: "A new job has been updated! Apply Now",
                                       data: {});
                                       EasyLoading.dismiss();
                                       
                                },
                              ),
                              FloatingActionButton.small(
                                backgroundColor: Colors.green,
                                child: Icon(Icons.close),
                                onPressed: () {
                                  disapprovePost(documentReference.id);
                                },
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              );
            } else {
              return Center(child: Text("No Post To Approve"));
            }
          }),
    );
  }

  // Function to approve a post
  Future<void> approvePost(String index) async {
    await dataf.doc(index).update({
      'approval': "true",
    });
    
  }

  Future<void> disapprovePost(String index) async {
    await dataf.doc(index).delete();
  }
}
