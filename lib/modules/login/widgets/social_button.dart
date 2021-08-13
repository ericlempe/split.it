import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onTap;

  SocialButton({
    required this.imagePath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border:
              Border.fromBorderSide(BorderSide(color: AppTheme.colors.border)),
        ),
        child: Row(
          children: [
            Container(
              width: 57,
              height: 57,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Image.asset(imagePath),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    width: 1,
                    color: AppTheme.colors.border,
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Text(label, style: AppTheme.textStyles.button),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
