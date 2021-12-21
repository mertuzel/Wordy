import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff071959);
const kSecondaryColor = Color(0xff4161D4);
const kBlack = Color(0xff000000);
const kWhite = Color(0xffFFFFFF);
final kSplashColor = Color(0xff071959).withOpacity(0.2);
final kLightBlack = Colors.black.withOpacity(0.6);
final kHintBlack = Colors.black.withOpacity(0.2);
final kAuthBlack = Colors.black.withOpacity(0.3);

TextStyle kEnormousTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 40,
    fontWeight: FontWeight.w800,
  );
}

TextStyle kBigTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 30,
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

TextStyle kAuthenticationTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
}

TextStyle kInputTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

TextStyle kHintTextStyle(Color color) {
  return TextStyle(
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
}
