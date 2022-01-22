import 'dart:async';

import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetLastMessagesOfUser extends UseCase<List<Message>?, void> {
  final ChatRepository _chatRepository;
  final UserReposistory _userReposistory;
  final StreamController<List<Message>?> _controller;

  GetLastMessagesOfUser(this._chatRepository, this._userReposistory)
      : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<Message>?>> buildUseCaseStream(void params) async {
    try {
      final uid = _userReposistory.currentUser.id;
      _chatRepository
          .getLastMessagesOfUser(uid)
          .listen((List<Message>? messages) {
        if (!_controller.isClosed) _controller.add(messages);
      });
    } catch (error, stackTrace) {
      _controller.addError(error, stackTrace);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
