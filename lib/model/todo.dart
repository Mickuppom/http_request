class Welcome {
  Welcome({
    this.todo,
  });

  Todo todo;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        todo: Todo.fromJson(json["todo"]),
      );

  Map<String, dynamic> toJson() => {
        "todo": todo.toJson(),
      };
}

class Todo {
  Todo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
