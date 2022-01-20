import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/types/sign_in_response.dart';
import 'package:chat_app_wordy/src/domain/usecases/register_user.dart';
import 'package:chat_app_wordy/src/domain/usecases/sign_in_with_google.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class IntroductionPresenter extends Presenter {
  late Function signInWithGoogleOnNext;
  late Function signInWithGoogleonOnError;

  late Function registerUserOnComplete;
  late Function registerUserOnError;

  final SignInWithGoogle _signInWithGoogle;
  final RegisterUser _registerUser;

  IntroductionPresenter(AuthenticationRepository authenticationRepository,
      UserReposistory userReposistory)
      : _signInWithGoogle = SignInWithGoogle(authenticationRepository),
        _registerUser = RegisterUser(userReposistory);

  void signInWithGoogle() {
    _signInWithGoogle.execute(_SignInWithGoogleObserver(this));
  }

  void registerUser(User user) {
    _registerUser.execute(
      _RegisterUserObserver(this),
      RegisterUserParams(user),
    );
  }

  @override
  void dispose() {
    _signInWithGoogle.dispose();
    _signInWithGoogle.dispose();
  }
}

class _SignInWithGoogleObserver extends Observer<SignInResponse> {
  final IntroductionPresenter _presenter;

  _SignInWithGoogleObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.signInWithGoogleonOnError(error);
  }

  @override
  void onNext(SignInResponse? response) {
    _presenter.signInWithGoogleOnNext(response);
  }
}

class _RegisterUserObserver extends Observer<void> {
  final IntroductionPresenter _presenter;

  _RegisterUserObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.registerUserOnComplete();
  }

  @override
  void onError(error) {
    _presenter.registerUserOnError(error);
  }

  @override
  void onNext(_) {}
}
