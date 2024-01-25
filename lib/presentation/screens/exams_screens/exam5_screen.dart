import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/constants/my_list.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_dropdown.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam5_provider.dart';
import 'package:provider/provider.dart';

class Exam5Screen extends StatefulWidget {
  const Exam5Screen({super.key});

  @override
  State<Exam5Screen> createState() => _Exam5ScreenState();
}

class _Exam5ScreenState extends State<Exam5Screen> {
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
                  text: 'Have you decided when to take the required standardized test?',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24.0),
              Consumer<Exam5Provider>(
                builder: (context, provider, child) {
                  return CustomDropdown(
                    value: provider.selectedYear,
                    onChanged: (String? newValue) {
                      provider.selectYear(newValue);
                    },
                    items: MyList.year,
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
