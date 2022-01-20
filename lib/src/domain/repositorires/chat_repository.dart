import 'package:chat_app_wordy/src/domain/entities/message.dart';

abstract class ChatRepository {
  Stream<List<Message>?> getMessages(List<String> userIds);
  Future<void> sendMessage(Message message, List<String> userIds);
}
