import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  StepTitleWidget({
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: AppTheme.textStyles.stepperTitle,
            children: [
              TextSpan(
                  text: subtitle, style: AppTheme.textStyles.stepperSubtitle),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
