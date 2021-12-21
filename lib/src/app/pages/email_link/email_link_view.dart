import 'package:chat_app_wordy/src/app/pages/email_link/email_link_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class EmailLinkView extends View {
  @override
  State<StatefulWidget> createState() => _EmailLinkViewState(
        EmailLinkController(),
      );
}

class _EmailLinkViewState
    extends ViewState<EmailLinkView, EmailLinkController> {
  _EmailLinkViewState(EmailLinkController controller) : super(controller);

  @override
  Widget get view {
    return Scaffold(
      backgroundColor: Colors.red,
      key: globalKey,
      body: Container(),
    );
  }
}
