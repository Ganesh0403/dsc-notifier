
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification/models/Circular.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PostPage extends StatefulWidget {
  final Circular circular;
  final List files;

  const PostPage({Key key, this.circular, this.files}) : super(key: key);

  // PostWidget({this.dataFromDatabase=false, this.circular});
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  bool isPresent=false;
  String index;
  final fcm=FirebaseMessaging();
  @override
  void initState() {
    // list("");
    print("check check");
    fcm.configure(
      onLaunch: (Map<String,dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String,dynamic> message) async {
        print("onResume: $message");
      },
      onMessage: (Map<String,dynamic> message) async {
        print("onMessage: $message");
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post Details"
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(context),
                SizedBox(height: 12,),
                _buildImage(context),
                SizedBox(height: 12,),
                _buildTextBody(context),
                SizedBox(height: 12,),
                _buildLinkBody(context),
                _buildFooter(context),
                SizedBox(height: 12,),
                //TODO the channel list.
                // buttonBuilder(),
              ]
          ),
        ),
      ),
    );
  }
  // Future<void> list(String channel) async {
  //   CollectionReference ref = Firestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).collection("channels");
  //   QuerySnapshot eventsQuery = await ref
  //       .getDocuments();
  //   if(channel!=""){
  //     await Firestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser.uid).collection("channels").document(index).delete();
  //     return;
  //   }
  //
  //
  //   eventsQuery.documents.forEach((document) {
  //     if(document["id"].toString().trim()==widget.circular.channelId.trim()){
  //       index=document.documentID;
  //       setState(() {
  //         isPresent=true;
  //       });
  //       return;
  //     }
  //   });
  // }
  Widget _buildHeader(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(image: NetworkImage(widget.circular.imgUrl)),
                border: Border.all(
                  width: 0.1,
                  color: Colors.black.withOpacity(0.5),
                )
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:3.0),
                    child: Text(
                      widget.circular.title.toString(),
                      style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, height: 0.9)),
                    ),
                  ),
                  Text(
                    widget.circular.author.toString(),
                    style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, height: 0.9)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4),
                    child: Text(
                      widget.circular.date.toString(),
                      style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, height: 0.8)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
              ],
            ),
          ),
        ],
      ),
    ) ;
  }

  Widget _buildImage(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(240, 240, 240, 1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image.network(widget.circular.imgUrl, fit: BoxFit.fitWidth,),
      ),
    );
  }

  Widget _buildLinkBody(BuildContext context){
    if(widget.circular.files==null)return Container();
    return Column(
      children: [
        ListView.separated(
            itemCount: widget.circular.files.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context,int index){
              return SizedBox(height: 12,);
            },
            itemBuilder:(BuildContext context,int index){
              return Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw "Could not launch $link";
                  }
                },
                text: "File${index+1}:${widget.circular.files[index]}",
                style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,height: 1.25)),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                linkStyle: TextStyle(
                  color: Colors.blue,
                ),
              );
            }),
        SizedBox(height: 12,),
      ],
    );


  }
  Widget _buildTextBody(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Linkify(
          onOpen: (link) async {
            if (await canLaunch(link.url)) {
              await launch(link.url);
            } else {
              throw "Could not launch $link";
            }
          },
          text: widget.circular.content.toString(),
          style: GoogleFonts.roboto(textStyle: TextStyle(fontSize: 14,height: 1.25)),
          textAlign: TextAlign.justify,
          linkStyle: TextStyle(
            color: Colors.blue,
          ),
        )
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
          (widget.circular.files!=null)?widget.circular.files.length.toString():"0",
          style: GoogleFonts.rajdhani(textStyle: TextStyle(
              color: Colors.black54,
              fontSize: 12
          ),)
      ),
    );
  }
}
