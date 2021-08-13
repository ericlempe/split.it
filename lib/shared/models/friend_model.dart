import 'dart:convert';

class FriendModel {
  final String name;
  final String photoURL;

  const FriendModel({
    required this.name,
    required this.photoURL,
  });

  FriendModel copyWith({
    String? name,
    String? photoURL,
  }) {
    return FriendModel(
      name: name ?? this.name,
      photoURL: photoURL ?? this.photoURL,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory FriendModel.fromJson(String source) {
    return FriendModel.fromMap(jsonDecode(source));
  }

  factory FriendModel.fromMap(Map<String, dynamic> map) {
    return FriendModel(
      name: map['name'],
      photoURL: map['photoURL'] ??
          "https://cdn.icon-icons.com/icons2/1812/PNG/512/4213460-account-avatar-head-person-profile-user_115386.png",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'photoURL': this.photoURL,
    };
  }

  @override
  String toString() {
    return 'FriendModel{name: $name, photoURL: $photoURL}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FriendModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          photoURL == other.photoURL);

  @override
  int get hashCode => name.hashCode ^ photoURL.hashCode;
}
