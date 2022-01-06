import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset(
            "images/logo-horizontal-white.png",
            width: screenWidth /
                (constraints.maxWidth > 760
                    ? 6
                    : constraints.maxWidth >= 501
                        ? 4
                        : 3),
          ),
        ),
        AppButton(
          textData: "Trabalhe Conosco",
          height: constraints.maxWidth > 760 ? 50 : 40,
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: constraints.maxWidth > 760 ? 22 : 18,
            fontWeight: FontWeight.w600,
          ),
          hasShadow: false,
          border: Border.all(color: Colors.white, width: 2),
          onTapCallBack: () => Navigator.pushNamedAndRemoveUntil(
            context,
            Partners.routeName,
            (_) => false,
          ),
        )
      ],
    );
  }
}
