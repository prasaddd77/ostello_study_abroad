import 'package:flutter/cupertino.dart';
import 'package:ostello_task/core/routes/my_routes.dart';

class OnTapFunctions {
  final List<Function(BuildContext)> onTaps = [
    exploreUniversitiesOnTap,
    testPreparationOnTap,
    collegeMatchmakerOnTap,
    scholarshipOnTap
  ];

  static void exploreUniversitiesOnTap(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.countryScreen);
  }

  static void testPreparationOnTap(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.exam1Screen);
  }

  static void collegeMatchmakerOnTap(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.countryScreen);
  }

  static void scholarshipOnTap(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.countryScreen);
  }
}
