import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

// The name of the database table is "tasks"
// By default, the name of the generated data class will be "Task" (without "s")
class Circulars extends Table {
  // autoIncrement automatically sets this to be the primary key
  IntColumn get id => integer().autoIncrement()();
  // If the length constraint is not fulfilled, the Task will not
  // be inserted into the database and an exception will be thrown.
  TextColumn get avatarUrl => text()();
  TextColumn get channelName => text()();
  TextColumn get authorName => text()();
  TextColumn get date => text()();
  TextColumn get imageUrl => text()();
  TextColumn get textBody => text()();
  TextColumn get fileCount => text()();
  TextColumn get channelId => text()();
}

 // class Tasks extends Table {
 //   IntColumn get id => integer().autoIncrement()();
 // }

// _$AppDatabase is the name of the generated class
@UseMoor(tables: [Circulars])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
  // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
    path: 'db.sqlite',
    // Good for debugging - prints SQL in the console
    logStatements: true,
  )));

  // Bump this when changing tables and columns.
  // Migrations will be covered in the next part.
  @override
  int get schemaVersion => 1;

  Future insertCircular(Circular circular)=>into(circulars).insert(circular);

  Future deleteCircular(Circular circular)=>delete(circulars).delete(circular);

  Future<List<Circular>> getAllCirculars() => select(circulars).get();

  Stream<List<Circular>> watchAllCirculars() => select(circulars).watch();
}