import 'package:fitness_app/views/customer_main_view.dart';
import 'package:fitness_app/views/customer_profile_edit.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/views/login_view.dart';
import 'package:fitness_app/views/sign_up_profile_view.dart';
import 'package:fitness_app/views/sign_up_email_view.dart';
import 'package:fitness_app/views/startup_view.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/startup',
      builder: (context, state) => const StartupView(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) => const SignUpEmailView(),
    ),
    GoRoute(
      path: '/sign_up/profile',
      builder: (context, state) => const SignUpProfileView(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: '/customer',
      builder: (context, state) => const CustomerMainView(),
    ),
    GoRoute(
      path: '/customer/profile/edit',
      builder: (context, state) => const CustomerProfileEditView(),
    )
  ],
);
