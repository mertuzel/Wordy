import 'dart:async';

import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RegisterUser extends UseCase<void, RegisterUserParams> {
  final UserReposistory _userReposistory;

  RegisterUser(this._userReposistory);

  @override
  Future<Stream<void>> buildUseCaseStream(RegisterUserParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      _userReposistory.registerUser(params!.user);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class RegisterUserParams {
  final User user;

  RegisterUserParams(this.user);
}
