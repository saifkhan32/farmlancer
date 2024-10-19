import 'package:farmlancer/services/list_data.dart';
import 'package:flutter/material.dart';

class AdminApprovalPage extends StatelessWidget {

 const AdminApprovalPage({super.key});


  // Function to build a single post item for admin approval


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Admin Approval'),
      ),
      body: DataList());
  }
}