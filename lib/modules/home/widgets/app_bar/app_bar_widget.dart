import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/bottom_app_bar/bottom_app_bar_widget.dart';
import '../add_button_widget.dart';
import '../../../../shared/models/user_model.dart';
import '../../../../theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final VoidCallback onTapAddButton;

  AppBarWidget({required this.user, required this.onTapAddButton})
      : super(
          preferredSize: Size.fromHeight(298),
          child: Stack(
            children: [
              Container(
                height: 240,
                color: AppTheme.colors.backgroundSecondary,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 62),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          user.photoUrl!,
                          width: 67,
                          height: 62,
                        ),
                      ),
                      title: Text(
                        user.name!,
                        style: AppTheme.textStyles.appBar,
                      ),
                      trailing: AddButtonWidget(
                        onTap: onTapAddButton,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  BottomAppBarWidget(),
                ],
              ),
            ],
          ),
        );
}
