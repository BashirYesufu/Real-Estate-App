import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/common/constants/dimensions.dart';

class HomeColumn extends StatelessWidget {
  const HomeColumn(
      {super.key, required this.title, this.circular = false, required this.numValue});

  final String title;
  final bool circular;
  final int numValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            color: circular == true ? context.colorScheme.surface : null,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 1.25,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFlipCounter(
                duration: const Duration(milliseconds: 1500),
                value: numValue,
                wholeDigits: 4,
                hideLeadingZeroes: true,
                thousandSeparator: ' ',
                textStyle: context.textTheme.labelLarge?.copyWith(
                  color: circular == true ? context.colorScheme.surface : null,
                ),
              ),
              Text(
                'offers',
                style: context.textTheme.bodySmall?.copyWith(
                  color: circular == true ? context.colorScheme.surface : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
