import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam4_provider.dart';
import 'package:provider/provider.dart';

class Exam4Screen extends StatefulWidget {
  const Exam4Screen({super.key});

  @override
  State<Exam4Screen> createState() => _Exam4ScreenState();
}

class _Exam4ScreenState extends State<Exam4Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: MyColors.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.exam3Screen);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: MyColors.primaryColor,
            onPressed: () {
              final isAware = Provider.of<Exam4Provider>(context, listen: false).isAware;
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
                  text: 'Are you aware of the score requirements for the standardized tests?',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
              const SizedBox(height: 42.0),
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
                    const Text('Yes'),
                    const SizedBox(width: 64.0),
                    Radio<bool>(
                      value: false,
                      groupValue: provider.isAware,
                      onChanged: (value) {
                        provider.setAware(value!);
                      },
                    ),
                    const Text('No'),
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  final isAware = Provider.of<Exam4Provider>(context, listen: false).isAware;
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
