import 'package:credit_card_dashboard/colors.dart';
import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  final double currentLimit;
  final double maxLimit;
  final void Function(double) onChanged;
  final Color? color;
  final double? width;

  const AppSlider({
    Key? key,
    required this.currentLimit,
    required this.maxLimit,
    required this.onChanged,
    this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 30,
        activeTrackColor: color ?? Colors.black,
        inactiveTrackColor: AppColors.gray.withOpacity(0.4),
        overlayColor: AppColors.orange.withOpacity(0.2),
        trackShape: const RectangularSliderTrackShape(),
        thumbShape: SliderComponentShape.noThumb,
      ),
      child: SizedBox(
        width: width ?? screenWidth / 3,
        child: Slider(
          value: currentLimit,
          divisions: (maxLimit / 100).round(),
          max: maxLimit,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
