import 'package:bazartech/screens/home_screen.dart';
import 'package:bazartech/screens/product_detail_screen.dart';
import 'package:bazartech/screens/splash_screen.dart';
import 'package:bazartech/screens/login_screen.dart';
import 'package:bazartech/state/logged_user.dart';
import 'package:bazartech/state/product_list.dart';
import 'package:flutter/material.dart';
import 'package:bazartech/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Bazartechapp());
}

class Bazartechapp extends StatelessWidget {
  const Bazartechapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductList()),
        ChangeNotifierProvider(create: (context) => LoggedUser())
      ],
      child: ScreenUtilInit(
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
      ),
    );
  }
}
