import 'package:flutter/material.dart';
import 'package:todoapp/datbase/database_helper.dart';

class DbProvider extends ChangeNotifier{
  DbProvider({required this.dbHelper});
  // DbProvider dbHelper; this prblem
  final DBHelper dbHelper;
  List<Map<String ,dynamic>> _allTodo=[];
  List<Map<String,dynamic>> getData()=>_allTodo;

  // event

  addTodo({
    required String title,
    required String desc,
    required int priority,
    required String deadline,
    int filter = 0,
  }) async{
    bool check = await dbHelper.addTodo(
      title: title,
      desc: desc,
      deadline: deadline,
      priority: priority,
    );
    if(check){
      _allTodo=await dbHelper.fetchAllTodo(filter);
      notifyListeners();
    }
  }
  fetchInitialTodo ({int filter=0})async{
    _allTodo=await dbHelper.fetchAllTodo(filter);
    notifyListeners();
  }

  isComleted({bool isCompleted=false,
    required int id , int filter=0})async{
    bool check =await dbHelper.updateTodoCompleted(id:id,isCompleted:isCompleted);

    if(check){
      _allTodo=await dbHelper.fetchAllTodo(filter);
      notifyListeners();
    }}

}
