import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    // if(dataList.length!=0)return;
    CollectionReference ref = Firestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).collection('channels');
    CollectionReference reference=Firestore.instance.collection('channels');
    QuerySnapshot querySnapshot=await reference.getDocuments();
    QuerySnapshot eventsQuery = await ref
        .getDocuments();

    eventsQuery.documents.forEach((document) {
      querySnapshot.documents.forEach((element) {
        if(element.id.toString().trim()==document['id'].toString().trim()){
          // print("ok");
          setState(() {
            dataList.add(
              GestureDetector(
                child: ChannelWidget(
                  img: element['img'],
                  uid: element.id,
                  name: element['name'],
                  description: element["description"],
                ),
              ),
            );
          });
        }
      });
      // Firestore.instance.collection("channels").doc(document[''])
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


// class ChannelsScreen extends StatelessWidget {
//   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
//   List<Widget> dataList;
//   Future<void> list() async {
//     // if(dataList.length!=0)return;
//     CollectionReference ref = Firestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).collection('channels');
//     CollectionReference reference=Firestore.instance.collection('channels');
//     QuerySnapshot querySnapshot=await reference.getDocuments();
//     QuerySnapshot eventsQuery = await ref
//         .getDocuments();
//
//     eventsQuery.documents.forEach((document) {
//       querySnapshot.documents.forEach((element) {
//         if(element.id.toString().trim()==document['id'].toString().trim()){
//           print("ok");
//           setState(() {
//             dataList.add(
//               GestureDetector(
//                 child: ChannelWidget(
//                   img: element['img'],
//                   uid: element.id,
//                   name: element['name'],
//                   description: element["description"],
//                 ),
//               ),
//             );
//           });
//         }
//       });
//       // Firestore.instance.collection("channels").doc(document[''])
//     });
//   }
//   Widget _buildChannelsList(BuildContext context) {
//     return Expanded(
//       child: Container(
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.indigo,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Subscriptions',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Center(
//                       child: Text(
//                         dataList.length.toString(),
//                         style: TextStyle(
//                             color: Colors.indigo, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.only(top: 10),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: dataList,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return _buildChannelsList(context);
//   }
// }
//
// class FireStorageService extends ChangeNotifier {
//   FireStorageService();
//   static Future<dynamic> loadImage(BuildContext context, String image) async {
//     var url = await FirebaseStorage.instance
//         .ref()
//         .child("channels_images/" + image)
//         .getDownloadURL();
//     print(url);
//     return url;
//   }
// }
