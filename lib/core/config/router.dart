import 'package:go_router/go_router.dart';

import '../../features/home/pages/home_page.dart';
import '../../features/news/pages/news_detail_page.dart';
import '../../features/operation/pages/add_operation_page.dart';
import '../../features/operation/pages/edit_operation_page.dart';
import '../../features/quiz/pages/quiz_comments_page.dart';
import '../../features/quiz/pages/quiz_questions_page.dart';
import '../../features/settings/pages/my_profile_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/news.dart';
import '../models/operation.dart';
import '../models/quiz.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/add',
      builder: (context, state) => const AddOperationPage(),
    ),
    GoRoute(
      path: '/edit',
      builder: (context, state) => EditOperationPage(
        operation: state.extra as Operation,
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const MyProfilePage(),
    ),
    GoRoute(
      path: '/question',
      builder: (context, state) => const QuizQuestionsPage(),
    ),
    GoRoute(
      path: '/comments',
      builder: (context, state) => QuizCommentsPage(
        quiz: state.extra as Quiz,
      ),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) => NewsDetailPage(
        news: state.extra as News,
      ),
    ),
  ],
);
