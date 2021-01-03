import 'package:flutter/material.dart';
import 'package:notification/models/user.dart';

class UserProvider with ChangeNotifier {
  static UserModel userData = new UserModel();
  Map<String, dynamic> _user = {
    "uid": userData.uid??"",
    "name": userData.name??"",
    "pNo": userData.pNo??"",
    "rNo": userData.rNo??"",
    "bio": userData.bio??"",
    "email": userData.email??"",
    "division": userData.division??0,
    "year": userData.year??0,
    "subscriptions": userData.subscriptions??[],
    "batch": userData.batch??0,
    "dept":userData.dept??"",
  };

  Map<String, dynamic> get user {
    return _user;
  }

  void setUser(Map user) {
    print(user);
    if (user == null) return;
    _user = {
      "uid": user["uid"]??"",
      "name": user["name"]??"",
      "pNo": user["pNo"]??"",
      "rNo": user["rNo"]??"",
      "bio": user["bio"]??"",
      "email": user["email"]??"",
      "division": user["division"]??0,
      "year": user["year"]??0,
      "subscriptions": user["subscriptions"]??[],
      "batch": user["batch"]??0,
      "dept":user["dept"]??"",
    };
    notifyListeners();
  }
}
