import 'package:bazartech/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserService {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _baseUrl = 'http://bazartech-back.herokuapp.com/api/auth/';

  UserService();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      Response response = await Dio().post(
        _baseUrl + 'login/',
        data: {'username': username, 'password': password},
      );
      setToken(response.data['access']);
      Map<String, dynamic> responseCurrentUser = await getCurrentUser();
      User user = User.fromMap(responseCurrentUser['body']);
      return {'body': user, 'ok': true};
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 401) {
          return {'message': 'Usuário ou senha inválidos', 'ok': false};
        }
      }
      return {'message': 'Erro ao tentar fazer login', 'ok': false};
    }
  }

  Future<Map<String, dynamic>> getCurrentUser() async {
    try {
      Response response = await Dio().get(
        _baseUrl + 'users/me/',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
          },
        ),
      );
      return {'body': response.data, 'ok': true};
    } catch (e) {}
    return {};
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<void> setToken(String token) async {
    return await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    return await storage.delete(key: 'token');
  }

  Future<bool> checkTokenExp() async {
    var token = await getToken();
    if (token == null) {
      return false;
    }
    var decoded = JwtDecoder.decode(token);
    var exp = decoded['exp'];
    var now = DateTime.now().millisecondsSinceEpoch;
    return now < exp;
  }

  Future<bool> partialUpdateUser(int user, Map<String, dynamic> data) async {
    try {
      Response response = await Dio().patch(
        _baseUrl + 'users/$user/',
        data: data,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${await getToken()}',
          },
        ),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}
