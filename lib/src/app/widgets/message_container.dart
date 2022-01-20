import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  final Message message;

  MessageContainer(this.message)
      : isCurrentUser =
            message.from.id == FirebaseAuth.instance.currentUser!.uid;

  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(minHeight: 20),
        decoration: BoxDecoration(
          color: isCurrentUser ? kSecondaryColor : kBlack.withOpacity(0.65),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 7),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          message.text,
          style: kInputTextStyle(kWhite),
        ),
      ),
    );
  }
}
