import 'dart:async';

import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class IsUserSignedIn extends UseCase<bool, void> {
  final AuthenticationRepository _authenticationRepository;

  IsUserSignedIn(this._authenticationRepository);

  @override
  Future<Stream<bool>> buildUseCaseStream(void params) async {
    StreamController<bool> controller = StreamController();
    try {
      bool result = _authenticationRepository.isUserSignedIn;
      controller.add(result);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}
