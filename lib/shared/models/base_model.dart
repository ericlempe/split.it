class BaseModel {
  String collection;

  BaseModel({required this.collection});

  Map<String, dynamic> toMap() {
    return {
      'collection': this.collection,
    };
  }
}
