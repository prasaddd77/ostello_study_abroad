import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/providers/degree_provider.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/presentation/common_widgets/degree_widget.dart';
import 'package:provider/provider.dart';

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
              final selectedDegree = Provider.of<DegreeProvider>(context, listen: false).selectedDegree;
              if(selectedDegree.isNotEmpty) {
                Navigator.pushNamed(context, MyRoutes.majorSubjectScreen);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select a degree.'),
                  )
                );
              }
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
                  text: 'Which level of degree do you want to pursue abroad? ',
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

                  DegreeWidget(
                    degree: 'Bachelors',
                    imagePath: 'lib/core/assets/images/bachelors.png',
                    top: 187.0,
                    left: 20.0,
                  ),
                  DegreeWidget(
                    degree: 'Masters',
                    imagePath: 'lib/core/assets/images/masters.png',
                    top: 120.0,
                    right: 160.0,
                  ),
                  DegreeWidget(
                    degree: 'PhD',
                    imagePath: 'lib/core/assets/images/phd.png',
                    top: 0,
                    right: 40,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomButton(
                onPressed: () {
                  final selectedDegree = Provider.of<DegreeProvider>(context, listen: false).selectedDegree;
                  if(selectedDegree.isNotEmpty) {
                    Navigator.pushNamed(context, MyRoutes.majorSubjectScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a degree.'),
                        )
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
