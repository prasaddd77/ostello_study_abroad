import 'package:flutter/material.dart';
import 'package:ostello_task/core/constants/my_colors.dart';
import 'package:ostello_task/providers/degree_provider.dart';
import 'package:provider/provider.dart';

class DegreeWidget extends StatelessWidget {
  final String degree;
  final String imagePath;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  DegreeWidget({
    required this.degree,
    required this.imagePath,
    this.top,
    this.left,
    this.bottom,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DegreeProvider>(
      builder: (context, degreeProvider, _) {
        final isDegreeSelected = degreeProvider.selectedDegree == degree;

        return Positioned(
          top: top,
          left: left,
          bottom: bottom,
          right: right,
          child: GestureDetector(
            onTap: () {
              if (isDegreeSelected) {
                degreeProvider.deselectDegree();
              } else {
                degreeProvider.selectDegree(degree);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: isDegreeSelected
                    ? [
                  BoxShadow(
                    color: MyColors.primaryColor.withOpacity(0.2),
                    spreadRadius: -8,
                    blurRadius: 20,
                    offset: const Offset(0, -10),
                  ),
                ]
                    : [],
              ),
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
                //color: isDegreeSelected ? MyColors.primaryColor : null,
              ),
            ),
          ),
        );
      },
    );
  }
}
