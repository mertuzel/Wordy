import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/is_user_signed_in.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashPresenter extends Presenter {
  late Function isUserSignedInOnNext;
  late Function isUserSignedInError;

  final IsUserSignedIn _isUserSignedIn;

  SplashPresenter(AuthenticationRepository authenticationRepository)
      : _isUserSignedIn = IsUserSignedIn(authenticationRepository);

  void isUserSignedIn() {
    _isUserSignedIn.execute(_IsUserSignedInObserver(this));
  }

  @override
  void dispose() {
    _isUserSignedIn.dispose();
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
