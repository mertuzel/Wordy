import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:chat_app_wordy/src/app/pages/core/core_controller.dart';
import 'package:chat_app_wordy/src/app/widgets/navigation_bar_item_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class CoreView extends View {
  @override
  State<StatefulWidget> createState() => _CoreViewState(
        CoreController(),
      );
}

class _CoreViewState extends ViewState<CoreView, CoreController> {
  _CoreViewState(CoreController controller) : super(controller);

  bool changedPageIndex = false;

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    EdgeInsets padding = MediaQuery.of(context).padding;
    return ControlledWidgetBuilder<CoreController>(
      builder: (context, controller) {
        if (!changedPageIndex) {
          changedPageIndex = true;
          Future.delayed(Duration.zero).then((_) {
            controller.onNavigationItemTap(controller.selectedIndex);
          });
        }
        return WillPopScope(
          onWillPop: () async {
            return controller.handleOnWillPop();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            key: globalKey,
            body: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      for (Widget page in controller.pages) page,
                    ],
                  ),
                ),
                _NavigationBar(size, padding),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NavigationBar extends StatelessWidget {
  final EdgeInsets padding;
  final Size size;

  const _NavigationBar(
    this.size,
    this.padding,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75 + padding.bottom,
      width: size.width,
      padding: EdgeInsets.only(
        bottom: padding.bottom,
        left: 5,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: kWhite,
        border: Border(
          top: BorderSide(
            color: Colors.black.withOpacity(0.06),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int index = 0; index < 2; index++)
            ControlledWidgetBuilder<CoreController>(
              builder: (context, controller) => NavigationBarItemButton(
                iconPath: controller.navigationItems[index]['iconPath'],
                text: controller.navigationItems[index]['text'],
                onPressed: controller.onNavigationItemTap,
                index: index,
                width: size.width / 5,
                isSelected: controller.selectedIndex == index,
              ),
            ),
        ],
      ),
    );
  }
}
