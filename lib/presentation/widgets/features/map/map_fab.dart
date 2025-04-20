import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '/common/constants/dimensions.dart';

class MapFab extends StatelessWidget {
  const MapFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: context.sizeHeight(0.11),
      right: 20,
      child: Card(
        elevation: 0,
        shape: const StadiumBorder(),
        color: context.colorScheme.tertiary.withValues(alpha: 0.6),
        child: Row(
         children: [
          Icon(
            Icons.sort_rounded,
            color: context.colorScheme.surface.withValues(alpha: 0.7),
            size: 18,
          ),
          Text(
            'List of variants',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.surface.withValues(alpha: 0.7),
            ),
          ),
        ].rowInPadding(4)).padAll(12),
      ).scale(animationDuration: 1300.ms, delay: 150.ms),
    );
  }
}
