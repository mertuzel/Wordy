import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff071959);
const kSecondaryColor = Color(0xff4161D4);
const kBlack = Color(0xff000000);
const kWhite = Color(0xffFFFFFF);
const kLightBlack = Color(0xff000000);

Color get lightBlack => Colors.black.withOpacity(0.6);
Color get hintBlack => Colors.black.withOpacity(0.2);

TextStyle enormousTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 40,
    fontWeight: FontWeight.w800,
  );
}

TextStyle kInformationTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}

TextStyle kHeaderTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

TextStyle kButtonTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}

TextStyle kHintTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
