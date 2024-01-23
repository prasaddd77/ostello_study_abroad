import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_container.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/scholarship_provider.dart';
import 'package:provider/provider.dart';

class ScholarshipScreen extends StatefulWidget {
  const ScholarshipScreen({super.key});

  @override
  State<ScholarshipScreen> createState() => _ScholarshipScreenState();
}

class _ScholarshipScreenState extends State<ScholarshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: MyColors.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.budgetScreen);
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
                  text: 'Are you looking for scholarship opportunities?',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
              const SizedBox(height: 42.0),
              Consumer<ScholarshipProvider>(
                builder: (context, scholarshipProvider, child) {
                  return CustomContainer(
                    text: "Yes",
                    imagePath: 'assets/images/ok.png',
                    isSelected: scholarshipProvider.isYesSelected,
                    onTap: (selected) {
                      if (selected) {
                        scholarshipProvider.selectYes();
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 16,),
              Consumer<ScholarshipProvider>(
                builder: (context, scholarshipProvider, child) {
                  return CustomContainer(
                    text: "No",
                    imagePath: 'assets/images/no.png',
                    isSelected: scholarshipProvider.isNoSelected,
                    onTap: (selected) {
                      if (selected) {
                        scholarshipProvider.selectNo();
                      }
                    },
                  );
                },
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
