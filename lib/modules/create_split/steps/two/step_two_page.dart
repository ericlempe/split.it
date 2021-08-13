import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

import '../../create_split_controller.dart';
import '../../steps/two/step_two_controller.dart';
import '../../widgets/person_tile.dart';
import '../../widgets/step_input_text.dart';
import '../../widgets/step_title.dart';

class StepTwoPage extends StatefulWidget {
  final CreateSplitController controller;

  StepTwoPage({required this.controller});

  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  late StepTwoController controller;

  @override
  void initState() {
    controller =  StepTwoController(controller: widget.controller);
    controller.getFriends();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(title: "Com quem", subtitle: "\n você quer dividir?"),
        StepInputTextWidget(
          hintText: "Nome da pessoa?",
          onChange: controller.onChange,
        ),
        SizedBox(
          height: 35,
        ),
        Observer(builder: (_) {
          if (controller.selectedFriends.isEmpty) {
            return Container();
          } else {
            return Column(
              children: controller.selectedFriends
                  .map((e) => PersonTileWidget(
                        data: e,
                        isRemoved: true,
                        onPressed: () {
                          controller.removeFriend(e);
                        },
                      ))
                  .toList(),
            );
          }
        }),
        SizedBox(
          height: 16,
        ),
        Observer(builder: (_) {
          if (controller.items.isEmpty) {
            return Text("Nenhum amigo encontrado");
          } else {
            return Column(
              children: controller.items
                  .map((e) => PersonTileWidget(
                        data: e,
                        onPressed: () {
                          controller.addFriend(e);
                        },
                      ))
                  .toList(),
            );
          }
        }),
      ],
    );
  }
}
