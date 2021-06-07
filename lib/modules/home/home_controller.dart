import 'package:flutter/cupertino.dart';
import 'package:split_it/modules/home/home_state.dart';

import 'repositories/home_repository_mock.dart';
import 'repositories/home_repository.dart';
import '../../shared/models/event_model.dart';

class HomeController {
  final List<EventModel> events = [];
  late HomeRepository repository;
  Function(HomeState state)? onListen;

  HomeState state = HomeStateEmpty();

  HomeController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryMock();
  }

  getEvents() async {
    update(HomeStateLoading());
    try {
      final response = await repository.getEvents();
      events.addAll(response);
      update(HomeStateSuccess(events: events));
    } catch (e) {
      update(HomeStateFailure(message: e.toString()));
    }
  }

  void update(HomeState state) {
    this.state = state;
    if (onListen != null) {
      onListen!(state);
    }
  }

  void listen(Function(HomeState state) onChange) {
    onListen = onChange;
  }
}
