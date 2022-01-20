import 'package:chat_app_wordy/src/domain/types/sign_in_response.dart';

abstract class AuthenticationRepository {
  bool get isUserSignedIn;
  Future<void> sendEmailLink(String email);
  Future<void> authenticateWithEmailLink({
    required String email,
    required String emailLink,
    required bool deleteUser,
  });

  Future<SignInResponse> signInWithGoogle();
}
