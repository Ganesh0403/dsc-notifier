import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notification/pages/channelScreen.dart';
import 'package:notification/widgets/channel.dart';
import 'package:firebase_storage/firebase_storage.dart';

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChannelScreen(docId: element['name'],channelDescription: element["description"],)));
            },
            child: ChannelWidget(
              img: element['img'],
              // uid: element.id,
              name: element['name'],
              description: element["description"],
              private: element["mode"],
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