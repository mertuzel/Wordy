import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/data/utils/string_utils.dart';
import 'package:chat_app_wordy/src/domain/entities/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessageContainer extends StatefulWidget {
  final Message message;

  MessageContainer(this.message)
      : isCurrentUser =
            message.from.id == FirebaseAuth.instance.currentUser!.uid;

  final bool isCurrentUser;

  @override
  State<MessageContainer> createState() => _MessageContainerState();
}

class _MessageContainerState extends State<MessageContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: Container(
              constraints: BoxConstraints(minHeight: 20),
              decoration: BoxDecoration(
                color: widget.isCurrentUser
                    ? kSecondaryColor
                    : kBlack.withOpacity(0.65),
                borderRadius: BorderRadius.circular(12),
              ),
              margin: EdgeInsets.symmetric(vertical: 7),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                widget.message.text,
                style: kInputTextStyle(kWhite),
              ),
            ),
          ),
          if (isTapped)
            Row(
              children: [
                SizedBox(width: 5),
                Text(
                  StringUtils.getPublishDateLong(widget.message.time),
                  style: kHintTextStyle(kNavigationBarBlack),
                ),
              ],
            )
        ],
      ),
    );
  }
}
