import 'package:flutter/material.dart';

class PersonTileWidget extends StatelessWidget {
  final String name;
  final bool isRemoved;

  PersonTileWidget({
    required this.name,
    this.isRemoved = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        color: Colors.grey.shade200,
      ),
      title: Text(name),
      trailing: IconButton(
        icon: isRemoved ? Icon(Icons.remove) : Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
