import 'package:dental_clinics_app/clinic/features/bottom_navigation_bar/presentation/view/screens/bottom_navigation_bar_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/domain/entities/service_entitie.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/add_new_service_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/available_times_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/contact_support_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/edit_profile_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/language_screen.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/screen_day.dart';
import 'package:dental_clinics_app/clinic/features/profile/presentation/view/screens/services_screen.dart';
import 'package:dental_clinics_app/core/features/auth/presentation/view/screens/reset_password.dart';
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
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        name: RouteNames.roleSelction,
        path: "/role",
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        name: RouteNames.signIn,
        path: "/signIn",
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        name: RouteNames.signUp,
        path: "/signUp",
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        name: RouteNames.bottomNavigationBar,
        path: "/home",
        builder: (context, state) => const BottomNavigationBarScreen(),
      ),
      GoRoute(
        name: RouteNames.editProfile,
        path: "/editProfile",
        builder: (context, state) => const EditProfileScreen(),
      ),
      GoRoute(
        name: RouteNames.availableTimes,
        path: "/availableTimes",
        builder: (context, state) => const AvailableTimesScreen(),
      ),
      GoRoute(
        name: RouteNames.services,
        path: "/services",
        builder: (context, state) => const ServicesScreen(),
      ),
      GoRoute(
        name: RouteNames.addNewService,
        path: "/addNewService",
        builder: (context, state) =>
            AddNewServiceScreen(service: state.extra as ServiceEntities?),
      ),
      GoRoute(
        name: RouteNames.screenDay,
        path: "/screenDay",
        builder: (context, state) => const ScreenDay(),
      ),
      GoRoute(
        name: RouteNames.languageScreen,
        path: "/languageScreen",
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        name: RouteNames.contactSupportScreen,
        path: "/contactSupportScreen",
        builder: (context, state) => const ContactSupportScreen(),
      ),
      GoRoute(
        name: RouteNames.resetPassword,
        path: "/resetPassword",
        builder: (context, state) => const ResetPasswordScreen(),
      ),
    ],
  );
}
