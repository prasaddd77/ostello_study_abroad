import 'package:flutter/material.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/screens/budget_screen.dart';
import 'package:ostello_task/presentation/screens/countries_screen.dart';
import 'package:ostello_task/presentation/screens/degree_screen.dart';
import 'package:ostello_task/presentation/screens/major_subject_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CountryScreen(),
      initialRoute: MyRoutes.countryScreen,
      onGenerateRoute: MyRoutes.generateRoute,
    );
  }
}
