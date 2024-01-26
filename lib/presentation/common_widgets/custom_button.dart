import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.title = 'Continue'
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed, // Use the provided onPressed callback
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.0),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
