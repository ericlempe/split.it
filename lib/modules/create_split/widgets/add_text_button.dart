import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class AddTextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AddTextButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.add, color: AppTheme.colors.iconAdd,),
      label: Text(
        label,
        style: AppTheme.textStyles.stepperNextButtonRegular,
      ),
    );
  }
}
