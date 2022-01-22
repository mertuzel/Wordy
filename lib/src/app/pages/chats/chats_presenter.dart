import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:chat_app_wordy/src/domain/usecases/get_all_messages_of_user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ChatsPresenter extends Presenter {
  late Function getLastMessagesOfUserOnNext;
  late Function getLastMessagesOfUserOnError;

  final GetLastMessagesOfUser _getLastMessagesOfUser;

  ChatsPresenter(UserReposistory userReposistory, ChatRepository chatRepository)
      : _getLastMessagesOfUser =
            GetLastMessagesOfUser(chatRepository, userReposistory);

  void getLastMessagesOfUser() {
    _getLastMessagesOfUser.execute(_GetLastMessagesOfUserObserver(this));
  }

  @override
  void dispose() {
    _getLastMessagesOfUser.dispose();
  }
}

class _GetLastMessagesOfUserObserver extends Observer<List<Message>?> {
  final ChatsPresenter _presenter;

  _GetLastMessagesOfUserObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getLastMessagesOfUserOnError(error);
  }

  @override
  void onNext(List<Message>? messages) {
    _presenter.getLastMessagesOfUserOnNext(messages);
  }
}
