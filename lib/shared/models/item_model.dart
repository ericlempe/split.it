class ItemModel {
  final String name;
  final double value;

  const ItemModel({
    this.name = "",
    this.value = 0,
  });

  ItemModel copyWith({
    String? name,
    double? value,
  }) {
    return new ItemModel(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  @override
  String toString() {
    return 'ItemModel{name: $name, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          value == other.value);

  @override
  int get hashCode => name.hashCode ^ value.hashCode;

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return new ItemModel(
      name: map['name'] as String,
      value: map['value'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'name': this.name,
      'value': this.value,
    } as Map<String, dynamic>;
  }
}
