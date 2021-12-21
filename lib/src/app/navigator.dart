import 'package:chat_app_wordy/src/app/pages/core/core_view.dart';
import 'package:chat_app_wordy/src/app/pages/email_link/email_link_view.dart';
import 'package:chat_app_wordy/src/app/pages/introduction/introduction_view.dart';
import 'package:chat_app_wordy/src/app/pages/sign_in/sign_in_view.dart';
import 'package:chat_app_wordy/src/app/pages/sign_up/sign_up_view.dart';
import 'package:chat_app_wordy/src/app/pages/splash/splash_view.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordyNavigator {
  static Future<void> navigateToSplash(
    final BuildContext context,
  ) async {
    await Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => SplashView(),
      ),
      (_) => false,
    );
  }

  static Future<void> navigateToHome(
    final BuildContext context,
  ) async {
    await Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => CoreView(),
      ),
      (_) => false,
    );
  }

  static Future<void> navigateToIntroduction(
    final BuildContext context,
  ) async {
    await Navigator.pushAndRemoveUntil(
      context,
      CupertinoPageRoute(
        builder: (context) => IntroductionView(),
      ),
      (_) => false,
    );
  }

  static Future<void> navigateToSignUp(
    final BuildContext context,
  ) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SignUpView(),
      ),
    );
  }

  static Future<void> navigateToSignIn(
    final BuildContext context,
  ) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => SignInView(),
      ),
    );
  }

  static Future<void> navigateToEmailLink(
    final BuildContext context,
    final User user,
    final bool isRegister,
  ) async {
    await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => EmailLinkView(user, isRegister),
      ),
    );
  }
}
