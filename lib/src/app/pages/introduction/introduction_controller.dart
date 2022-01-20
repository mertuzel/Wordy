import 'package:chat_app_wordy/src/app/navigator.dart';
import 'package:chat_app_wordy/src/app/pages/introduction/introduction_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/types/sign_in_response.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class IntroductionController extends Controller {
  final IntroductionPresenter _presenter;

  IntroductionController(AuthenticationRepository authenticationRepository,
      UserReposistory userReposistory)
      : _presenter =
            IntroductionPresenter(authenticationRepository, userReposistory);

  @override
  void initListeners() {
    _presenter.signInWithGoogleOnNext = (SignInResponse response) {
      if (response.updateUser) {
        _presenter.registerUser(
          User(
            id: '',
            fullName: response.fullName!,
            email: response.email!,
          ),
        );
      } else {
        WordyNavigator.navigateToSplash(getContext());
      }
    };

    _presenter.signInWithGoogleonOnError = (e) {};

    _presenter.registerUserOnComplete = () {
      WordyNavigator.navigateToSplash(getContext());
    };

    _presenter.registerUserOnError = (e) {};
  }

  void signInWithGoogle() {
    _presenter.signInWithGoogle();
  }
}
