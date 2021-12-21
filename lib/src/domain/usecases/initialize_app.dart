import 'dart:async';

import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class InitializeApp extends UseCase<void, void> {
  final UserReposistory _userReposistory;

  InitializeApp(this._userReposistory);

  @override
  Future<Stream<void>> buildUseCaseStream(void params) async {
    StreamController<void> controller = StreamController();
    try {
      await _userReposistory.initializeRepository();
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}
