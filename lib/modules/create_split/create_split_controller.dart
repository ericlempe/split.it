class CreateSplitController {
  String eventName = "";

  bool enableNavigateButton() {
    return eventName.isNotEmpty;
  }

  void setEventName(String name) {
    eventName = name;
  }
}