import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';

class CountryWidget extends StatelessWidget {
  final String countryName;
  final String flagImagePath;
  final bool isSelected;

  CountryWidget({
    required this.countryName,
    required this.flagImagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: MyColors.primaryColor,)
            : Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: MyColors.primaryColor.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 25,
            offset: const Offset(0, 0),
          ),
        ]
            : [],
      ),
      child: Column(
        children: [
          Image.asset(
            flagImagePath,
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(height: 8.0),
          Text(
            countryName,
            style: TextStyle(
              color: isSelected ? MyColors.primaryColor : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
