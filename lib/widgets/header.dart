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

    return LayoutBuilder(builder: (
      BuildContext context,
      BoxConstraints constraints,
    ) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              "images/logo-horizontal.png",
              width: screenWidth /
                  (constraints.maxWidth > 760
                      ? 6
                      : constraints.maxWidth >= 501
                          ? 4
                          : 3),
            ),
          ),
          Text(title),
        ],
      );
    });
  }
}
