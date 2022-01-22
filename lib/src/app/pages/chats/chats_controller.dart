import 'package:chat_app_wordy/src/app/pages/chats/chats_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ChatsController extends Controller {
  final ChatsPresenter _presenter;

  ChatsController(
      UserReposistory userReposistory, ChatRepository chatRepository)
      : _presenter = ChatsPresenter(userReposistory, chatRepository);

  List<Message>? lastMessages;

  @override
  void onInitState() {
    _presenter.getLastMessagesOfUser();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getLastMessagesOfUserOnError = (error) {};

    _presenter.getLastMessagesOfUserOnNext = (List<Message>? response) {
      if (response == null) return;
      lastMessages = response;
      refreshUI();
    };
  }
}
