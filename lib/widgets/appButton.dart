import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String textData;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? borderRadius;
  final IconData? iconRight;
  final IconData? iconLeft;
  final Color? buttonColor;
  final VoidCallback onTapCallBack;
  final Widget? child;
  final BoxBorder? border;
  final bool hasShadow;
  final Widget? widgetRight;

  const AppButton({
    Key? key,
    this.textStyle,
    this.width,
    this.height,
    required this.textData,
    this.iconRight,
    this.iconLeft,
    this.borderRadius,
    this.buttonColor,
    this.child,
    this.border,
    this.hasShadow = true,
    this.widgetRight,
    required this.onTapCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTapCallBack,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
          border: border,
          color: buttonColor ?? AppColors.orange,
          boxShadow: buttonColor != AppColors.gray && hasShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: const Offset(4, 4),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ]
              : [],
        ),
        height: height ?? screenHeight / 12,
        width: width,
        child: Stack(
          children: [
            iconLeft != null
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: screenWidth / 50),
                      child: Icon(iconLeft, color: Colors.white, size: 24),
                    ),
                  )
                : Container(),
            Center(
              child: child ??
                  Text(
                    textData,
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                  ),
            ),
            iconRight != null
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: screenWidth / 50),
                        child: Icon(iconRight, color: Colors.white, size: 24)))
                : widgetRight != null
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: screenWidth / 30),
                          child: widgetRight,
                        ),
                      )
                    : Container()
          ],
        ),
      ),
    );
  }
}
