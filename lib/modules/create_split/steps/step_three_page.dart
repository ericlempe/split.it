import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/widgets/person_tile.dart';
import 'package:split_it/modules/create_split/widgets/step_input_text.dart';
import 'package:split_it/modules/create_split/widgets/step_title.dart';

class StepThreePage extends StatefulWidget {
  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepTitleWidget(title: "Qual ou quais", subtitle: "\n itens você quer dividir?"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text("1"),
              ),
              Expanded(
                flex: 3,
                child: StepInputTextWidget(
                  hintText: "Ex: Picanha",
                  align: TextAlign.start,
                  padding: EdgeInsets.zero,
                  onChange: (value) {},
                ),
              ),
              Expanded(
                child: StepInputTextWidget(
                  hintText: "R\$ 0,00",
                  align: TextAlign.start,
                  padding: EdgeInsets.zero,
                  onChange: (value) {},
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
