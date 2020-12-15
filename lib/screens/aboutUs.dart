import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:notification/models/developer.dart';
import 'package:notification/widgets/channel.dart';


class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  String uid = 'kGuY7t3VBpZJOOOOVWHwYZzTCUJ3';
  Map data = {
    "name":"EMPTY"
  };
  List<Widget> dataList=[];
  var list=["abhishekove","ShreyaPillai","Ganesh0403","taha2218"];
  Future<Developer> fetchDeveloper(String string) async {
    final response=await http.get("https://api.github.com/users/$string");
    if(response.statusCode==200){
      return Developer.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception("Failed to load developer");
    }
  }
  developers(){
    list.forEach((element) {
      fetchDeveloper(element).then((value){
        setState(() {
          dataList.add(
              ChannelWidget(
                img: value.avatarUrl.toString(),
                uid: "okok",
                name: value.login.toString(),
                description: value.bio.toString(),
              )
          );
        });
      });
    });
  }

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
  void initState() {
    // TODO: implement initState
    developers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: dataList,
        ),
      ),
    );
  }
}