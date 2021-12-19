import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      home: SplashView(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kWhite,
        scaffoldBackgroundColor: kWhite,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
