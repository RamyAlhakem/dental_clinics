import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/data/data_source/remote_date/auth_remote_data_source.dart';
import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:dental_clinics_app/core/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<AppResult<UserEntitie>> signUp({
    required UserModel user,
    required String role,
  }) async {
    try {
      final credential = await authRemoteDataSource
          .createUserWithEmailAndPassword(user: user);
      await authRemoteDataSource.sendEmailVerification();
      await authRemoteDataSource.createNewUser(user: user, role: role);
      return AppResult.success(
        UserEntitie(email: credential.user?.email ?? ""),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return AppResult.failure("The password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        return AppResult.failure("The account already exists for that email.");
      } else {
        return AppResult.failure("Unknown error");
      }
    } catch (e) {
      return AppResult.failure("error");
    }
  }

  @override
  Future<AppResult<UserEntitie>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await authRemoteDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AppResult.success(UserEntitie());
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        return AppResult.failure('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return AppResult.failure('Wrong password provided for that user.');
      } else {
        return AppResult.failure("Unknown error");
      }
    } catch (e) {
      return AppResult.failure("Error");
    }
  }
}
