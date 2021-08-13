import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../create_split_controller.dart';

class StepFourPage extends StatelessWidget {
  final CreateSplitController controller;

  const StepFourPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundSecondary,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/money.png"),
            ],
          ),
          Text("${controller.event.friends.length} pessoas"),
          Text("R\$ ${controller.event.valueSplit}"),
          Text("para cada um"),
          Row(
            children: controller.event.friends
                .map(
                  (e) => Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(e.photoURL),
                      ),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
