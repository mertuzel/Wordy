import 'package:chat_app_wordy/src/app/pages/splash/splash_controller.dart';
import 'package:chat_app_wordy/src/data/repositories/data_authentication_repository.dart';
import 'package:chat_app_wordy/src/data/repositories/data_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:lottie/lottie.dart';

class SplashView extends View {
  @override
  State<StatefulWidget> createState() => _SplashViewState(
        SplashController(
          DataAuthenticationRepository(),
          DataUserRepository(),
        ),
      );
}

class _SplashViewState extends ViewState<SplashView, SplashController> {
  _SplashViewState(SplashController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: globalKey,
      body: Container(
        height: size.height,
        width: size.width,
        child: Center(
          child: Lottie.asset('assets/animations/splash.json'),
        ),
      ),
    );
  }
}
