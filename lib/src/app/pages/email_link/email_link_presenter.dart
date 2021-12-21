import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/authenticate_with_email_link.dart';
import 'package:chat_app_wordy/src/domain/usecases/register_user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EmailLinkPresenter extends Presenter {
  late Function authenticateWithEmailLinkOnComplete;
  late Function authenticateWithEmailLinkOnError;

  late Function registerUserOnComplete;
  late Function registerUserOnError;

  final AuthenticateWithEmailLink _authenticateWithEmailLink;
  final RegisterUser _registerUser;

  EmailLinkPresenter(AuthenticationRepository authenticationRepository,
      UserReposistory userReposistory)
      : _authenticateWithEmailLink =
            AuthenticateWithEmailLink(authenticationRepository),
        _registerUser = RegisterUser(userReposistory);

  void authenticateWithEmailLink(
      String email, String emailLink, bool deleteUser) {
    _authenticateWithEmailLink.execute(
      _AuthenticateWithEmailLinkObserver(this),
      AuthenticateWithEmailLinkParams(
          email: email, emailLink: emailLink, deleteUser: deleteUser),
    );
  }

  void registerUser(User user) {
    _registerUser.execute(
      _RegisterUserObserver(this),
      RegisterUserParams(user),
    );
  }

  @override
  void dispose() {
    _authenticateWithEmailLink.dispose();
    _registerUser.dispose();
  }
}

class _AuthenticateWithEmailLinkObserver extends Observer<void> {
  final EmailLinkPresenter _presenter;

  _AuthenticateWithEmailLinkObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.authenticateWithEmailLinkOnComplete();
  }

  @override
  void onError(error) {
    _presenter.authenticateWithEmailLinkOnError(error);
  }

  @override
  void onNext(_) {}
}

class _RegisterUserObserver extends Observer<void> {
  final EmailLinkPresenter _presenter;

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
