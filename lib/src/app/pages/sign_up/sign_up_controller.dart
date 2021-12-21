import 'package:chat_app_wordy/src/app/navigator.dart';
import 'package:chat_app_wordy/src/app/pages/sign_up/sign_up_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignUpController extends Controller {
  final SignUpPresenter _presenter;

  SignUpController(AuthenticationRepository authenticationRepository)
      : _presenter = SignUpPresenter(authenticationRepository);

  String email = '';
  String fullName = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initListeners() {
    _presenter.sendEmailLinkOnComplete = () {
      WordyNavigator.navigateToEmailLink(
        getContext(),
        User(
          id: '',
          fullName: fullName,
          email: email,
        ),
        true,
      );
    };

    _presenter.sendEmailLinkOnError = (e) {};
  }

  void onButtonPressed() {
    if (formKey.currentState!.validate()) _presenter.sendEmailLink(email);
  }
}
