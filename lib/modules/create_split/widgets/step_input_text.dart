import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class StepInputTextWidget extends StatelessWidget {
  final void Function(String) onChange;
  final String hintText;
  final TextAlign align;
  final EdgeInsets? padding;

  StepInputTextWidget({
    required this.onChange,
    required this.hintText,
    this.align = TextAlign.center,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 64),
      child: TextField(
        onChanged: onChange,
        textAlign: align,
        style: AppTheme.textStyles.textField,
        cursorColor: AppTheme.colors.backgroundSecondary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTheme.textStyles.hintTextField,
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.inputBorder),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.inputBorder),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppTheme.colors.inputBorder),
          ),
        ),
      ),
    );
  }
}
