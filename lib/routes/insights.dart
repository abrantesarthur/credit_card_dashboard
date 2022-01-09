import 'package:flutter/material.dart';

class Insights extends StatelessWidget {
  const Insights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: 150,
          width: 100,
          color: Colors.white,
        ),
        SizedBox(height: screenHeight / 25),
        Container(
          color: Colors.white,
          child: Column(
            children: [],
          ),
        ),
      ],
    );
  }
}
