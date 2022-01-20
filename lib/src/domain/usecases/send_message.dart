import 'dart:async';

import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SendMessage extends UseCase<void, SendMessageParams> {
  final ChatRepository _chatRepository;

  SendMessage(this._chatRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(SendMessageParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _chatRepository.sendMessage(params!.message, params.userIds);
      controller.close();
    } catch (error, stackTrace) {
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class SendMessageParams {
  final Message message;
  final List<String> userIds;

  SendMessageParams(this.message, this.userIds);
}
