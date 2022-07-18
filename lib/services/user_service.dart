import 'dart:io';

import 'package:bazartech/models/user.dart';
import 'package:dio/dio.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserService {
  // Create storage
  final storage = const FlutterSecureStorage();

  final String _baseUrl = 'https://bazartech-back.herokuapp.com/api/auth/';

  UserService();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      Response response = await Dio().post(
        _baseUrl + 'login/',
        data: {'username': username, 'password': password},
      );
      setToken(response.data['access']);
      storage.write(key: 'last_user', value: username);
      storage.write(key: 'last_pass', value: password);
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

  Future<Map<String, dynamic>> registerDevice() async {
    try {
      var platformData = await getPlatformData();
      var deviceName = platformData['data']['model'];
      var data = {
        "type": platformData['platform'],
        "name": deviceName,
        "registration_id": await FirebaseMessaging.instance.getToken(),
      };
      Response response = await Dio().post(
        'https://bazartech-back.herokuapp.com/api/notifications/fcm/devices/',
        data: data,
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

  Future<Map> getPlatformData() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    var deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = {
          "platform": "android",
          "data": _readAndroidBuildData(await deviceInfoPlugin.androidInfo)
        };
      } else if (Platform.isIOS) {
        deviceData = {
          "platform": "ios",
          "data": _readIosDeviceInfo(await deviceInfoPlugin.iosInfo)
        };
      } else {
        deviceData = <String, dynamic>{'error:': 'Unsupported platform.'};
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}
