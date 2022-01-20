import 'dart:async';

import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/types/sign_in_response.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SignInWithGoogle extends UseCase<SignInResponse, void> {
  final AuthenticationRepository _authenticationRepository;

  SignInWithGoogle(this._authenticationRepository);

  @override
  Future<Stream<SignInResponse>> buildUseCaseStream(void params) async {
    StreamController<SignInResponse> controller = StreamController();
    try {
      SignInResponse response =
          await _authenticationRepository.signInWithGoogle();
      controller.add(response);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error);
    }
    return controller.stream;
  }
}
