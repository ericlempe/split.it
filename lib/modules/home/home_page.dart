import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/home/repositories/home_repository_firebase.dart';

import '../../shared/models/event_model.dart';
import '../../shared/models/user_model.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/app_bar/app_bar_widget.dart';
import 'widgets/event_tile_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(repository: HomeRepositoryFirebase());

  @override
  void initState() {
    controller.getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: AppBarWidget(
              user: user,
              onTapAddButton: () {
                Navigator.pushNamed(context, '/create');
              },
              expandedHeight: 328,
            ),
            pinned: true,
          ),
          Observer(builder: (context) {
            if (controller.state is HomeStateLoading) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: EventTileWidget(
                        model: EventModel(),
                        isLoading: true,
                      ),
                    );
                  },
                  childCount: 6,
                ),
              );
            } else if (controller.state is HomeStateSuccess) {
              final events = (controller.state as HomeStateSuccess).events;
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: EventTileWidget(model: events[index]),
                    );
                  },
                  childCount: events.length,
                ),
              );
            } else if (controller.state is HomeStateFailure) {
              return SliverFillRemaining(
                child: Center(
                    child:
                        Text((controller.state as HomeStateFailure).message)),
              );
            } else {
              return SliverFillRemaining(
                child: Container(),
              );
            }
          }),
        ],
      ),
    );
  }
}
