import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../shared/models/event_model.dart';
import 'icon_dollar_widget.dart';
import 'loading_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel model;
  final bool isLoading;
  var localeDates = initializeDateFormatting('pt_BR', null);
  EventTileWidget({
    required this.model,
    this.isLoading = false,
  });

  IconDollarType get type =>
      model.value >= 0 ? IconDollarType.receive : IconDollarType.send;

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
                      model.name,
                      style: AppTheme.textStyles.eventTileTitle,
                    ),
                    subtitle: Text(
                      DateFormat("dd MMMM", "pt_BR").format(DateTime.parse(model.created!.toString())),
                      style: AppTheme.textStyles.eventTileSubtitle,
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "R\$ ${NumberFormat.currency(locale: 'pt_BR', symbol: '', decimalDigits: 2).format(model.value)}",
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
