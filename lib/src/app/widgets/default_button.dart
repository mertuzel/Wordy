import 'package:chat_app_wordy/src/app/constants.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function? onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final String? imagePath;

  const DefaultButton({
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ]),
      child: TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStateProperty.resolveWith((_) => kSplashColor)),
        onPressed: onPressed == null
            ? null
            : () {
                onPressed!();
              },
        child: Row(
          mainAxisAlignment: imagePath == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            if (imagePath != null)
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Image.asset(
                  imagePath!,
                  width: 25,
                  height: 25,
                ),
              ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: kButtonTextStyle(textColor),
            ),
            if (imagePath != null)
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Image.asset(
                  imagePath!,
                  width: 25,
                  height: 25,
                  color: Colors.transparent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
