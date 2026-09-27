import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dental_clinics_app/core/features/auth/data/data_source/remote_date/auth_remote_data_source.dart';
import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  const AuthRemoteDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });
  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required UserModel user,
  }) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<void> sendEmailVerification() async {
    await firebaseAuth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> createNewUser({
    required UserModel user,
    required String role,
  }) async {
    await firebaseFirestore.collection(role).add(user.toJson());
  }

  @override
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> sendPasswordResetemail({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
