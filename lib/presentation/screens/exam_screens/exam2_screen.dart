import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/presentation/common_widgets/custom_textfield.dart';
import 'package:ostello_task/providers/exam_providers/exam2_provider.dart';
import 'package:provider/provider.dart';

class Exam2Screen extends StatefulWidget {
  const Exam2Screen({Key? key}) : super(key: key);

  @override
  State<Exam2Screen> createState() => _Exam2ScreenState();
}

class _Exam2ScreenState extends State<Exam2Screen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Exam2Provider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: MyColors.primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.exam1Screen);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              color: MyColors.primaryColor,
              onPressed: () {
                final enteredText =
                    Provider.of<Exam2Provider>(context, listen: false).enteredText;
                if (enteredText.isNotEmpty) {
                  Navigator.pushNamed(context, MyRoutes.exam3Screen);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter your score.'),
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
                    text:
                    'If Yes, What was your score on your most recent English proficiency test?',
                    style: TextStyle(fontSize: 17.0, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 24.0),
                CustomTextField(
                  controller: _textController,
                  onChanged: (value) {
                    Provider.of<Exam2Provider>(context, listen: false)
                        .setEnteredText(value);
                  },
                  keyboardType: TextInputType.number,
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    final enteredText =
                        Provider.of<Exam2Provider>(context, listen: false).enteredText;
                    if (enteredText.isNotEmpty) {
                      Navigator.pushNamed(context, MyRoutes.exam3Screen);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter your score.'),
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
