import '../../../shared/models/dashboard_model.dart';
import '../../../shared/models/event_model.dart';

abstract class HomeRepository {
  Future<List<EventModel>> getEvents();

  Future<DashboardModel> getDashboard();
}
