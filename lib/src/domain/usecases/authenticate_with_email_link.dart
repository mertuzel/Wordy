import 'dart:async';

import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AuthenticateWithEmailLink
    extends UseCase<void, AuthenticateWithEmailLinkParams> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticateWithEmailLink(this._authenticationRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(
      AuthenticateWithEmailLinkParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _authenticationRepository.authenticateWithEmailLink(
        email: params!.email,
        emailLink: params.emailLink,
        deleteUser: params.deleteUser,
      );
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error);
    }
    return controller.stream;
  }
}

class AuthenticateWithEmailLinkParams {
  final String email;
  final String emailLink;
  final bool deleteUser;

  AuthenticateWithEmailLinkParams({
    required this.email,
    required this.emailLink,
    required this.deleteUser,
  });
}
