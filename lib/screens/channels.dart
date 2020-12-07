import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notification/widgets/channel.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChannelsScreen extends StatelessWidget {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: StreamBuilder<QuerySnapshot>(
          stream: _firebaseFirestore.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("channels").snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final taskListFromFirebase = snapshot.data.docs;
            List<ChannelWidget> dataList = [];
            for (var tasksData in taskListFromFirebase) {
              var taskDetails = tasksData.data();
              dataList.add(
                ChannelWidget(
                  img: taskDetails['img'],
                  uid: tasksData.id,
                  name: taskDetails['name'],
                  description: taskDetails["description"],
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

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String image) async {
    var url = await FirebaseStorage.instance
        .ref()
        .child("channels_images/" + image)
        .getDownloadURL();
    print(url);
    return url;
  }
}
