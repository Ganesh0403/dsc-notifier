import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notification/widgets/post.dart';

class HomeScreen extends StatelessWidget {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // Future<void> list() async {
  //   // if(dataList.length!=0)return;
  //   CollectionReference ref = Firestore.instance.collection('channels');
  //   QuerySnapshot eventsQuery = await ref
  //       .getDocuments();
  //
  //   eventsQuery.documents.forEach((document) {
  //     print(document['name']);
  //     setState(() {
  //       dataList.add(
  //         ChannelWidget(
  //           img: document['img'],
  //           uid: document.id,
  //           name: document['name'],
  //           description: document["description"],
  //         ),
  //       );
  //     });
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("public").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final taskListFromFirebase = snapshot.data.docs;
            List<PostWidget> dataList = [];
            for (var tasksData in taskListFromFirebase) {
              var taskDetails = tasksData.data();
              dataList.add(
                PostWidget(
                  avatarUrl: taskDetails["avatarUrl"],
                  channelName: taskDetails["channelName"],
                  authorName: taskDetails["authorName"],
                  date: taskDetails["date"],
                  imageUrl: taskDetails["imageUrl"],
                  textBody: taskDetails["textBody"],
                  fileCount: taskDetails["fileCount"],
                  channelId: taskDetails["id"],
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