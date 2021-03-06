import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/state/logged_user.dart';
import 'package:bazartech/widgets/button.dart';
import 'package:bazartech/widgets/input.dart';
import 'package:bazartech/widgets/logo.dart';
import 'package:bazartech/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:bazartech/extensions/screen_size.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameEC = TextEditingController();
  final passwordEC = TextEditingController();
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException {
      return <BiometricType>[];
    }
  }

  static Future<bool> authenticate() async {
    final isAvailable = await hasBiometrics();
    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Use sua digital para recuperar a senha salva',
      );
    } on PlatformException {
      return false;
    }
  }

  void _login(BuildContext context) {
    UserService().login(usernameEC.text, passwordEC.text).then(
      (data) {
        if (data['ok']) {
          Provider.of<LoggedUser>(context, listen: false).setUser(
            data['body'],
          );
          UserService().registerDevice();
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                data['message'],
                style: TextStyle(color: context.onErrorColor),
              ),
              backgroundColor: context.errorColor,
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    const FlutterSecureStorage().containsKey(key: 'last_user').then(
      (value) {
        if (value) {
          const FlutterSecureStorage().read(key: 'last_user').then(
            (value) {
              usernameEC.text = value ?? "";
            },
          );
        }
        authenticate().then((value) {
          if (value) {
            const FlutterSecureStorage().read(key: 'last_pass').then(
              (value) {
                passwordEC.text = value ?? "";
              },
            );
          }
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50),
          width: 1.sw,
          height: 1.sh,
          color: context.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(size: 50),
              const SizedBox(height: 50),
              DefaultInput(
                label: 'Usu??rio',
                controller: usernameEC,
              ),
              const SizedBox(height: 20),
              DefaultInput(
                  label: 'Senha', obscureText: true, controller: passwordEC),
              const SizedBox(height: 20),
              DefaultButton(
                label: 'Entrar',
                width: double.infinity,
                onPressed: () => {_login(context)},
                // onPressed: () => {authenticate()},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'N??o tem uma conta? ',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: context.primaryVariantColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
