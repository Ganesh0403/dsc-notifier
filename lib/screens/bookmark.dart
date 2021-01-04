import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notification/widgets/post.dart';
import 'package:provider/provider.dart';
//TODO widget build error fixing.

class BookMarkScreen extends StatelessWidget {
  var box=Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WatchBoxBuilder(box: box, builder: (context, snapshot) {
        final taskListFromFirebase = snapshot.get('postList')??List();
        List<PostWidget> dataList = [];
        for (var tasksData in taskListFromFirebase) {
          dataList.add(
            PostWidget(
              circular: tasksData,
              dataFromDatabase: true,
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