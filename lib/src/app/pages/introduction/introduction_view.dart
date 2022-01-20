import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/navigator.dart';
import 'package:chat_app_wordy/src/app/pages/introduction/introduction_controller.dart';
import 'package:chat_app_wordy/src/app/widgets/default_button.dart';
import 'package:chat_app_wordy/src/data/repositories/data_authentication_repository.dart';
import 'package:chat_app_wordy/src/data/repositories/data_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class IntroductionView extends View {
  @override
  State<StatefulWidget> createState() => _IntroductionViewState(
        IntroductionController(
          DataAuthenticationRepository(),
          DataUserRepository(),
        ),
      );
}

class _IntroductionViewState
    extends ViewState<IntroductionView, IntroductionController> {
  _IntroductionViewState(IntroductionController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      key: globalKey,
      backgroundColor: kWhite,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: padding.top + size.height * 0.3),
            Text('Wordy', style: kEnormousTextStyle(kPrimaryColor)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: DefaultButton(
                      backgroundColor: kPrimaryColor,
                      textColor: kWhite,
                      onPressed: () {
                        WordyNavigator.navigateToSignIn(context);
                      },
                      text: 'Sign In With Email',
                    ),
                  ),
                  SizedBox(height: 15),
                  ControlledWidgetBuilder<IntroductionController>(
                      builder: (context, controller) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: DefaultButton(
                        backgroundColor: kPrimaryColor,
                        textColor: kWhite,
                        onPressed: controller.signInWithGoogle,
                        imagePath: 'assets/images/google.png',
                        text: 'Sign In With Google',
                      ),
                    );
                  }),
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
                      onPressed: () {
                        WordyNavigator.navigateToSignUp(context);
                      },
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
