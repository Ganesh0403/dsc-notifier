import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notification/widgets/post.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  var box=Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: box.watch(key: 'postList'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            final taskListFromFirebase = snapshot.data??List();
            List<PostWidget> dataList = [];
            for (var tasksData in taskListFromFirebase) {
              dataList.add(
                PostWidget(
                  circular: tasksData,
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