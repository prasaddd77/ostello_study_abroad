import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/core/constants/my_list.dart';
import 'package:ostello_task/core/routes/my_routes.dart';
import 'package:ostello_task/presentation/common_widgets/custom_button.dart';
import 'package:ostello_task/presentation/common_widgets/custom_row.dart';
import 'package:ostello_task/providers/major_subject_provider.dart';
import 'package:provider/provider.dart';

class MajorSubjectScreen extends StatefulWidget {
  MajorSubjectScreen({Key? key});

  @override
  State<MajorSubjectScreen> createState() => _MajorSubjectScreenState();
}

class _MajorSubjectScreenState extends State<MajorSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: MyColors.primaryColor,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.degreeScreen);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            color: MyColors.primaryColor,
            onPressed: () {
              final selectedMajor = Provider.of<MajorSubjectProvider>(context, listen: false).selectedMajor;
              if(selectedMajor != null) {
                Navigator.pushNamed(context, MyRoutes.budgetScreen);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please select a major subject.'),
                  )
                );
              }
            },
          ),
          //SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomRow(),
              const SizedBox(height: 16.0),
              RichText(
                text: const TextSpan(
                  text: 'What is your preferred field of study or specialization within your major? ',
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
              ),
              const SizedBox(height: 24.0),

              Container(
                //padding: EdgeInsets.only(left: 16.0, right: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.lightGreyColor, width: 1,),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Consumer<MajorSubjectProvider>(
                  builder: (context, majorSubjectProvider, child) {
                    return DropdownButton<String>(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      hint: const Text('Select Program', style: TextStyle(color: MyColors.lightGreyColor),),
                      value: majorSubjectProvider.selectedMajor,
                      isExpanded: true,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        majorSubjectProvider.selectMajor(newValue);
                      },
                      items: MyList.majors.map((String major) {
                        return DropdownMenuItem<String>(
                          value: major,
                          child: Text(major),
                        );
                      }).toList(),
                      icon: const Icon(Icons.keyboard_arrow_down_outlined, color: MyColors.lightGreyColor,), // Align icon to the end
                      iconSize: 24.0, // Adjust icon size
                    );
                  },
                ),
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  final selectedMajor = Provider.of<MajorSubjectProvider>(context, listen: false).selectedMajor;
                  if(selectedMajor != null) {
                    Navigator.pushNamed(context, MyRoutes.budgetScreen);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a major subject.'),
                        )
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
