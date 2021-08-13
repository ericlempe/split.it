import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../create_split_controller.dart';
import 'stepper_button.dart';

class BottomStepperBarWidget extends StatelessWidget {
  final VoidCallback onTapCancel;
  final CreateSplitController controller;

  BottomStepperBarWidget({
    Key? key,
    required this.onTapCancel,
    required this.controller,
  }) : super(key: key);

  void onTapNext() {
    if (controller.currentPage == 2) {
      controller.saveEvent();
    } else {
      controller.nextPage();
    }
  }

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
                Observer(builder: (context) {
                  return StepperButtonWidget(
                      label: 'Cancelar',
                      enabled: controller.enableNavigateButton,
                      onTap: onTapCancel);
                }),
                Container(
                  width: 1,
                  height: 60,
                  color: AppTheme.colors.divider,
                ),
                Observer(builder: (context) {
                  return StepperButtonWidget(
                      label: controller.currentPage == 2
                          ? "Finalizar"
                          : "Continuar",
                      enabled: controller.enableNavigateButton,
                      onTap: onTapNext);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
