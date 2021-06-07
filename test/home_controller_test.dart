import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/home_state.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/shared/models/event_model.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late HomeController controller;
  late HomeRepository repository;
  setUp(() {
    repository = HomeRepositoryMock();
    controller = HomeController(repository: repository);
  });

  test("Testando o getEvents - Success", () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    controller.listen((state) => states.add(state));
    when(repository.getEvents).thenAnswer(
      (_) async => [
        EventModel(
          title: 'Evento Teste',
          created: DateTime.now(),
          people: 10,
          value: 100,
        )
      ],
    );
    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateLoading>());
    expect(states[1], isInstanceOf<HomeStateSuccess>());
    expect(states.length, 2);
  });

  test("Testando o getEvents - Failure", () async {
    expect(controller.state, isInstanceOf<HomeStateEmpty>());
    final states = <HomeState>[];
    controller.listen((state) => states.add(state));
    when(repository.getEvents).thenThrow("Deu erro");
    await controller.getEvents();
    expect(states[0], isInstanceOf<HomeStateLoading>());
    expect(states[1], isInstanceOf<HomeStateFailure>());
    expect((states[1] as HomeStateFailure).message, "Deu erro");
    expect(states.length, 2);
  });
}
