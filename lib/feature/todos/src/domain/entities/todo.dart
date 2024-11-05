final class Todo {
  final String? id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool done;

  const Todo({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.done,
  });

  factory Todo.empty() {
    return Todo(
      title: '',
      description: '',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      done: false,
    );
  }

  Todo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? done,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      done: done ?? this.done,
    );
  }
}
