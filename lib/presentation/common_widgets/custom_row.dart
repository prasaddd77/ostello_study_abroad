import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.black, thickness: 1.0)),
        SizedBox(width: 8.0),
        Icon(Icons.circle, size: 18.0),
        SizedBox(width: 8.0),
        Expanded(child: Divider(color: Colors.black, thickness: 1.0)),
      ],
    );
  }
}
