import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String imagePath;
  final bool isSelected;
  final Function(bool) onTap;

  CustomContainer({
    required this.text,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(!isSelected);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.67,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? MyColors.primaryColor : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10.0),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? MyColors.primaryColor : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
