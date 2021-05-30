import 'package:flutter/material.dart';
import 'package:split_it/models/user_model.dart';
import 'package:split_it/modules/home/widgets/app_card_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;

  AppBarWidget({required this.user})
      : super(
          preferredSize: Size.fromHeight(328),
          child: Container(
            height: 328,
            child: Stack(
              children: [
                Container(
                  height: 244,
                  color: AppTheme.colors.backgroundSecondary,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, right: 24, top: 62, bottom: 120),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  width: 67,
                                  height: 62,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(user.photoUrl!),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  user.name!,
                                  style: AppTheme.textStyles.titleAppBar,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.25)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 48,
                            height: 56,
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppCardWidget(
                        title: "A receber",
                        value: "124,00",
                        image: 'assets/images/dollar-send-arrow_right.png',
                      ),
                      AppCardWidget(
                        title: "A pagar",
                        value: "48,00",
                        image: 'assets/images/dollar-send-arrow_left.png',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
}
