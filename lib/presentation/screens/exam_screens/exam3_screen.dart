import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/core/utils/radio_butto_text_style.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam1_provider.dart';
import 'package:ostello_task/providers/exam_providers/exam3_provider.dart';
import 'package:provider/provider.dart';

class Exam3Screen extends StatelessWidget {
  const Exam3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Consumer<Exam1Provider>(
          builder: (context, exam1Provider, child) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),
              color: MyColors.primaryColor,
              onPressed: () {
                final answer = exam1Provider.isEnglishTestTaken;
                print(answer);
                if (answer == true) {
                  Navigator.pushNamed(context, MyRoutes.exam2Screen);
                } else {
                  Navigator.pushNamed(context, MyRoutes.exam1Screen);
                }
              },
            );
          },
        ),
        actions: [
          Consumer<Exam3Provider>(
            builder: (context, provider, child) {
              return IconButton(
                icon: const Icon(Icons.arrow_forward),
                color: MyColors.primaryColor,
                onPressed: () {
                  final preparationStatus = provider.preparationStatus;
                  print(preparationStatus);
                  if (preparationStatus || !preparationStatus) {
                    Navigator.pushNamed(context, MyRoutes.exam4Screen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a value.'),
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
                  text:
                  'Have you started preparing for standardized tests required for your desired program or university?',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24.0),
              Consumer<Exam3Provider>(
                builder: (context, provider, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: provider.preparationStatus,
                      onChanged: (value) {
                        provider.setPreparationStatus(value!);
                      },
                    ),
                    const Text('Yes', style: RadioButtonTextStyle.textStyle),
                    const SizedBox(width: 64.0),
                    Radio<bool>(
                      value: false,
                      groupValue: provider.preparationStatus,
                      onChanged: (value) {
                        provider.setPreparationStatus(value!);
                      },
                    ),
                    const Text('No', style: RadioButtonTextStyle.textStyle),
                  ],
                ),
              ),
              const Spacer(),
              Consumer<Exam3Provider>(
                builder: (context, provider, child) {
                  return CustomButton(
                    onPressed: () {
                      final preparationStatus = provider.preparationStatus;
                      if (preparationStatus || !preparationStatus) {
                        Navigator.pushNamed(context, MyRoutes.exam4Screen);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please select a value.'),
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
