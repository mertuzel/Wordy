import 'package:firebase_auth/firebase_auth.dart';

final emailAcs = ActionCodeSettings(
  url: 'https://wordy.page.link/bjYi',
  handleCodeInApp: true,
  androidPackageName: 'com.example.chat_app_wordy',
  androidInstallApp: true,
  androidMinimumVersion: '12',
);
