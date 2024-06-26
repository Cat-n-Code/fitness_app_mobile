import 'package:fitness_app/models/workout.dart';
import 'package:fitness_app/views/chat_view.dart';
import 'package:fitness_app/views/customer_view.dart';
import 'package:fitness_app/views/coach_main_view.dart';
import 'package:fitness_app/views/customer_main_view.dart';
import 'package:fitness_app/views/exercise_template_view.dart';
import 'package:fitness_app/views/exercise_view.dart';
import 'package:fitness_app/views/profile_edit_view.dart';
import 'package:fitness_app/views/profile_view.dart';
import 'package:fitness_app/views/workout_edit_view.dart';
import 'package:fitness_app/views/workout_exercises_view.dart';
import 'package:fitness_app/views/workout_view.dart';
import 'package:fitness_app/widgets/lists/exercises_list.dart';
import 'package:fitness_app/widgets/lists/workouts_list.dart';
import 'package:go_router/go_router.dart';
import 'package:fitness_app/views/login_view.dart';
import 'package:fitness_app/views/sign_up_profile_view.dart';
import 'package:fitness_app/views/sign_up_email_view.dart';
import 'package:fitness_app/views/startup_view.dart';

final router = GoRouter(
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
      path: '/coach',
      builder: (context, state) => const CoachMainView(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: '/profile/edit',
      builder: (context, state) => const ProfileEditView(),
    ),
    GoRoute(
      path: '/exercise_template/create',
      builder: (context, state) => const ExerciseTemplateView(),
    ),
    GoRoute(
      path: '/exercise_template/:id/edit',
      builder: (context, state) => ExerciseTemplateView(
        exerciseId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/workout/exercises',
      builder: (context, state) => ExercisesList(
        hasAddButton: false,
        hasSearchInput: true,
        onTap: (template) async {
          final exercise = await context.push(
            '/workout/exercise/add?exerciseTemplateId=${template.id}',
          );
          if (exercise != null && context.mounted) {
            context.pop(exercise);
          }
        },
      ),
    ),
    GoRoute(
      path: '/workout/exercise/add',
      builder: (context, state) => ExerciseView(
        exerciseTemplateId: int.parse(
          state.uri.queryParameters['exerciseTemplateId']!,
        ),
        onSaved: (exercise) => context.pop(exercise),
      ),
    ),
    GoRoute(
      path: '/workout/exercise/edit',
      builder: (context, state) => ExerciseView(
        exercise: state.extra as Exercise,
        onSaved: (exercise) => context.pop(exercise),
      ),
    ),
    GoRoute(
      path: '/workout/create',
      builder: (context, state) => const WorkoutEditView(),
    ),
    GoRoute(
      path: '/workout/:id/edit',
      builder: (context, state) => WorkoutEditView(
        workoutId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/workout/:id',
      builder: (context, state) => WorkoutView(
        workoutId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/workout/:id/exercises',
      builder: (context, state) => WorkoutExercisesView(
        workoutId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/customer/:id',
      builder: (context, state) => CustomerView(
        customerId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/customer/:id/workouts',
      builder: (context, state) => WorkoutsList(
        hasAddButton: false,
        hasSearchInput: true,
        onTap: (workout) async {
          final customerId = int.parse(state.pathParameters['id']!);
          final result = await context.push(
            '/customer/$customerId/workout/${workout.id!}/add',
          );
          if (result != null && context.mounted) {
            context.pop(result);
          }
        },
      ),
    ),
    GoRoute(
      path: '/customer/:customerId/workout/:workoutId/add',
      builder: (context, state) => WorkoutEditView(
        customerId: int.parse(state.pathParameters['customerId']!),
        workoutId: int.parse(state.pathParameters['workoutId']!),
        onSaved: (workout) => context.pop(workout),
      ),
    ),
  ],
);
