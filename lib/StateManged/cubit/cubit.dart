import 'package:flutter_bloc/flutter_bloc.dart';
import '../../DataBase/database_sqlite.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final DBHelper dbHelper;

  TodoCubit({required this.dbHelper}) : super(TodoState.initial());

  Future<void> addTodo({
    required String title,
    required String desc,
    required int priority,
    required String deadline,
    int filter = 0,
  }) async {
    bool check = await dbHelper.addTodo(
      title: title,
      desc: desc,
      deadline: deadline,
      priority: priority,
    );
    if (check) {
      final todos = await dbHelper.fetchAllTodo(filter);
      emit(state.copyWith(allTodo: todos));
    }
  }

  Future<void> fetchInitialTodo({int filter = 0}) async {
    final todos = await dbHelper.fetchAllTodo(filter);
    emit(state.copyWith(allTodo: todos));
  }

  Future<void> isCompleted({
    required int id,
    bool isCompleted = false,
    int filter = 0,
  }) async {
    bool check = await dbHelper.updateTodoCompleted(id: id, isCompleted: isCompleted);
    if (check) {
      final todos = await dbHelper.fetchAllTodo(filter);
      emit(state.copyWith(allTodo: todos));
    }
  }
}
