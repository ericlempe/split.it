import 'package:flutter/material.dart';

import '../../../../theme/app_theme.dart';
import '../../../../shared/models/user_model.dart';
import '../add_button_widget.dart';
import '../bottom_app_bar/bottom_app_bar_widget.dart';

class AppBarWidget extends SliverPersistentHeaderDelegate {
  final UserModel user;
  final VoidCallback onTapAddButton;
  final double expandedHeight;

  AppBarWidget({
    required this.user,
    required this.onTapAddButton,
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            Container(
              height: 240,
              color: AppTheme.colors.backgroundSecondary,
            ),
            Positioned(
              top: expandedHeight / 5 - shrinkOffset,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Column(
                  children: [
                    ListTile(
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
                    SizedBox(height: 40),
                    BottomAppBarWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
