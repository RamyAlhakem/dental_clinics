import 'package:dental_clinics_app/clinic/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/cubit/role_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';

class GlobalServices {
  static String _appVersion = "";
  static String get appVersion => _appVersion;
  static String _role = "";
  static String get role => _role;
  static UserEntitie _user = const UserEntitie();
  static UserEntitie get user => _user;
  static Future<void> getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      _appVersion = packageInfo.version;
    } catch (e) {
      debugPrint("App version error $e");
    }
  }

  static getInfo(BuildContext context) {
    _role = context.read<RoleCubit>().state.selectedRole!.name;
    _user = context.read<ProfileCubit>().state.user!;
  }
}
