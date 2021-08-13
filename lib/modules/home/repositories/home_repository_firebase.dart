import 'package:split_it/shared/repositories/firebase_repository.dart';

import '../../../shared/models/dashboard_model.dart';
import '../../../shared/models/event_model.dart';
import 'home_repository.dart';

class HomeRepositoryFirebase implements HomeRepository {
  final client = FirebaseRepository();

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
    try {
      final response = await client.get("/events");
      final events = response.map((e) => EventModel.fromMap(e)).toList();
      return events;
    } catch (e) {
      return [];
    }
  }
}
