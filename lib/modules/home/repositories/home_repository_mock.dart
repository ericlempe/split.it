import '../../../shared/models/dashboard_model.dart';
import '../../../shared/models/event_model.dart';
import 'home_repository.dart';

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
        name: "Churrasco",
        value: 100,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: -20,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: -30,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 50,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 10,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 15.5,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: -94,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 45,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 76,
      ),
      EventModel(
        created: DateTime.now(),
        name: "Churrasco",
        value: 11,
      ),
    ];
  }
}
