import 'package:flutter/material.dart';
import 'package:notification/models/user.dart';

class UserProvider with ChangeNotifier {

  static UserModel userData = new UserModel();
  Map<String,dynamic> _user = {
    "uid":userData.uid,
    "name":userData.name,
    "pNo":userData.pNo,
    "rNo":userData.rNo,
    "bio":userData.bio,
  };

  Map<String,dynamic> get user {
    return _user;
  }

  void setUser(Map user) {
    _user = user;
    notifyListeners();
  }

}