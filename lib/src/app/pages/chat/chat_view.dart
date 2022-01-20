import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/chat/chat_controller.dart';
import 'package:chat_app_wordy/src/app/widgets/message_container.dart';
import 'package:chat_app_wordy/src/data/repositories/data_chat_repository.dart';
import 'package:chat_app_wordy/src/data/repositories/data_user_repository.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ChatView extends View {
  final User peerUser;

  ChatView(this.peerUser);

  @override
  State<StatefulWidget> createState() => _ChatViewState(
        ChatController(
          DataUserRepository(),
          DataChatRepository(),
          peerUser,
        ),
      );
}

class _ChatViewState extends ViewState<ChatView, ChatController> {
  _ChatViewState(ChatController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: globalKey,
      body: ControlledWidgetBuilder<ChatController>(
          builder: (context, controller) {
        Size size = MediaQuery.of(context).size;
        EdgeInsets padding = MediaQuery.of(context).padding;

        return controller.messages == null
            ? Center(
                child: CircularProgressIndicator(
                color: kPrimaryColor,
              ))
            : Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: padding.top + 50),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith(
                                  (_) => kSplashColor),
                              padding: MaterialStateProperty.resolveWith(
                                (_) => EdgeInsets.zero,
                              ),
                              minimumSize: MaterialStateProperty.resolveWith(
                                (_) => Size(0, 0),
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: kPrimaryColor,
                              size: 27,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 5),
                          Container(
                            width: 65,
                            height: 65,
                            child: Image.asset('assets/images/user.png'),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: size.width - 198,
                            child: Text(
                              widget.peerUser.fullName,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: kChatNameStyle(kPrimaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: controller.messages!.isEmpty
                          ? Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              child: Text(
                                'No message history. Lets start a conversation',
                                textAlign: TextAlign.center,
                                style: kInputTextStyle(kBlack.withOpacity(0.2)),
                              ),
                            )
                          : ListView(
                              controller: controller.scrollController,
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              physics: AlwaysScrollableScrollPhysics(
                                parent: BouncingScrollPhysics(),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 29),
                              children: [
                                for (int i = 0;
                                    i < controller.messages!.length;
                                    i++)
                                  MessageContainer(controller.messages![i])
                              ],
                            ),
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          color: kBlack.withOpacity(0.03),
                          offset: Offset(0, 2),
                        )
                      ]),
                      margin: EdgeInsets.only(
                        left: 40,
                        right: 50,
                        bottom: padding.bottom + 10,
                      ),
                      child: TextFormField(
                        controller: controller.textEditingController,
                        onChanged: (text) {
                          controller.onMessageWrite(text.trim());
                        },
                        minLines: 1,
                        maxLines: 3,
                        style: kInputTextStyle(Colors.black87),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: controller.userMessage.length < 2
                                ? null
                                : controller.sendMessage,
                            splashColor: Colors.transparent,
                            color: kPrimaryColor,
                          ),
                          isDense: true,
                          fillColor: kWhite,
                          filled: true,
                          hintStyle: kHintTextStyle(kHintBlack),
                          hintText: 'Write your message',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
