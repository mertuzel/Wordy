abstract class AuthenticationRepository {
  bool get isUserSignedIn;
  Future<void> sendEmailLink(String email);
  Future<void> authenticateWithEmailLink({
    required String email,
    required String emailLink,
    required bool deleteUser,
  });
}
