import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';

class DegreeScreen extends StatelessWidget {
  const DegreeScreen({super.key});

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
              // Add your logic for the forward button
            },
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomRow(),
              const SizedBox(height: 16.0),
              RichText(
                text: const TextSpan(
                  text: 'Which level of degree you want to pursue abroad? ',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),

              const SizedBox(height: 16.0),
              Spacer(),
              CustomButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.majorSubjectScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
