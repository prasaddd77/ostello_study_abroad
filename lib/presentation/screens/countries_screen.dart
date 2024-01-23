import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/constants/my_list.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/country_widget.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: MyColors.primaryColor,
          onPressed: () {
            // Add your logic for the back button
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
                  text: 'In which corner of the world does your curiosity set its gaze? ',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '(Not sure select all)',
                      style: TextStyle(fontSize: 12.0, color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16.0),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CountryWidget(
                      countryName: MyList.countryNames[index],
                      flagImagePath: MyList.imageList[index],
                    );
                  },
                ),
              ),
              // const Spacer(),
              SizedBox(height: 8,),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.degreeScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
