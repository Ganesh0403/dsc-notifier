import 'package:flutter/material.dart';
import 'package:notification/widgets/channel.dart';

class ChannelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:10),
      height: double.infinity,
      width: double.infinity,
      color: Colors.grey.withOpacity(0.1),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
              ChannelWidget(),
            ],
          ),
        ),
      )
    );
  }
}