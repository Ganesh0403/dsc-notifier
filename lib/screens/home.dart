import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notification/models/Circular.dart';
import 'package:notification/widgets/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future public;

  @override
  void initState() {
    super.initState();
    public = _getPublicSnapshots();
  }

  _getPublicSnapshots() async {
    QuerySnapshot qn =
    await _firebaseFirestore.collection("public").getDocuments();
    return qn.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: public,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading..."),
              );
            }
            final taskListFromFirebase = snapshot.data;
            List<PostWidget> dataList = [];
            var box=Hive.box('myBox');
            for (var tasksData in taskListFromFirebase) {
              var taskDetails = tasksData.data();
              print(box.get(taskDetails['id'].toString().trim()));
              dataList.add(
                PostWidget(
                  circular: new Circular(
                      title: taskDetails['title'],
                      content: taskDetails['content'],
                      imgUrl: taskDetails['imgUrl'],
                      author: taskDetails['author'],
                      id: taskDetails['id'],
                      files: taskDetails['files'],
                      channels: taskDetails['channels'],
                      dept: taskDetails['dept'],
                      year: taskDetails['year'],
                      division: taskDetails['division'],
                      date:DateTime.fromMicrosecondsSinceEpoch(taskDetails['date'].microsecondsSinceEpoch),
                  ),
                  dataFromDatabase: box.get(taskDetails['id'].toString().trim())??false,
                  // files: ,
                ),
              );
            }
            return ListView.separated(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return dataList[index];
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2.0,
                );
              },
            );
          }),
    );
  }
}
