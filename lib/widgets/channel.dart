import 'package:flutter/material.dart';

class ChannelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ]
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10,left: 20,right: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/15,
            width:  MediaQuery.of(context).size.height/15,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('assets/avatars/avatar3.jpg',),fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height/15,
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    'This will the channel description',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 13
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}