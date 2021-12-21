import 'dart:async';

import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUsers extends UseCase<List<User>, void> {
  final UserReposistory _userReposistory;

  GetUsers(this._userReposistory);

  @override
  Future<Stream<List<User>>> buildUseCaseStream(void params) async {
    StreamController<List<User>> controller = StreamController();
    try {
      List<User> users = await _userReposistory.getUsers();
      controller.add(users);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}
