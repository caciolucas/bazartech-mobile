import 'package:bazartech/screens/home_screen.dart';
import 'package:bazartech/screens/product_detail_screen.dart';
import 'package:bazartech/screens/splash_screen.dart';
import 'package:bazartech/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bazartech/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const Bazartechapp());
}

class Bazartechapp extends StatelessWidget {
  const Bazartechapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: () => MaterialApp(
        title: 'ExampleApp',
        theme: UiConfig.theme,
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => const SplashScreen(),
          "/login": (BuildContext context) => const LoginScreen(),
          "/home": (BuildContext context) => const HomeScreen(),
          "/product-detail": (BuildContext context) =>
              const ProductDetailScreen(),
        },
      ),
    );
  }
}
