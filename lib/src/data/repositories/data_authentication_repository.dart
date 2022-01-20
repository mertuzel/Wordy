import 'package:chat_app_wordy/src/data/constants.dart';
import 'package:chat_app_wordy/src/domain/repositorires/authentication_repository.dart';
import 'package:chat_app_wordy/src/domain/types/sign_in_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DataAuthenticationRepository implements AuthenticationRepository {
  static final _instance = DataAuthenticationRepository._internal();
  DataAuthenticationRepository._internal();
  factory DataAuthenticationRepository() => _instance;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  bool get isUserSignedIn => _firebaseAuth.currentUser == null ? false : true;

  @override
  Future<void> sendEmailLink(String email) async {
    print('email sent');
    print(email);
    try {
      await _firebaseAuth.sendSignInLinkToEmail(
          email: email, actionCodeSettings: emailAcs);
    } on FirebaseAuthException catch (error, st) {
      print(error);
      print(st);
      rethrow;
      // if (error.code == 'invalid-email') throw Exception();
    } catch (error, st) {
      print(error);
      print(st);
      rethrow;
    }
  }

  @override
  Future<void> authenticateWithEmailLink({
    required String email,
    required String emailLink,
    required bool deleteUser,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailLink(
        email: email,
        emailLink: emailLink,
      );

      return;
    } on FirebaseAuthException catch (error, st) {
      if (error.code == 'expired-action-code' ||
          error.code == 'invalid-action-code') {
        //Handle it Later
        throw Exception();
      }
      print(error.code);
      print(st);
      rethrow;
    } catch (e, st) {
      print(e);
      print(st);
      rethrow;
    }
  }

  @override
  Future<SignInResponse> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) throw Exception();

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);

      return SignInResponse(
        updateUser: true,
        email: googleUser.email,
        fullName:
            googleUser.displayName == null || googleUser.displayName!.isEmpty
                ? 'Google User'
                : googleUser.displayName!,
      );
    } catch (error, st) {
      print(error);
      print(st);
      rethrow;
    }
  }
}
