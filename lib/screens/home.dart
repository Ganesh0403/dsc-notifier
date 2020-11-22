import 'package:flutter/material.dart';
import 'package:notification/widgets/post.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(245, 245, 245, 1),
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PostWidget(
              avatarUrl: "assets/avatars/dp2.jpg",
              channelName: "Spider-Man: Spider-Verse",
              authorName: "Peter Parker",
              date: '19 September, 07:30 AM',
              imageUrl: 'assets/images/bg1.jpg',
              textBody: '''"Anyone can wear the mask. You can wear the mask. If you didn't know that before, I hope you do now" 💥🙌\nSpider-Man: Into the Spider-Verse hits the thatres this august! Don't miss out the movie.\nWatch the trailer at https://www.youtube.com/watch?v=g4Hbz2jLxvQ ❤🤩✨''',
              fileCount: "3 Files Attatched",
            ),
            PostWidget(
              avatarUrl: "assets/avatars/dp1.jpg",
              channelName: "Mission Impossible: Fallout",
              authorName: "Ethan Hunt",
              date: '20 September, 02:30 PM',
              imageUrl: 'assets/images/bg2.jpg',
              textBody: '''Tom Cruise is still at the top of his game. The aciton in Mission Impossible: Fallout hits harder than ever before. Get tickets today.\nWatch the trailer at https://www.youtube.com/watch?v=XiHiW4N7-bo ''',
              fileCount: "3 Files Attatched",
            ),
            PostWidget(
              avatarUrl: "assets/avatars/dp3.jpg",
              channelName: "Avengers Endgame",
              authorName: "Marvel Studios",
              date: '22 September, 08:30 PM',
              imageUrl: 'assets/images/bg3.jpg',
              textBody: '''The wait is over. Everything has led to this. See Marvel Studios' Avengers Endgame in theatres tomorrow. Get tickets now.\nWatch the trailer at https://www.youtube.com/watch?v=TcMBFSGVi1c''',
              fileCount: "3 Files Attatched",
            ),
            PostWidget(
              avatarUrl: "assets/avatars/dp4.jpg",
              channelName: "ACM CESA 2020",
              authorName: "PCCOE",
              date: '03 October, 04:30 PM',
              imageUrl: 'assets/images/bg4.jpg',
              textBody: '''Open Source is one the best things to have happened in the digital world. Everything has led to this. Be a part of the amazing Hactoberfest event. Get tickets now.\nGet to know more about us at https://hacktoberfest.digitalocean.com/''',
              fileCount: "2 Files Attatched",
            ),
          ],
        ),
      ),
    );
  }
}