import 'package:dental_clinics_app/clinic/features/profile/data/data_source/remote_data/profile_remote_data_source.dart';
import 'package:dental_clinics_app/clinic/features/profile/data/models/service_model.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/repository/profile_repository.dart';
import 'package:dental_clinics_app/core/errors/app_result.dart';
import 'package:dental_clinics_app/core/features/auth/data/models/user_model.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:firebase_core/firebase_core.dart';

class ProfileRepositoryImp implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImp({required this.profileRemoteDataSource});
  @override
  Future<AppResult<UserEntitie>> getInfo({
    required String role,
    required String userId,
  }) async {
    try {
      final data = await profileRemoteDataSource.getInfoUser(
        role: role,
        userId: userId,
      );
      final docId = data.docs.first.id;

      final info = data.docs.first.data();
      info.addAll({"docId": docId});
      print("get info===================>>>>>>>>>>> $info");
      return AppResult.success(UserModel.fromJson(info));
    } on FirebaseException catch (e) {
      return AppResult.failure("Firebase error occur");
    } catch (e) {
      return AppResult.failure("Unknown error");
    }
  }

  @override
  Future<AppResult<String>> addNewService({
    required String role,
    required String docId,
    required ServiceModel service,
  }) async {
    try {
      await profileRemoteDataSource.addNewService(
        role: role,
        docId: docId,
        service: service,
      );
      return AppResult.success("Service added successfully");
    } on FirebaseException catch (e) {
      return AppResult.failure("Firebase exception ");
    } catch (e) {
      return AppResult.failure("Unknown error ");
    }
  }
}
