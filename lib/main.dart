import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/providers/career_path_providers/major_subject_provider.dart';
import 'package:provider/provider.dart';

import 'core/utils/pref_utils.dart';
import 'providers/career_path_providers/country_provider.dart';
import 'providers/career_path_providers/degree_provider.dart';
import 'providers/exam_providers/exam1_provider.dart';
import 'providers/exam_providers/exam2_provider.dart';
import 'providers/exam_providers/exam3_provider.dart';
import 'providers/exam_providers/exam4_provider.dart';
import 'providers/exam_providers/exam6_provider.dart';
import 'providers/exam_providers/exma5_provider.dart';
import 'providers/home_page_provider.dart';
import 'providers/career_path_providers/scholarship_provider.dart';
import 'providers/career_path_providers/slider_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => SliderProvider()),
        ChangeNotifierProvider(create: (_) => ScholarshipProvider()),
        ChangeNotifierProvider(create: (_) => CountryProvider()),
        ChangeNotifierProvider(create: (_) => DegreeProvider()),
        ChangeNotifierProvider(create: (_) => MajorSubjectProvider()),
        ChangeNotifierProvider(create: (_) => Exam1Provider()),
        ChangeNotifierProvider(create: (_) => Exam2Provider()),
        ChangeNotifierProvider(create: (_) => Exam3Provider()),
        ChangeNotifierProvider(create: (_) => Exam4Provider()),
        ChangeNotifierProvider(create: (_) => Exam5Provider()),
        ChangeNotifierProvider(create: (_) => Exam6Provider()),
      ],
      // Uncomment the code below when you do not want to use the device preview

      //child: const MyApp(),

      //Comment the code below when you do not want to use the device preview
      child: DevicePreview(
        builder: (context) => MyApp(),
      ),
    ),);
  });
  // runApp(
  //   MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => HomePageProvider()),
  //       ChangeNotifierProvider(create: (_) => SliderProvider()),
  //       ChangeNotifierProvider(create: (_) => ScholarshipProvider()),
  //       ChangeNotifierProvider(create: (_) => CountryProvider()),
  //       ChangeNotifierProvider(create: (_) => DegreeProvider()),
  //       ChangeNotifierProvider(create: (_) => MajorSubjectProvider()),
  //       ChangeNotifierProvider(create: (_) => Exam1Provider()),
  //       ChangeNotifierProvider(create: (_) => Exam2Provider()),
  //       ChangeNotifierProvider(create: (_) => Exam3Provider()),
  //       ChangeNotifierProvider(create: (_) => Exam4Provider()),
  //       ChangeNotifierProvider(create: (_) => Exam5Provider()),
  //     ],
  //     // Uncomment the code below when you do not want to use the device preview
  //
  //     // child: const MyApp(),
  //
  //     // Comment the code below when you do not want to use the device preview
  //     child: DevicePreview(
  //       builder: (context) => MyApp(),
  //     ),
  //   ),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      child: MaterialApp(
        title: 'Flutter Demo',
        // Comment three lines of code below when you do not want to use the device preview
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Avenir',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        //home: const CountryScreen(),
        initialRoute: MyRoutes.homeScreen,
        onGenerateRoute: MyRoutes.generateRoute,
      ),
    );
  }
}
