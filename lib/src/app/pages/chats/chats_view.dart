import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/chats/chats_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
        key: globalKey,
        body: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(left: 35, top: padding.top + 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wordy',
                    style: kBigTextStyle(kPrimaryColor),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('assets/images/profile.svg'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
