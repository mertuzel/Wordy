import 'package:chat_app_wordy/src/domain/entities/user.dart';

abstract class UserReposistory {
  Future<void> registerUser(User user);
  Future<void> initializeRepository();
  User get currentUser;
}
