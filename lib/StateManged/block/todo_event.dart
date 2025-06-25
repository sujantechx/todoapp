abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  String title;
  String desc;
  int priority;

  AddTodoEvent({
    required this.title,
    required this.desc,
    required this.priority,
  });
}

class FetchInitialTodoEvent extends TodoEvent {}

class CompleteTodoEvent extends TodoEvent {
  int id;
  bool isCompleted;

  CompleteTodoEvent({
    required this.id,
    required this.isCompleted,
  });

}