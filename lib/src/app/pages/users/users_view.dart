import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/users/users_controller.dart';
import 'package:chat_app_wordy/src/data/repositories/data_user_repository.dart';
import 'package:chat_app_wordy/src/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsersViewHolder extends StatefulWidget {
  @override
  _UsersViewHolderState createState() => _UsersViewHolderState();
}

class _UsersViewHolderState extends State<UsersViewHolder>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return UsersView();
  }

  @override
  bool get wantKeepAlive => true;
}

class UsersView extends View {
  @override
  State<StatefulWidget> createState() => _UsersViewState(
        UsersController(
          DataUserRepository(),
        ),
      );
}

class _UsersViewState extends ViewState<UsersView, UsersController> {
  _UsersViewState(UsersController controller) : super(controller);

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      key: globalKey,
      body: ControlledWidgetBuilder<UsersController>(
          builder: (context, controller) {
        return controller.users == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 35, top: padding.top + 35, right: 35),
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
                  SizedBox(height: 60),
                  if (controller.users!.isNotEmpty)
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 35),
                      child: Text(
                        controller.users!.length.toString() + ' users',
                        style: kAuthenticationTextStyle(
                          kPrimaryColor,
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  for (int i = 0; i < controller.users!.length; i++)
                    _UserContainer(controller.users![i]),
                ],
              );
      }),
    );
  }
}

class _UserContainer extends StatelessWidget {
  final User user;

  _UserContainer(this.user);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 90,
          width: size.width,
          color: kWhite,
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 65,
                height: 65,
                child: Image.asset('assets/images/user.png'),
                decoration: BoxDecoration(shape: BoxShape.circle),
              ),
              SizedBox(width: 20),
              Text(
                user.fullName.toString(),
                style: kNameStyle(kPrimaryColor),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: 90,
          width: size.width,
          child: TextButton(
            onPressed: () {},
            child: Container(),
          ),
        ),
      ],
    );
  }
}
