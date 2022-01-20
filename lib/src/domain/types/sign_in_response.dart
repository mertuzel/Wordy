class SignInResponse {
  final bool updateUser;
  final String? email;
  final String? fullName;

  SignInResponse({
    required this.updateUser,
    this.email,
    this.fullName,
  });
}
