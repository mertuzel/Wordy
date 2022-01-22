import 'package:chat_app_wordy/src/app/pages/chat/chat_presenter.dart';
import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ChatController extends Controller {
  final ChatPresenter _presenter;

  ChatController(UserReposistory userReposistory, ChatRepository chatRepository,
      this.peerUser)
      : _presenter = ChatPresenter(userReposistory, chatRepository);

  User? currentUser;
  User peerUser;
  List<Message>? messages;
  String userMessage = '';
  final TextEditingController textEditingController = TextEditingController();
  late ScrollController scrollController;

  @override
  void onInitState() {
    scrollController = ScrollController();
    _presenter.getCurrentUser();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getCurrentUserOnError = (error) {};

    _presenter.getCurrentUserOnNext = (User currentUser) {
      this.currentUser = currentUser;
      _presenter.getMessages([currentUser.id, peerUser.id]);
      refreshUI();
    };

    _presenter.getMessagesOnError = (error) {};

    _presenter.getMessagesOnNext = (List<Message>? response) {
      if (response == null) return;
      print('object');

      messages = response;
      refreshUI();
      Future.delayed(Duration.zero).then((value) {
        if (scrollController.hasClients)
          scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    };

    _presenter.sendMessageOnComplete = () {
      textEditingController.clear();
      userMessage = '';
    };

    _presenter.sendMessageOnError = (error) {};
  }

  void sendMessage() {
    _presenter.sendMessage(
      Message(
        from: currentUser!,
        to: peerUser,
        time: DateTime.now(),
        text: userMessage,
      ),
      [currentUser!.id, peerUser.id],
    );
  }

  void onMessageWrite(String text) {
    userMessage = text;
    refreshUI();
  }
}
