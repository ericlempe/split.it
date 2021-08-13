import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../create_split_controller.dart';

class CreateSplitAppbarWidget extends PreferredSize {
  final VoidCallback onTapBack;
  final CreateSplitController controller;
  final int size;

  CreateSplitAppbarWidget({
    required this.onTapBack,
    required this.controller,
    required this.size,
  }) : super(
            preferredSize: Size.fromHeight(60),
            child: SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: IconButton(
                      onPressed: onTapBack,
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppTheme.colors.backButton,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Observer(
                      builder: (_) => Text.rich(
                        TextSpan(
                          text: "${controller.currentPage + 1}",
                          style: AppTheme.textStyles.stepperIndicatorPrimary,
                          children: [
                            TextSpan(
                              text: " - $size",
                              style:
                                  AppTheme.textStyles.stepperIndicatorSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
}
