import 'dart:async';

import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetCurrentUser extends UseCase<User, void> {
  final UserReposistory _userReposistory;

  GetCurrentUser(this._userReposistory);

  @override
  Future<Stream<User>> buildUseCaseStream(void params) async {
    StreamController<User> controller = StreamController();
    try {
      User currentUser = _userReposistory.currentUser;
      controller.add(currentUser);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}
