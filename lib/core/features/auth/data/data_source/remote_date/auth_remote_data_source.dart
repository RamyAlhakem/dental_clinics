import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> createUserWithEmailAndPassword({
    required UserModel user,
  });
  Future<void> sendEmailVerification();
  Future<void> createNewUser({required UserModel user, required String role});
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> sendPasswordResetemail({required String email});
}
