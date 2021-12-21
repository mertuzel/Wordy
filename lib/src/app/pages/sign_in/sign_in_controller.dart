import 'package:chat_app_wordy/src/app/navigator.dart';
import 'package:chat_app_wordy/src/app/pages/sign_in/sign_in_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInController extends Controller {
  final SignInPresenter _presenter;

  SignInController(AuthenticationRepository authenticationRepository)
      : _presenter = SignInPresenter(authenticationRepository);

  String email = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initListeners() {
    _presenter.sendEmailLinkOnComplete = () {
      WordyNavigator.navigateToEmailLink(
        getContext(),
        User(
          id: '',
          fullName: '',
          email: email,
        ),
        false,
      );
    };

    _presenter.sendEmailLinkOnError = (e) {};
  }

  void onButtonPressed() {
    if (formKey.currentState!.validate()) _presenter.sendEmailLink(email);
  }
}
