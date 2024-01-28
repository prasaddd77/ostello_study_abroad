// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/constants/my_list.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_dropdown.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/answer_provider.dart';
import 'package:ostello_task/providers/exam_providers/exam6_provider.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/http_service.dart';
import '../../../providers/exam_providers/exam1_provider.dart';
import '../../common_widgets/dialog_boxes/success_failure_dialog.dart';

class Exam6Screen extends StatefulWidget {
  const Exam6Screen({super.key});

  @override
  State<Exam6Screen> createState() => _Exam6ScreenState();
}

class _Exam6ScreenState extends State<Exam6Screen> {
  @override
  Widget build(BuildContext context) {
    final exam1Provider = Provider.of<Exam1Provider>(context);
    return Consumer<Exam6Provider>(
      builder: (context, exam6Provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: MyColors.primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.exam4Screen);
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
          body: exam1Provider.questions.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomRow(),
                        const SizedBox(height: 16.0),
                        RichText(
                          text: TextSpan(
                            text: exam1Provider.questions[5]['question'],
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Consumer<Exam6Provider>(
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
                          onPressed: () async {
                            final selectedYear = exam6Provider.selectedYear;
                            final answerProvider = Provider.of<AnswerProvider>(
                              context,
                              listen: false,
                            );
                            answerProvider.updateAnswer(
                                exam1Provider.questions[5]['question'],
                                selectedYear);
                            final response = HttpService()
                                .createTestPrepQuestions(
                                    answerProvider.answerModel.toJson());
                            if (await response) {
                              CustomDialog.showSuccessDialog(context, () {
                                Navigator.popUntil(context,
                                    ModalRoute.withName(MyRoutes.homeScreen));
                              }, 'Your Answers have been submitted successfully!',
                                  'Thank you for taking the test. We will get back to you shortly.');
                            } else {
                              CustomDialog.showFailureDialog(
                                  context,
                                  "Your Answers couldn't be submitted!",
                                  'Please try again.', () {
                                Navigator.popUntil(context,
                                    ModalRoute.withName(MyRoutes.homeScreen));
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
