import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/widgets/button.dart';
import 'package:bazartech/widgets/input.dart';
import 'package:bazartech/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:bazartech/extensions/screen_size.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              DefaultInput(label: 'Usuário'),
              const SizedBox(height: 20),
              DefaultInput(label: 'Senha', obscureText: true),
              const SizedBox(height: 20),
              DefaultButton(
                label: 'Entrar',
                width: double.infinity,
                onPressed: () =>
                    {Navigator.of(context).popAndPushNamed('/home')},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Não tem uma conta? ',
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
