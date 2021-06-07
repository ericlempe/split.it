import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/dashboard_model.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock implements HomeRepository {
  @override
  Future<DashboardModel> getDashboard() async {
    await Future.delayed(Duration(seconds: 2));
    return DashboardModel(
      send: 100,
      receive: 50,
    );
  }

  @override
  Future<List<EventModel>> getEvents() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 100,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: -20,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: -30,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 50,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 10,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 15.5,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: -94,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 45,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 76,
        people: 2,
      ),
      EventModel(
        created: DateTime.now(),
        title: "Churrasco",
        value: 11,
        people: 2,
      ),
    ];
  }
}
