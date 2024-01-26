import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/core/utils/radio_butto_text_style.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam4_provider.dart';
import 'package:ostello_task/providers/exam_providers/exma5_provider.dart';
import 'package:provider/provider.dart';

class Exam5Screen extends StatelessWidget {
  const Exam5Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Exam5Provider>(
      builder: (context, exam5Provider, child) {
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
                  Navigator.pushNamed(context, MyRoutes.exam6Screen);
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
                      text: 'Do you want online or offline classes for the exam preparation?',
                      style: TextStyle(fontSize: 17.0, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: ExamType.online,
                        groupValue: exam5Provider.examType,
                        onChanged: (value) {
                          exam5Provider.setExamType(ExamType.online);
                        },
                      ),
                      const Text('Online', style: RadioButtonTextStyle.textStyle),
                      const SizedBox(width: 20.0),
                      Radio(
                        value: ExamType.offline,
                        groupValue: exam5Provider.examType,
                        onChanged: (value) {
                          exam5Provider.setExamType(ExamType.offline);
                        },
                      ),
                      const Text('Offline', style: RadioButtonTextStyle.textStyle),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: (){
                      final examType = exam5Provider.examType;
                      print(examType);
                      Navigator.pushNamed(context, MyRoutes.exam6Screen);
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
