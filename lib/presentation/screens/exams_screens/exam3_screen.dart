import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/exam_providers/exam3_provider.dart';
import 'package:provider/provider.dart';

class Exam3Screen extends StatefulWidget {
  const Exam3Screen({Key? key}) : super(key: key);

  @override
  State<Exam3Screen> createState() => _Exam3ScreenState();
}

class _Exam3ScreenState extends State<Exam3Screen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Exam3Provider(),
      child: Scaffold(
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
                final preparationStatus =
                    Provider.of<Exam3Provider>(context, listen: false).preparationStatus;
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
                      const Text('Yes'),
                      const SizedBox(width: 64.0),
                      Radio<bool>(
                        value: false,
                        groupValue: provider.preparationStatus,
                        onChanged: (value) {
                          provider.setPreparationStatus(value!);
                        },
                      ),
                      const Text('No'),
                    ],
                  ),
                ),
                const Spacer(),
                CustomButton(
                  onPressed: () {
                    final preparationStatus =
                        Provider.of<Exam3Provider>(context, listen: false).preparationStatus;
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
