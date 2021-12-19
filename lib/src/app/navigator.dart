import 'package:chat_app_wordy/src/app/pages/sign_in/sign_in_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordyNavigator {
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
}
