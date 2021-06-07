import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';
import 'stepper_button.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final bool enabledButtons;

  BottomStepperBarWidget({
    required this.onTapCancel,
    required this.onTapNext,
    this.enabledButtons = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        height: 60,
        child: Column(
          children: [
            Row(
              children: [
                StepperButtonWidget(
                    label: 'Cancelar',
                    enabled: enabledButtons,
                    onTap: onTapCancel),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                StepperButtonWidget(
                    label: 'Continuar',
                    enabled: enabledButtons,
                    onTap: onTapNext),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
