import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:split_it/modules/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/modules/home/widgets/loading_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class InfoCardWidget extends StatelessWidget {
  final double value;
  final bool isLoading;

  InfoCardWidget({
    required this.value,
    this.isLoading = false,
  });

  TextStyle get textStyle => value >= 0
      ? AppTheme.textStyles.infoCardSubtitle1
      : AppTheme.textStyles.infoCardSubtitle2;

  String get title => value >= 0 ? "A receber" : "A pagar";

  IconDollarType get iconDollarType =>
      value >= 0 ? IconDollarType.receive : IconDollarType.send;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156,
      height: 168,
      decoration: BoxDecoration(
        color: AppTheme.colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(10),
        border: Border.fromBorderSide(
          BorderSide(color: AppTheme.colors.border),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconDollarWidget(type: iconDollarType),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.textStyles.infoCardTitle,
              ),
              SizedBox(
                height: 4,
              ),
              if (isLoading) ...[
                LoadingWidget(size: Size(double.maxFinite, 24)),
              ] else ...[
                Text(
                  'R\$ $value',
                  style: textStyle,
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
