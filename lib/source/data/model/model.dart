class MyModel {
  final int id;
  final String name;
  final String items;
  final bool checklistCompletionStatus;

  MyModel({required this.id, required this.name, required this.items, required this.checklistCompletionStatus});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(
      id: json["id"],
      name: json["name"],
      items: json["items"],
      checklistCompletionStatus: json["checklistCompletionStatus"],
    );
  }
}
