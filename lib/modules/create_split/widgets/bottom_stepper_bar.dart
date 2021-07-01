import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/theme/app_theme.dart';
import 'stepper_button.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final VoidCallback onTapNext;
  final CreateSplitController controller;

  BottomStepperBarWidget({
    required this.onTapCancel,
    required this.onTapNext,
    required this.controller,
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
                Observer(
                  builder: (context) {
                    return StepperButtonWidget(
                        label: 'Cancelar',
                        enabled: controller.enableNavigateButton,
                        onTap: onTapCancel);
                  }
                ),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                Observer(
                  builder: (context) {
                    return StepperButtonWidget(
                        label: 'Continuar',
                        enabled: controller.enableNavigateButton,
                        onTap: onTapNext);
                  }
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
