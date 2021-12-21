import 'package:chat_app_wordy/src/domain/entities/user.dart' as ent;
import 'package:chat_app_wordy/src/domain/repositorires/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataUserRepository implements UserReposistory {
  static final _instance = DataUserRepository._internal();
  DataUserRepository._internal();
  factory DataUserRepository() => _instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late ent.User _currentUser;

  @override
  Future<void> registerUser(ent.User user) async {
    try {
      _firestore
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(user.toJson());
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> initializeRepository() async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;

      final documentSnapshot =
          await _firestore.collection('users').doc(uid).get();

      _currentUser = ent.User.fromJson(documentSnapshot);
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  // TODO: implement currentUser
  ent.User get currentUser => _currentUser;
}
