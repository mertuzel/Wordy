import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/initialize_app.dart';
import 'package:chat_app_wordy/src/domain/usecases/is_user_signed_in.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashPresenter extends Presenter {
  late Function isUserSignedInOnNext;
  late Function isUserSignedInError;

  late Function initializeAppOnComplete;
  late Function initializeAppOnError;

  final IsUserSignedIn _isUserSignedIn;
  final InitializeApp _initializeApp;

  SplashPresenter(AuthenticationRepository authenticationRepository,
      UserReposistory userReposistory)
      : _isUserSignedIn = IsUserSignedIn(authenticationRepository),
        _initializeApp = InitializeApp(userReposistory);

  void isUserSignedIn() {
    _isUserSignedIn.execute(_IsUserSignedInObserver(this));
  }

  void initializeApp() {
    _initializeApp.execute(_InitializeAppObserver(this));
  }

  @override
  void dispose() {
    _isUserSignedIn.dispose();
    _initializeApp.dispose();
  }
}

class _IsUserSignedInObserver extends Observer<bool> {
  final SplashPresenter _presenter;

  _IsUserSignedInObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(e) {
    _presenter.isUserSignedInError(e);
  }

  @override
  void onNext(bool? result) {
    _presenter.isUserSignedInOnNext(result);
  }
}

class _InitializeAppObserver extends Observer<bool> {
  final SplashPresenter _presenter;

  _InitializeAppObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.initializeAppOnComplete();
  }

  @override
  void onError(e) {
    _presenter.initializeAppOnError(e);
  }

  @override
  void onNext(_) {}
}
