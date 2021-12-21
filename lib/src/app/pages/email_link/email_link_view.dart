import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/email_link/email_link_controller.dart';
import 'package:chat_app_wordy/src/data/repositories/data_authentication_repository.dart';
import 'package:chat_app_wordy/src/data/repositories/data_user_repository.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';

class EmailLinkView extends View {
  final User user;
  final bool isRegister;

  EmailLinkView(this.user, this.isRegister);

  @override
  State<StatefulWidget> createState() => _EmailLinkViewState(
        EmailLinkController(
          DataAuthenticationRepository(),
          DataUserRepository(),
          user,
          isRegister,
        ),
      );
}

class _EmailLinkViewState
    extends ViewState<EmailLinkView, EmailLinkController> {
  _EmailLinkViewState(EmailLinkController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Scaffold(
      backgroundColor: kWhite,
      key: globalKey,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: padding.top + 10),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  iconSize: 22,
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black54,
                  )),
            ),
            SizedBox(height: size.height * 0.1),
            Center(child: SvgPicture.asset('assets/images/email_link.svg')),
            SizedBox(height: 65),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lütfen bu ekranı kapatmayarak telefonunuzdan emailinize gelen linke tıklayınız',
                textAlign: TextAlign.center,
                style: kInformationTextStyle(kPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
