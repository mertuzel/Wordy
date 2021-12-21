import 'package:chat_app_wordy/src/app/navigator.dart';
import 'package:chat_app_wordy/src/app/pages/email_link/email_link_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EmailLinkController extends Controller {
  final EmailLinkPresenter _presenter;

  EmailLinkController(
    AuthenticationRepository authenticationRepository,
    UserReposistory userReposistory,
    this.user,
    this.isRegister,
  ) : _presenter =
            EmailLinkPresenter(authenticationRepository, userReposistory);

  final User user;
  final bool isRegister;

  @override
  void onResumed() {
    initDynamicLinks();
    super.onResumed();
  }

  @override
  void initListeners() {
    _presenter.authenticateWithEmailLinkOnComplete = () {
      if (isRegister) {
        _presenter.registerUser(user);
      } else {
        WordyNavigator.navigateToSplash(getContext());
      }
    };

    _presenter.authenticateWithEmailLinkOnError = (e) {};

    _presenter.registerUserOnComplete = () {
      WordyNavigator.navigateToSplash(getContext());
    };

    _presenter.registerUserOnError = (e) {};
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        print('Deep link not null authentication');
        _presenter.authenticateWithEmailLink(
          user.email,
          deepLink.toString(),
          false,
        );
      }
    }, onError: (e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {}
  }
}
