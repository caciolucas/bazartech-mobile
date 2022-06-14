import 'package:bazartech/models/user.dart';
import 'package:bazartech/state/state.dart';
import 'package:flutter/material.dart';

class LoggedUser with ChangeNotifier {
  User _user = MockState().user;

  List<int> _favoriteProductsIds = [];

  User get user {
    return _user;
  }

  void setUser(User user) {
    _user = user;
  }
}
