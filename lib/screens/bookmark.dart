import 'package:flutter/material.dart';
import 'package:notification/database/moor_database.dart';
import 'package:notification/widgets/post.dart';
import 'package:provider/provider.dart';

class BookMarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database=Provider.of<AppDatabase>(context);
    return Container(
      child: StreamBuilder(
          stream: database.watchAllCirculars(),
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
              // print(tasksData);
              // var taskDetails = tasksData.data();
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