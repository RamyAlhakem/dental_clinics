import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar/presentation/view/screens/bottom_navigation_bar_screen.dart';
import 'package:dental_clinics_app/clinic/features/home/presentation/view/screens/home_screens.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/add_new_service_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/available_times_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/services_screen.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/screens/sign_in_screen.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/screens/sign_up_screen.dart';
import 'package:dental_clinics_app/core/features/onboarding/presentation/view/screens/onboarding_screen.dart';
import 'package:dental_clinics_app/core/features/role_selection/presentation/view/screens/role_selection_screen.dart';
import 'package:dental_clinics_app/core/routing/route_names.dart';
import 'package:go_router/go_router.dart';

class RoutingConfig {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: RouteNames.onboarding,
        path: "/",
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.roleSelction,
        path: "/role",
        builder: (context, state) => RoleSelectionScreen(),
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: "/signIn",
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: "/signUp",
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.bottomNavigationBar,
        path: "/home",
        builder: (context, state) => BottomNavigationBarScreen(),
      ),
      GoRoute(
        name: RouteNames.editProfile,
        path: "/editProfile",
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        name: RouteNames.availableTimes,
        path: "/availableTimes",
        builder: (context, state) => AvailableTimesScreen(),
      ),
      GoRoute(
        name: RouteNames.services,
        path: "/services",
        builder: (context, state) => ServicesScreen(),
      ),
      GoRoute(
        name: RouteNames.addNewService,
        path: "/addNewService",
        builder: (context, state) => AddNewServiceScreen(),
      ),
    ],
  );
}
