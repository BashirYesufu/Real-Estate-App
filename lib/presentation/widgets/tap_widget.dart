import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_app/presentation/widgets/wave_painter.dart';

import '../../common/constants/nav_bar.dart';

class TapWidget extends StatelessWidget {
  const TapWidget({
    super.key,
    required this.onTap,
    this.onHideBorder = false,
    required this.child,
    this.showWaves = false,
    required this.index,
    this.width,
    this.height,
    this.padding,
    this.decoration,
    this.strokeWidth,
    required this.waveAnimation,
  });

  final VoidCallback onTap;
  final bool onHideBorder;
  final Widget child;
  final bool showWaves;
  final int index;
  final double? width;
  final double? height;
  final double? strokeWidth;

  final EdgeInsets? padding;
  final Decoration? decoration;
  final Animation<double> waveAnimation;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: NavBar.navIcons.entries.toList()[index].key,
      child: InkResponse(
        onTap: onTap,
        containedInkWell: true,
        highlightShape: BoxShape.circle,
        splashColor: Colors.transparent,
        child: AnimatedContainer(
          duration: 300.ms,
          padding: padding ?? const EdgeInsets.all(12),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: decoration,
          child: Stack(
            fit: StackFit.expand,
            children: [
              showWaves
                  ? AnimatedBuilder(
                    animation: waveAnimation,
                    builder: (context, child) {
                      return !onHideBorder
                          ? const SizedBox.shrink()
                          : Center(
                            child: CustomPaint(
                              painter: WavePainter(
                                waveAnimation.value,
                                strokeWidth: strokeWidth,
                              ),
                            ),
                          );
                    },
                  )
                  : const SizedBox.shrink(),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
