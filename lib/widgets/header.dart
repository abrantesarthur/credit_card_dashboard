import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "images/logo-horizontal.png",
                  width: screenWidth /
                      (constraints.maxWidth > 760
                          ? 10
                          : constraints.maxWidth >= 501
                              ? 4
                              : 3),
                ),
              ),
              SizedBox(height: screenHeight / 100),
              const Text("Bright Future Inc."),
            ],
          ),
          Text(title),
        ],
      );
    });
  }
}
