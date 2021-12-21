import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarItemButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final Function(int index) onPressed;
  final int index;
  final bool isSelected;
  final double width;

  NavigationBarItemButton({
    required this.iconPath,
    required this.text,
    required this.onPressed,
    required this.index,
    required this.isSelected,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected ? kPrimaryColor : kNavigationBarBlack;
    return Container(
      width: width,
      height: 75,
      child: TextButton(
        style: ButtonStyle(
          overlayColor:
              MaterialStateColor.resolveWith((_) => Colors.transparent),
        ),
        onPressed: () => onPressed(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 20,
              child: Image.asset(
                'assets/images/$iconPath',
                color: color,
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: kHeaderTextStyle(
                color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
