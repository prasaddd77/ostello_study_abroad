import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/slider_provider.dart';
import 'package:provider/provider.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: MyColors.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.majorSubjectScreen);
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
                  text: 'What\'s your financial scope for tuition and day-to-day costs? ',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '(On monthly basis)',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Consumer<SliderProvider>(
                builder: (context, sliderProvider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${sliderProvider.startValue.toInt()}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      Text('\$${sliderProvider.endValue.toInt()}', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    ],
                  );
                },
              ),
              Consumer<SliderProvider>(
                builder: (context, sliderProvider, child) {
                  return RangeSlider(
                    values: RangeValues(sliderProvider.startValue, sliderProvider.endValue),
                    min: 0.0,
                    max: 200.0,
                    onChanged: (RangeValues values) {
                      sliderProvider.updateValues(values.start, values.end);
                    },
                    labels: RangeLabels(
                      '${sliderProvider.startValue}',
                      '${sliderProvider.endValue}',
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),
              const Spacer(),
              CustomButton(
                onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.scholarshipScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
