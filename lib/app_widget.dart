import 'package:flutter/material.dart';
import './modules/login/login_page.dart';
import './modules/splash/splash_page.dart';
import './modules/error/error_page.dart';
import './modules/home/home_page.dart';
import './modules/create_split/create_split_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Split.it',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/error': (context) => ErrorPage(),
        '/home': (context) => HomePage(),
        '/create': (context) => CreateSplitPage(),
      },
    );
  }
}
