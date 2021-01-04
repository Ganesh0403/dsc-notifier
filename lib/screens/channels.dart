import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notification/models/Circular.dart';
import 'package:notification/widgets/channel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:notification/widgets/post.dart';

class ChannelsScreen extends StatefulWidget {
  @override
  _ChannelsScreenState createState() => _ChannelsScreenState();
}

class _ChannelsScreenState extends State<ChannelsScreen> {
  List<Widget> dataList=[];
  @override
  void initState() {
    list();
    super.initState();
  }
  Future<void> list() async {
    CollectionReference reference=Firestore.instance.collection('channels');
    QuerySnapshot querySnapshot=await reference.getDocuments();

    querySnapshot.documents.forEach((element) {
      setState(() {
        dataList.add(
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChannelScreen(docId: element.id,)));
            },
            child: ChannelWidget(
              img: element['img'],
              uid: element.id,
              name: element['name'],
              description: element["description"],
            ),
          ),
        );
      });
    });
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


class ChannelScreen extends StatelessWidget {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final String docId;

  ChannelScreen({Key key, this.docId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channel Data"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: StreamBuilder<QuerySnapshot>(
            stream: _firebaseFirestore.collection("channels").doc(docId).collection("data").snapshots(),
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
      ),
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