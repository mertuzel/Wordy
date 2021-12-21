import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/send_email_link.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInPresenter extends Presenter {
  late Function sendEmailLinkOnComplete;
  late Function sendEmailLinkOnError;

  final SendEmailLink _sendEmailLink;

  SignInPresenter(AuthenticationRepository authenticationRepository)
      : _sendEmailLink = SendEmailLink(authenticationRepository);

  void sendEmailLink(String email) {
    _sendEmailLink.execute(
      _SendEmailLinkObserver(this),
      SendEmailLinkParams(email),
    );
  }

  @override
  void dispose() {
    _sendEmailLink.dispose();
  }
}

class _SendEmailLinkObserver extends Observer<void> {
  final SignInPresenter _presenter;

  _SendEmailLinkObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.sendEmailLinkOnComplete();
  }

  @override
  void onError(error) {
    _presenter.sendEmailLinkOnError(error);
  }

  @override
  void onNext(_) {}
}
