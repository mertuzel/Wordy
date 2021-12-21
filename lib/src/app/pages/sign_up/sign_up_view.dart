import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/sign_up/sign_up_controller.dart';
import 'package:chat_app_wordy/src/app/widgets/default_button.dart';
import 'package:chat_app_wordy/src/data/repositories/data_authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpView extends View {
  @override
  State<StatefulWidget> createState() => _SignUpViewState(
        SignUpController(
          DataAuthenticationRepository(),
        ),
      );
}

class _SignUpViewState extends ViewState<SignUpView, SignUpController> {
  _SignUpViewState(SignUpController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      key: globalKey,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: padding.top + 10),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 22,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black54,
                    )),
              ),
              SizedBox(height: 25),
              Center(
                child: Text(
                  'Sign Up',
                  style: kBigTextStyle(kPrimaryColor),
                ),
              ),
              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: ControlledWidgetBuilder<SignUpController>(
                    builder: (context, controller) {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: kHeaderTextStyle(kLightBlack),
                        ),
                        ControlledWidgetBuilder<SignUpController>(
                            builder: (context, controller) {
                          return TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text != null) {
                                bool isEmail = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(text);
                                if (!isEmail)
                                  return 'Geçersiz Email';
                                else
                                  return null;
                              }
                            },
                            onChanged: (text) {
                              controller.email = text;
                            },
                            style: kInputTextStyle(Colors.black87),
                            decoration: InputDecoration(
                              hintStyle: kHintTextStyle(kHintBlack),
                              hintText: 'yourname@example',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kSecondaryColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          );
                        }),
                        SizedBox(height: 30),
                        Text(
                          'Full Name',
                          style: kHeaderTextStyle(kLightBlack),
                        ),
                        ControlledWidgetBuilder<SignUpController>(
                            builder: (context, controller) {
                          return TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              if (text == null || text.length < 3) {
                                return 'İsminiz çok kısa';
                              }
                            },
                            onChanged: (text) {
                              controller.fullName = text;
                            },
                            style: kInputTextStyle(Colors.black87),
                            decoration: InputDecoration(
                              hintStyle: kHintTextStyle(kHintBlack),
                              hintText: 'your full name',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kSecondaryColor),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: ControlledWidgetBuilder<SignUpController>(
                    builder: (context, controller) {
                  return DefaultButton(
                      onPressed: controller.onButtonPressed,
                      text: 'Sign Up',
                      backgroundColor: kPrimaryColor,
                      textColor: kWhite);
                }),
              ),
              SizedBox(height: 60),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Have an account?',
                  style: kAuthenticationTextStyle(kAuthBlack),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Sign In',
                  style: kAuthenticationTextStyle(kPrimaryColor),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
