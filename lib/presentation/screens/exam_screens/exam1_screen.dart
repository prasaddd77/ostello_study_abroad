import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/core/utils/radio_butto_text_style.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam1_provider.dart';
import 'package:provider/provider.dart';

class Exam1Screen extends StatelessWidget {
  const Exam1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.primaryColor),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.homeScreen);
          },
        ),
        actions: [
          Consumer<Exam1Provider>(
            builder: (context, provider, child) {
              return IconButton(
                icon: const Icon(Icons.arrow_forward, color: MyColors.primaryColor),
                onPressed: () {
                  final answer = provider.isEnglishTestTaken;
                  print(answer);
                  if (answer != null) {
                    Navigator.pushNamed(context, answer == true ? MyRoutes.exam2Screen : MyRoutes.exam3Screen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an option.'),
                      ),
                    );
                  }
                },
              );
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
                  text: 'Have you taken this English proficiency tests?',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24.0),
              Consumer<Exam1Provider>(
                builder: (context, provider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: provider.isEnglishTestTaken,
                      onChanged: (value) {
                        provider.setEnglishTestTaken(value!);
                        print(provider.isEnglishTestTaken);
                      },
                    ),
                    const Text('Yes', style: RadioButtonTextStyle.textStyle),
                    const SizedBox(width: 64.0),
                    Radio<bool>(
                      value: false,
                      groupValue: provider.isEnglishTestTaken,
                      onChanged: (value) {
                        provider.setEnglishTestTaken(value!);
                        print(provider.isEnglishTestTaken);
                      },
                    ),
                    const Text('No', style: RadioButtonTextStyle.textStyle),
                  ],
                ),
              ),
              const Spacer(),
              Consumer<Exam1Provider>(
                builder: (context, provider, child) {
                  return CustomButton(
                    onPressed: () {
                      final answer = provider.isEnglishTestTaken;
                      if (answer != null) {
                        Navigator.pushNamed(context, answer == true ? MyRoutes.exam2Screen : MyRoutes.exam3Screen);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select an option.'),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
