import 'package:chat_app_wordy/src/app/pages/chats/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ChatsViewHolder extends StatefulWidget {
  @override
  _ChatsViewHolderState createState() => _ChatsViewHolderState();
}

class _ChatsViewHolderState extends State<ChatsViewHolder>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChatsView();
  }

  @override
  bool get wantKeepAlive => true;
}

class ChatsView extends View {
  @override
  State<StatefulWidget> createState() => _ChatsViewSate(
        ChatsController(),
      );
}

class _ChatsViewSate extends ViewState<ChatsView, ChatsController> {
  _ChatsViewSate(ChatsController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      body: Container(),
    );
  }
}
