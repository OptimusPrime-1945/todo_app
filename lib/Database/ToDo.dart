class ToDo {
  String todoTitle;
  bool status;
  String description;
  String uid;

  ToDo({this.todoTitle, this.status, this.description, this.uid});

  factory ToDo.fromMap(Map data) {
    return ToDo(
      todoTitle: data['todoTitle'] ?? " ",
      status: data['status'] ?? false,
      description: data['description'] ?? "not mentioned",
    );
  }
}
