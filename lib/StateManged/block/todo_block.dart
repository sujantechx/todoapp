import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/DataBase/database_sqlite.dart';
import 'package:todoapp/StateManged/block/todo_event.dart';
import 'package:todoapp/StateManged/block/todo_state.dart';


class TodoBloc extends Bloc<TodoEvent, TodoState> {
  DBHelper dbHelper;

  TodoBloc({required this.dbHelper}) : super(TodoState(allTodo: [])) {
    on<AddTodoEvent>((event, emit) async{

      bool check = await dbHelper.addTodo(
        title: event.title,
        desc: event.desc,
        priority: event.priority, deadline: '',
      );

      if(check){
        List<Map<String, dynamic>> mTodos = await dbHelper.fetchAllTodo();
        emit(TodoState(allTodo: mTodos));
      }

    });

    on<FetchInitialTodoEvent>((event, emit) async{
      List<Map<String, dynamic>> mTodos = await dbHelper.fetchAllTodo();
      emit(TodoState(allTodo: mTodos));
    });

    on<CompleteTodoEvent>((event, emit) async{

      bool check = await dbHelper.completeTodo(id: event.id, isCompleted: event.isCompleted);
      if(check){
        List<Map<String, dynamic>> mTodos = await dbHelper.fetchAllTodo();
        emit(TodoState(allTodo: mTodos));
      }

    });
  }
}