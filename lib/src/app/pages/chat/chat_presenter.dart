import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/get_current_user.dart';
import 'package:chat_app_wordy/src/domain/usecases/get_messages.dart';
import 'package:chat_app_wordy/src/domain/usecases/send_message.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ChatPresenter extends Presenter {
  late Function getCurrentUserOnNext;
  late Function getCurrentUserOnError;

  late Function getMessagesOnNext;
  late Function getMessagesOnError;

  late Function sendMessageOnComplete;
  late Function sendMessageOnError;

  final GetCurrentUser _getCurrentUser;
  final GetMessages _getMessages;
  final SendMessage _sendMessage;

  ChatPresenter(UserReposistory userReposistory, ChatRepository chatRepository)
      : _getCurrentUser = GetCurrentUser(userReposistory),
        _getMessages = GetMessages(chatRepository),
        _sendMessage = SendMessage(chatRepository);

  void getCurrentUser() {
    _getCurrentUser.execute(_GetCurrentUserObserver(this));
  }

  void getMessages(List<String> userIds) {
    _getMessages.execute(_GetMessagesObserver(this), GetMesagesParams(userIds));
  }

  void sendMessage(Message message, List<String> userIds) {
    _sendMessage.execute(
        _SendMessageObserver(this), SendMessageParams(message, userIds));
  }

  @override
  void dispose() {
    _getCurrentUser.dispose();
    _getMessages.dispose();
    _sendMessage.dispose();
  }
}

class _GetCurrentUserObserver extends Observer<User> {
  final ChatPresenter _presenter;

  _GetCurrentUserObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getCurrentUserOnError(error);
  }

  @override
  void onNext(User? user) {
    _presenter.getCurrentUserOnNext(user);
  }
}

class _GetMessagesObserver extends Observer<List<Message>?> {
  final ChatPresenter _presenter;

  _GetMessagesObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getMessagesOnError(error);
  }

  @override
  void onNext(List<Message>? messages) {
    _presenter.getMessagesOnNext(messages);
  }
}

class _SendMessageObserver extends Observer<void> {
  final ChatPresenter _presenter;

  _SendMessageObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.sendMessageOnComplete();
  }

  @override
  void onError(error) {
    _presenter.sendMessageOnError(error);
  }

  @override
  void onNext(_) {}
}
