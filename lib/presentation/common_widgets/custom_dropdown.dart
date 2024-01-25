import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;
  final List<String> items;

  CustomDropdown({
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.lightGreyColor, width: 1,),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        hint: const Text('Select Program', style: TextStyle(color: MyColors.lightGreyColor),),
        value: value,
        isExpanded: true,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        underline: const SizedBox(),
        onChanged: onChanged,
        items: items.map((String major) {
          return DropdownMenuItem<String>(
            value: major,
            child: Text(major),
          );
        }).toList(),
        icon: const Icon(Icons.keyboard_arrow_down_outlined, color: MyColors.lightGreyColor,),
        iconSize: 24.0,
      ),
    );
  }
}
