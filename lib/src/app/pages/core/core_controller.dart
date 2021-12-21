import 'package:chat_app_wordy/src/app/pages/chats/chats_view.dart';
import 'package:chat_app_wordy/src/app/pages/users/users_view.dart';
import 'package:chat_app_wordy/src/data/repositories/data_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CoreController extends Controller {
  late List<Widget> pages;
  int selectedIndex = 0;

  final usersPageKey = GlobalKey<NavigatorState>();
  final chatsPageKey = GlobalKey<NavigatorState>();

  PageController pageController = PageController();

  List<Map<String, dynamic>> navigationItems = [
    {'text': 'Chats', 'iconPath': 'chat.png'},
    {'text': 'Users', 'iconPath': 'users.png'},
  ];

  @override
  void onInitState() {
    selectedIndex = 0;
    pages = [
      Navigator(
        key: chatsPageKey,
        pages: [MaterialPage(child: ChatsViewHolder())],
        onPopPage: (route, result) => route.didPop(result),
      ),
      Navigator(
        key: usersPageKey,
        pages: [MaterialPage(child: UsersViewHolder())],
        onPopPage: (route, result) => route.didPop(result),
      ),
    ];
  }

  @override
  void initListeners() {
    // TODO: implement initListeners
  }

  void onNavigationItemTap(int index) async {
    if (index == 1 && selectedIndex == 1) {
      try {
        bool maybePop = await usersPageKey.currentState!.maybePop();
        return;
      } catch (e) {}
    }
    selectedIndex = index;
    pageController.jumpToPage(index);
    refreshUI();
  }

  Future<bool> handleOnWillPop() async {
    bool usersPop = false;

    try {
      if (selectedIndex == 1)
        usersPop = await usersPageKey.currentState!.maybePop();
    } catch (e) {}

    if (usersPop) return true;

    return false;
  }
}
