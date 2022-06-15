import 'package:bazartech/models/product.dart';
import 'package:bazartech/services/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProductService {
  var storage = const FlutterSecureStorage();
  var userService = UserService();
  ProductService();

  Future<Map> getProducts() async {
    try {
      Response response = await Dio().get(
        'https://bazartech-back.herokuapp.com/api/store/products/?no_page',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await userService.getToken()}',
          },
        ),
      );
      List<Product> products = [];
      for (var product in response.data) {
        products.add(Product.fromMap(product));
      }
      return {'body': products, 'ok': true};
    } catch (e) {
      rethrow;
      return {'message': 'Erro ao tentar fazer login', 'ok': false};
    }
    return {};
  }

  Future<bool> partialUpdateProduct(int id, Map<String, dynamic> data) async {
    try {
      Response response = await Dio().patch(
        'https://bazartech-back.herokuapp.com/api/store/products/$id/',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await userService.getToken()}',
          },
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
