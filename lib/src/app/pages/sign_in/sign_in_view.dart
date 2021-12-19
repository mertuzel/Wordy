import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/sign_in/sign_in_controller.dart';
import 'package:chat_app_wordy/src/app/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInView extends View {
  @override
  State<StatefulWidget> createState() => _SignInViewState(
        SignInController(),
      );
}

class _SignInViewState extends ViewState<SignInView, SignInController> {
  _SignInViewState(SignInController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: kWhite,
      key: globalKey,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: padding.top + size.height * 0.3),
            Text('Wordy', style: enormousTextStyle(kPrimaryColor)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: DefaultButton(
                      backgroundColor: kPrimaryColor,
                      textColor: kWhite,
                      onPressed: () {},
                      text: 'Sign In With Email',
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: DefaultButton(
                      backgroundColor: kPrimaryColor,
                      textColor: kWhite,
                      onPressed: () {},
                      imagePath: 'assets/images/google.png',
                      text: 'Sign In With Google',
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'or',
                    style: kAuthenticationTextStyle(kPrimaryColor),
                  ),
                  SizedBox(height: 15),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: DefaultButton(
                      backgroundColor: kWhite,
                      textColor: kPrimaryColor,
                      onPressed: () {},
                      text: 'Sign Up With Email',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
