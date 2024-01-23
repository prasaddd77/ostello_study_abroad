import 'package:flutter/material.dart';
import 'package:ostello_task/presentation/screens/budget_screen.dart';
import 'package:ostello_task/presentation/screens/countries_screen.dart';
import 'package:ostello_task/presentation/screens/degree_screen.dart';
import 'package:ostello_task/presentation/screens/major_subject_screen.dart';
import 'package:ostello_task/presentation/screens/scholarship_screen.dart';

class MyRoutes {
  static const String countryScreen = '/';
  static const String budgetScreen = '/budget';
  static const String degreeScreen = '/degree';
  static const String majorSubjectScreen = '/major_subject';
  static const String scholarshipScreen = '/scholarship';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case countryScreen:
        return MaterialPageRoute(builder: (_) => CountryScreen());
      case budgetScreen:
        return MaterialPageRoute(builder: (_) => BudgetScreen());
      case degreeScreen:
        return MaterialPageRoute(builder: (_) => DegreeScreen());
      case majorSubjectScreen:
        return MaterialPageRoute(builder: (_) => MajorSubjectScreen());
      case scholarshipScreen:
        return MaterialPageRoute(builder: (_) => ScholarshipScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

