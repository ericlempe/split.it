import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class CreateSplitAppbarWidget extends PreferredSize {
  final VoidCallback onTapBack;
  final int actualPage;
  final int size;

  CreateSplitAppbarWidget({
    required this.onTapBack,
    required this.actualPage,
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
                    child: Text.rich(TextSpan(
                      text: "$actualPage",
                      style: AppTheme.textStyles.stepperIndicatorPrimary,
                      children: [
                        TextSpan(
                          text: " - $size",
                          style:
                              AppTheme.textStyles.stepperIndicatorSecondary,
                        ),
                      ],
                    )),
                  ),
                ],
              ),
            ));
}
