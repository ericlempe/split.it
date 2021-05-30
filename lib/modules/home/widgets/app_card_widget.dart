import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class AppCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String image;

  AppCardWidget({
    required this.title,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.colors.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.colors.backgroundSecondary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              width: 48,
              height: 48,
              child: Image.asset(image),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.textStyles.heading40,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'R\$ $value',
                  style: AppTheme.textStyles.heading60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
