import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:notification/database/moor_database.dart';
import 'package:notification/widgets/post.dart';

class HomeScreen extends StatelessWidget {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // final fcm=FirebaseMessaging();
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
                  circular: new Circular(
                      avatarUrl: taskDetails["avatarUrl"],
                      channelName: taskDetails["channelName"],
                      authorName: taskDetails["authorName"],
                      date: taskDetails["date"],
                      imageUrl: taskDetails["imageUrl"],
                      textBody: taskDetails["textBody"],
                      fileCount:  taskDetails["fileCount"],
                      channelId: taskDetails["id"]),
                  files: taskDetails["files"],
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