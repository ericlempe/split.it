import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter/material.dart';

import 'step_input_text.dart';

class StepMultiInputTextWidget extends StatefulWidget {
  final int count;
  final String? initialName;
  final double? initialValue;
  final ValueChanged<String> itemName;
  final ValueChanged<double> itemValue;
  final VoidCallback? onDelete;
  final bool isRemoved;

  StepMultiInputTextWidget({
    Key? key,
    required this.count,
    required this.itemName,
    required this.itemValue,
    this.initialName,
    this.initialValue,
    this.isRemoved = false,
    this.onDelete,
  }) : super(key: key);

  @override
  _StepMultiInputTextWidgetState createState() =>
      _StepMultiInputTextWidgetState();
}

class _StepMultiInputTextWidgetState extends State<StepMultiInputTextWidget> {
  late MoneyMaskedTextController valueInputTextController =
      MoneyMaskedTextController(
    initialValue: widget.initialValue ?? 0,
    leftSymbol: "R\$",
    decimalSeparator: ",",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text("${widget.count}"),
          ),
          Expanded(
            flex: 3,
            child: StepInputTextWidget(
              initialValue: widget.initialName,
              hintText: "Ex: Picanha",
              align: TextAlign.start,
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemName(value);
              },
            ),
          ),
          Expanded(
            child: StepInputTextWidget(
              textInputType: TextInputType.number,
              controller: valueInputTextController,
              hintText: "R\$ 0,00",
              align: TextAlign.start,
              padding: EdgeInsets.zero,
              onChange: (value) {
                widget.itemValue(valueInputTextController.numberValue);
              },
            ),
          ),
          if (widget.isRemoved)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                if (widget.onDelete != null) {
                  widget.onDelete!();
                }
              },
            ),
        ],
      ),
    );
  }
}
