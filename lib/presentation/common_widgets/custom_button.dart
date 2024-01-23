import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed; // Add this line

  // Add the required parameter to the constructor
  const CustomButton({
    Key? key,
    required this.onPressed,
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
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
