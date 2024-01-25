import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam1_provider.dart';
import 'package:provider/provider.dart';

class Exam1Screen extends StatefulWidget {
  const Exam1Screen({Key? key}) : super(key: key);

  @override
  State<Exam1Screen> createState() => _Exam1ScreenState();
}

class _Exam1ScreenState extends State<Exam1Screen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Exam1Provider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: MyColors.primaryColor),
            onPressed: () {
              //Navigator.pushNamed(context, MyRoutes.budgetScreen);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: MyColors.primaryColor),
              onPressed: () {
                final answer = Provider.of<Exam1Provider>(context, listen: false).isEnglishTestTaken;
                print(answer);
                if (answer) {
                  Navigator.pushNamed(context, MyRoutes.exam2Screen);
                } else if (!answer) {
                  Navigator.pushNamed(context, MyRoutes.exam3Screen);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an option.'),
                    ),
                  );
                }
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
                    text: 'Have you taken this English proficiency tests ?',
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
                        },
                      ),
                      const Text('Yes'),
                      const SizedBox(width: 64.0),
                      Radio<bool>(
                        value: false,
                        groupValue: provider.isEnglishTestTaken,
                        onChanged: (value) {
                          provider.setEnglishTestTaken(value!);
                        },
                      ),
                      const Text('No'),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    final answer = Provider.of<Exam1Provider>(context, listen: false).isEnglishTestTaken;
                    if (answer) {
                      Navigator.pushNamed(context, MyRoutes.exam2Screen);
                    } else if (!answer) {
                      Navigator.pushNamed(context, MyRoutes.exam3Screen);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select an option.'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
