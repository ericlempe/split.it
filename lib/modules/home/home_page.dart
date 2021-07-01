import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'widgets/app_bar/app_bar_widget.dart';
import 'widgets/event_tile_widget.dart';
import '../../shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

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
      appBar: AppBarWidget(
        user: user,
        onTapAddButton: () {
          Navigator.pushNamed(context, '/create');
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(builder: (context) {
                if (controller.state is HomeStateLoading) {
                  return Column(
                    children: List.generate(
                      6,
                      (index) => EventTileWidget(
                        model: EventModel(),
                        isLoading: true,
                      ),
                    ),
                  );
                } else if (controller.state is HomeStateSuccess) {
                  return Column(
                    children: (controller.state as HomeStateSuccess)
                        .events
                        .map((e) => EventTileWidget(model: e))
                        .toList(),
                  );
                } else if (controller.state is HomeStateFailure) {
                  return Text((controller.state as HomeStateFailure).message);
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
