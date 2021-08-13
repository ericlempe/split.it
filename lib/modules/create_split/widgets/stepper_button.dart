import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class StepperButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final bool enabled;

  StepperButtonWidget({
    required this.label,
    required this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: enabled ? onTap : null,
        child: Text(
          label,
          style: enabled
              ? AppTheme.textStyles.stepperNextButton
              : AppTheme.textStyles.stepperNextButtonDisabled,
        ),
      ),
    );
  }
}
