import 'dart:async';

import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:chat_app_wordy/src/domain/repositorires/chat_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataChatRepository implements ChatRepository {
  static final _instance = DataChatRepository._internal();
  DataChatRepository._internal();
  factory DataChatRepository() => _instance;

  StreamController<List<Message>?> _streamController =
      StreamController.broadcast();

  List<Message>? messages;
  bool isListenMessagesInitialized = false;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late void Function(QuerySnapshot<Map<String, dynamic>?>) listenMessagesFunc;

  @override
  Stream<List<Message>?> getMessages(List<String> userIds) {
    userIds.sort((a, b) => a.compareTo(b));

    try {
      if (!isListenMessagesInitialized) {
        _listenMessages(userIds);
      }
      Future.delayed(Duration.zero).then(
        (_) => _streamController.add(messages),
      );
      return _streamController.stream;
    } catch (e, st) {
      print(e);
      print(st);
      print('Error on getOrders');
      rethrow;
    }
  }

  void _listenMessages(List<String> userIds) async {
    try {
      isListenMessagesInitialized = true;
      final firestoreStream = _firestore
          .collection('messages')
          .where('users', isEqualTo: userIds)
          .orderBy('time', descending: true)
          .snapshots();

      listenMessagesFunc = (event) {
        try {
          messages = [];

          if (event.docs.isEmpty) {
            _streamController.add([]);
            return;
          }
          if (event.docs.isNotEmpty) {
            event.docs.forEach((doc) {
              Message message = Message.fromJson(doc.data()!);
              messages!.add(message);
            });
          }
          messages!.sort((a, b) => a.time.compareTo(b.time));
          _streamController.add(messages);
        } catch (e, st) {
          print(e);
          print(st);
          rethrow;
        }
      };

      firestoreStream.listen(listenMessagesFunc);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> sendMessage(Message message, List<String> userIds) async {
    userIds.sort((a, b) => a.compareTo(b));
    try {
      await _firestore
          .collection('messages')
          .doc()
          .set(message.toJson(userIds));
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }
}
