import 'package:flutter/material.dart';
import 'package:gif_view/gif_view.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/core/utils/radio_butto_text_style.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam4_provider.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../providers/answer_provider.dart';
import '../../../providers/exam_providers/exam1_provider.dart';

class Exam4Screen extends StatelessWidget {
  const Exam4Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exam1Provider = Provider.of<Exam1Provider>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Consumer<Exam4Provider>(
            builder: (context, provider, child) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                color: MyColors.primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.exam3Screen);
                },
              );
            },
          ),
          actions: [
            Consumer<Exam4Provider>(
              builder: (context, provider, child) {
                return IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: MyColors.primaryColor,
                  onPressed: () {
                    final isAware = provider.isAware;
                    if (isAware || !isAware) {
                      Navigator.pushNamed(context, MyRoutes.exam5Screen);
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
          ]),
      body: exam1Provider.questions.isEmpty
          ? Center(child: GifView.asset(Assets.loadingGif))
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
                        text: exam1Provider.questions[3]['question'],
                        style: TextStyle(fontSize: 17.0, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Consumer<Exam4Provider>(
                      builder: (context, provider, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: provider.isAware,
                            onChanged: (value) {
                              provider.setAware(value!);
                            },
                          ),
                          const Text('Yes',
                              style: RadioButtonTextStyle.textStyle),
                          const SizedBox(width: 64.0),
                          Radio<bool>(
                            value: false,
                            groupValue: provider.isAware,
                            onChanged: (value) {
                              provider.setAware(value!);
                            },
                          ),
                          const Text('No',
                              style: RadioButtonTextStyle.textStyle),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Consumer<Exam4Provider>(
                      builder: (context, provider, child) {
                        return CustomButton(
                          onPressed: () {
                            final isAware = provider.isAware;
                            final answerProvider = Provider.of<AnswerProvider>(
                                context,
                                listen: false);
                            answerProvider.updateAnswer(
                                "4. ${exam1Provider.questions[3]['question']}",
                                isAware);
                            if (isAware || !isAware) {
                              Navigator.pushNamed(
                                  context, MyRoutes.exam5Screen);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select a value.'),
                                ),
                              );
                            }
                            print(answerProvider.answerModel.answers);
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
