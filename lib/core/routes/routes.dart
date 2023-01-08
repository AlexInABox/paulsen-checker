import 'package:flutter/material.dart';
import 'package:paulsen_planer/pages/home.dart';
import 'package:paulsen_planer/pages/onboarding.dart';
import 'package:paulsen_planer/pages/today_task.dart';
import 'package:paulsen_planer/pages/substitution.dart';
import 'package:paulsen_planer/pages/mensa.dart';
import 'package:paulsen_planer/pages/homework.dart';
import 'package:paulsen_planer/pages/exams.dart';

class Routes {
  static const onBoarding = "/";
  static const home = "/home";
  static const todaysTask = "/task/todays";
  static const substitution = "/substitution";
  static const mensa = "/mensa";
  static const homework = "/homework";
  static const exams = "/exams";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.todaysTask:
        return MaterialPageRoute(
          builder: ((context) => const TodaysTaskScreen()),
        );
      case Routes.substitution:
        return MaterialPageRoute(
          builder: ((context) => const SubstitutionScreen()),
        );
      case Routes.mensa:
        return MaterialPageRoute(
          builder: ((context) => const MensaScreen()),
        );
      case Routes.homework:
        return MaterialPageRoute(
          builder: ((context) => const HomeworkScreen()),
        );
      case Routes.exams:
        return MaterialPageRoute(
          builder: ((context) => const ExamsScreen()),
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
