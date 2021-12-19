import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  static final _instance = DataAuthenticationRepository._internal();
  DataAuthenticationRepository._internal();
  factory DataAuthenticationRepository() => _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  bool get isUserSignedIn => _firebaseAuth.currentUser == null ? false : true;
}
