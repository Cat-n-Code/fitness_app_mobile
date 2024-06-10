import 'package:fitness_app/views/chat_view.dart';
import 'package:fitness_app/views/coach_customer_view.dart';
import 'package:fitness_app/views/coach_main_view.dart';
import 'package:fitness_app/views/customer_main_view.dart';
import 'package:fitness_app/views/profile_edit_view.dart';
import 'package:fitness_app/views/customer_workout_view.dart';
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
      path: '/chat',
      builder: (context, state) => ChatView(
        chatId: state.uri.queryParameters.containsKey('chatId')
            ? int.parse(state.uri.queryParameters['chatId']!)
            : null,
        userId: state.uri.queryParameters.containsKey('userId')
            ? int.parse(state.uri.queryParameters['userId']!)
            : null,
      ),
    ),
    GoRoute(
      path: '/customer',
      builder: (context, state) => const CustomerMainView(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) => const ProfileEditView(),
    ),
    GoRoute(
      path: '/customer/workout/:id',
      builder: (context, state) => CustomerWorkoutView(
        workoutId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/coach',
      builder: (context, state) => const CoachMainView(),
    ),
    GoRoute(
      path: '/coach/customer/:id',
      builder: (context, state) => CoachCustomerView(
        customerId: int.parse(state.pathParameters['id']!),
      ),
    ),
  ],
);
