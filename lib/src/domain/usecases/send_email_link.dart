import 'dart:async';

import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SendEmailLink extends UseCase<void, SendEmailLinkParams> {
  final AuthenticationRepository _authenticationRepository;

  SendEmailLink(this._authenticationRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(SendEmailLinkParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _authenticationRepository.sendEmailLink(params!.email);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error);
    }
    return controller.stream;
  }
}

class SendEmailLinkParams {
  final String email;

  SendEmailLinkParams(this.email);
}
