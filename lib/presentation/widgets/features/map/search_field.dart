import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:real_estate_app/common/constants/icon_path.dart';
import '/common/constants/dimensions.dart';
import 'package:svg_flutter/svg_flutter.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.sizeHeight(0.06),
      left: 30,
      height: 80,
      width: context.sizeWidth(0.9),
      child: Row(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: TextFormField(
                controller: TextEditingController(text: 'Saint Petersburg'),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  fillColor: context.colorScheme.surface,
                  filled: true,
                  prefixIcon: SvgPicture.asset(
                    IconPath.searchBlack,
                  ).padOnly(left: 5),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 45,
                    minHeight: 30,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ).scale(animationDuration: 1200.ms, delay: 200.ms),
          ),
          CircleAvatar(
            backgroundColor: context.colorScheme.surface,
            foregroundColor: context.colorScheme.onSurface,
            child: SvgPicture.asset(
              IconPath.filter,
              height: 18,
            ),
          ).scale(animationDuration: 1210.ms, delay: 200.ms),
        ].rowInPadding(10),
      ),
    );
  }
}
