import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notification/database/circular.dart';
import 'package:notification/widgets/post.dart';

class ChannelScreen extends StatelessWidget {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String docId,channelDescription;

  ChannelScreen({Key key, this.docId, this.channelDescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(docId),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Text(channelDescription),
            StreamBuilder<QuerySnapshot>(
              // .doc(docId).collection("data")
                stream: _firebaseFirestore.collection("public").where('channels',arrayContainsAny: [docId]).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  final taskListFromFirebase = snapshot.data.docs;
                  List<Widget> dataList = [];
                  for (var tasksData in taskListFromFirebase) {
                    var taskDetails = tasksData.data();
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
                          date: taskDetails['date'],
                        ),
                        // dataFromDatabase: ,
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
          ],
        ),
      ),
    );
  }
}