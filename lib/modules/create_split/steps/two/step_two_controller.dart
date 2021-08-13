import 'package:mobx/mobx.dart';

import '../../create_split_controller.dart';
import '../../../../shared/models/friend_model.dart';
import '../../../../shared/repositories/firebase_repository.dart';

part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final CreateSplitController controller;

  _StepTwoControllerBase({required this.controller}) {
    autorun((_) => {
      controller.onChanged(friends: _selectedFriends)
    });
  }

  final repository = FirebaseRepository();

  @observable
  List<FriendModel> _friends = [];

  @observable
  ObservableList<FriendModel> _selectedFriends = ObservableList.of([]);

  List<FriendModel> get selectedFriends => _selectedFriends;

  @action
  void addFriend(FriendModel friend) {
    _selectedFriends.add(friend);
  }

  @action
  void removeFriend(FriendModel friend) {
    _selectedFriends.remove(friend);
  }

  @observable
  String search = "";

  @action
  void onChange(String value) {
    search = value;
  }

  @computed
  List<FriendModel> get items {
    if (_selectedFriends.isNotEmpty) {
      final filteredList = _friends.where((element) {
        final contains = element.name
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase());
        final notAdd = !_selectedFriends.contains(element);
        return contains && notAdd;
      }).toList();
      return filteredList;
    }

    if (search.isEmpty) {
      return _friends;
    } else {
      final filteredList = _friends
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
      return filteredList;
    }
  }

  @action
  Future<void> getFriends() async {
    final response = await this.repository.get("/friends");
    _friends = response.map((e) => FriendModel.fromMap(e)).toList();
  }
}
