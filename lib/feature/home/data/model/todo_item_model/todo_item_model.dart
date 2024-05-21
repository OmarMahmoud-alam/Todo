import 'todo.dart';

class TodoItemModel {
  List<Todo>? todos;
  int? total;
  int? skip;
  int? limit;

  TodoItemModel({this.todos, this.total, this.skip, this.limit});

  factory TodoItemModel.fromJson(Map<String, dynamic> json) => TodoItemModel(
        todos: (json['todos'] as List<dynamic>?)
            ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'todos': todos?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
