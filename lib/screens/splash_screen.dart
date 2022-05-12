import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/widgets/logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      // TODO: check if already logged in and redirect to home
      Navigator.popAndPushNamed(context, '/login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: context.backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(
                size: 50,
                onPressed: () => {Navigator.popAndPushNamed(context, '/login')},
              )
            ],
          ),
        ),
      ),
    );
  }
}
