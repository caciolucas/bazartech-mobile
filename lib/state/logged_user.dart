import 'package:bazartech/models/user.dart';
import 'package:flutter/material.dart';

class LoggedUser with ChangeNotifier {
  User? _user;

  User? get user {
    return _user;
  }

  void setUser(User user) {
    _user = user;
  }

  void addOrRemoveFavoriteProduct(int productId) {
    if (_user?.favoriteProducts.contains(productId) == true) {
      _user?.favoriteProducts.remove(productId);
    } else {
      _user?.favoriteProducts.add(productId);
    }
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
