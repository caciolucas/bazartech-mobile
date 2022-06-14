import 'package:bazartech/models/product.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/state/state.dart';
import 'package:flutter/material.dart';

class ProductList with ChangeNotifier {
  List<Product> _products = MockState().products;

  List<Product> allProducts({int status = -1}) {
    if (status >= 0) {
      return _products.where((product) => product.status == status).toList();
    }

    return _products.toList();
  }

  List<Product> userProducts(int? userId, {int status = -1}) {
    List<Product> products =
        _products.where((prod) => prod.owner == userId).toList();

    if (status >= 0) {
      return products.where((product) => product.status == status).toList();
    }
    return products;
  }

  List<Product> getByIdList(List<int> ids) {
    return _products.where((product) => ids.contains(product.id)).toList();
  }

  Product getById(int id) {
    return _products.firstWhere((product) => product.id == id);
  }
}
