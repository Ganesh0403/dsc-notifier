import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  String uid = 'kGuY7t3VBpZJOOOOVWHwYZzTCUJ3';
  Map data = {
    "name":"EMPTY"
  };

  getUId() async {
    final user = await FirebaseAuth.instance.currentUser;
    uid = user.uid;
    print("UID ==========> "+uid);
  }

  addData() {
    Map<String,dynamic> demodata = {
      "name" : "Added Automatically !",
    };
    DocumentReference collectionReference = FirebaseFirestore.instance.collection('users').document(uid);
    collectionReference.get()
    .then((snapshot) => {
      if (snapshot.exists) {
        print("Exists Already")
      } else {
        collectionReference.set(demodata)
      }
    });

  }

  fetchData() {
    DocumentReference documentReference = FirebaseFirestore.instance.collection('users').document(uid);
    documentReference.snapshots().listen((snapshot) {
      setState(() {
        // ignore: deprecated_member_use
        data = snapshot.data();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("NOTHING TO SHOW"),
      ),
    );
  }
}