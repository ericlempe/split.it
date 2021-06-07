import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/icon_dollar_widget.dart';
import 'package:split_it/modules/home/widgets/loading_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;
  final bool isLoading;

  EventTileWidget({
    required this.model,
    this.isLoading = false,
  });

  IconDollarType get type =>
      model.value! >= 0 ? IconDollarType.receive : IconDollarType.send;

  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        children: [
          LoadingWidget(size: Size(48, 48)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: LoadingWidget(size: Size(double.maxFinite, 19)),
                    subtitle: LoadingWidget(size: Size(double.maxFinite, 19)),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          IconDollarWidget(type: type),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      model.title!,
                      style: AppTheme.textStyles.eventTileTitle,
                    ),
                    subtitle: Text(
                      model.created!.toIso8601String(),
                      style: AppTheme.textStyles.eventTileSubtitle,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "R\$ ${model.value}",
                          style: AppTheme.textStyles.eventTileMoney,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${model.people} pessoa${model.people == 1 ? '' : 's'}",
                          style: AppTheme.textStyles.eventTilePeople,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppTheme.colors.divider,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}
