import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification/database/moor_database.dart';
import 'package:notification/pages/postPage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PostWidget extends StatelessWidget {

  // final String avatarUrl;
  // final String channelName;
  // final String authorName;
  // final String date;
  // final String imageUrl;
  // final String textBody;
  // final String fileCount;
  // final String channelId;
  final bool dataFromDatabase;
  final Circular circular;

  PostWidget({this.dataFromDatabase=false, this.circular});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => PostPage(
          dataFromDatabase: dataFromDatabase,
          circular: new Circular(avatarUrl: circular.avatarUrl,channelName: circular.channelName,authorName: circular.authorName,date: circular.date,imageUrl: circular.imageUrl,textBody: circular.textBody,fileCount: circular.fileCount,channelId: circular.channelId,),
        ) ));
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(0.7),
              width: 0.15,
            ),
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeader(context),
            SizedBox(height: 12,),
            _buildImage(context),
            SizedBox(height: 12,),
            _buildTextBody(context),
            SizedBox(height: 12,),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final database=Provider.of<AppDatabase>(context);
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
              image: DecorationImage(image: NetworkImage(circular.avatarUrl)),
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
                      circular.channelName,
                      style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, height: 0.9)),
                    ),
                  ),
                  Text(
                    circular.authorName,
                    style: GoogleFonts.rajdhani(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, height: 0.9)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:4),
                    child: Text(
                      circular.date,
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
                IconButton(color: Colors.black.withOpacity(0.75), padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), constraints: BoxConstraints(),icon: Icon((dataFromDatabase?Icons.delete:Icons.bookmark_border)), onPressed: (){
                  if(dataFromDatabase){
                    database.deleteCircular(circular);
                  }
                  else{
                    database.insertCircular(circular).whenComplete((){
                      Fluttertoast.showToast(msg: "Successfully added this post to database");
                    });
                  }
                }),
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
        child: Image.network(circular.imageUrl, fit: BoxFit.fitWidth,),
      ),
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
        text: circular.textBody,
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
          circular.fileCount,
        style: GoogleFonts.rajdhani(textStyle: TextStyle(
          color: Colors.black54,
          fontSize: 12
        ),)
      ),
    );
  }

}