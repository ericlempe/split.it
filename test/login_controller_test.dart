import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:mocktail/mocktail.dart';

import 'package:split_it/shared/models/user_model.dart';
import 'package:split_it/modules/login/login_controller.dart';
import 'package:split_it/modules/login/login_service.dart';
import 'package:split_it/modules/login/login_state.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController controller;
  late LoginService service;
  setUp(() {
    service = LoginServiceMock();
    controller = LoginController(service: service);
  });

  test("Testando o Google SignIn - Success", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(service.googleSignIn)
        .thenAnswer((_) async => UserModel(email: 'email', id: 'id'));
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateLoading>());
    expect(states[2], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 3);
  });

  test("Testando o Google SignIn - Failure", () async {
    expect(controller.state, isInstanceOf<LoginStateEmpty>());
    final states = <LoginState>[];
    mobx.autorun((_) {
      states.add(controller.state);
    });
    when(service.googleSignIn).thenThrow("Deu erro");
    await controller.googleSignIn();
    expect(states[0], isInstanceOf<LoginStateEmpty>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect((states[1] as LoginStateFailure).message, "Deu erro");
    expect(states.length, 2);
  });

  test("Testando o método listen", () async {
    controller.state = LoginStateLoading();
    mobx.autorun(
        (_) => expect(controller.state, isInstanceOf<LoginStateLoading>()));
  });
}
