import 'package:chat_app_wordy/src/app/navigator.dart';
import 'package:chat_app_wordy/src/app/pages/splash/splash_presenter.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashController extends Controller {
  final SplashPresenter _presenter;

  SplashController(AuthenticationRepository authenticationRepository,
      UserReposistory userReposistory)
      : _presenter = SplashPresenter(authenticationRepository, userReposistory);

  @override
  void onInitState() {
    _presenter.isUserSignedIn();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.isUserSignedInError = (e) {};

    _presenter.isUserSignedInOnNext = (bool result) {
      if (result) {
        _presenter.initializeApp();
      } else
        Future.delayed(Duration(seconds: 2)).then(
          (_) => WordyNavigator.navigateToIntroduction(getContext()),
        );
    };

    _presenter.initializeAppOnComplete = () {
      WordyNavigator.navigateToHome(getContext());
    };

    _presenter.initializeAppOnError = (e) {};
  }
}
