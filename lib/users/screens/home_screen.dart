import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zetcare/dashboard/userdashboard/main_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${auth.currentUser?.email}'),
      // ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(auth.currentUser?.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Error: ${snapshot.error}');
          }
          switch(snapshot.connectionState){
            case ConnectionState.waiting:return const Text("Loading..");
            default:
              return checkRole(snapshot.data);
          }
        },
      ),
    );
  }

  Widget checkRole(DocumentSnapshot<Object?>? snapshot) {
    if (snapshot == null || !snapshot.exists) {
      // Handle case when snapshot is null or doesn't exist
      return const Center(child: Text('Snapshot is null or does not exist'));
    }

    final data = snapshot.data() as Map<String, dynamic>?;

    if (data != null && data['role'] == "ngo") {
      return ngopage(snapshot);
    } else if (data != null && data['role'] == "hospital") {
      return hospitalpage(snapshot);
    } else {
      return userpage(snapshot);
    }
  }


  Widget ngopage(DocumentSnapshot<dynamic> snapshot) {
    // Implement the logic for the NGO page
    return const Center(child: Text('NGO Page'));
  }

  Widget hospitalpage(DocumentSnapshot<dynamic> snapshot) {
    // Implement the logic for the hospital page
    return const Center(child: Text('Hospital Page'));
  }

  Widget userpage(DocumentSnapshot<dynamic> snapshot) {
    // Implement the logic for the user page
    return const MainScreen();
  }
}
