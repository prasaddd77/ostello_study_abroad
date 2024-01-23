import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  final String countryName;
  final String flagImagePath;

  CountryWidget({
    required this.countryName,
    required this.flagImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          flagImagePath,
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.width * 0.4,
        ),
        //const SizedBox(height: 4.0),
        Text(countryName, style: const TextStyle(fontSize: 14.0),),
      ],
    );
  }
}
