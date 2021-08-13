import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../shared/models/friend_model.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel data;
  final bool isRemoved;
  final VoidCallback onPressed;

  PersonTileWidget({
    required this.data,
    this.isRemoved = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(data.photoURL), fit: BoxFit.cover)),
      ),
      title: Text(
        data.name,
        style: isRemoved
            ? AppTheme.textStyles.personTileTitleSelected
            : AppTheme.textStyles.personTileTitle,
      ),
      trailing: IconButton(
        icon: isRemoved
            ? Icon(
                Icons.remove,
                color: AppTheme.colors.iconRemove,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.iconAdd,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
