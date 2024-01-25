import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: MyColors.lightGreyColor, fontSize: 16.0),
        filled: true,
        fillColor: MyColors.mediumGreyColor.withOpacity(0.08),
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
