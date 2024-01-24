import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';

class DegreeScreen extends StatelessWidget {
  const DegreeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: MyColors.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.countryScreen);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: MyColors.primaryColor,
            onPressed: () {
              
            },
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomRow(),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: RichText(
                text: const TextSpan(
                  text: 'Which level of degree you want to pursue abroad? ',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Stack(
                children: [
                  // Background Image
                  Image.asset(
                    'lib/core/assets/images/dotted_line.png',
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                  ),

                  Positioned(
                    top: 187.0,
                    left: 20.0,
                    child: GestureDetector(
                      child: Image.asset(
                        'lib/core/assets/images/bachelors.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120.0,
                    right: 160.0,
                    child: GestureDetector(
                      child: Image.asset(
                        'lib/core/assets/images/masters.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 40,
                    child: GestureDetector(
                      child: Image.asset(
                        'lib/core/assets/images/phd.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.majorSubjectScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
