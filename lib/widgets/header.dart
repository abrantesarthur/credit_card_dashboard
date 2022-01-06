import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final double? titleLeftPadding;

  const Header({
    Key? key,
    required this.title,
    this.titleLeftPadding,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "images/logo-horizontal.png",
                  width: constraints.maxWidth > 760
                      ? 100
                      : constraints.maxWidth >= 501
                          ? 80
                          : 50,
                ),
              ),
              SizedBox(height: screenHeight / 80),
              const Text(
                "Bright Future Inc.",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            width: titleLeftPadding ?? screenWidth / 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
        ],
      );
    });
  }
}
