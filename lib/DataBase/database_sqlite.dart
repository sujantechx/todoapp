import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{
  DBHelper._();

  static DBHelper getInstance(){
    return DBHelper._();
  }

  /// variable globaly accses
  Database? db;
  static final tableTodoName="todo";
  static final c_todoId='todo_id';
  static final c_todoTitle="todo_title";
  static final c_todoDesc="todo_Desc";
  static final c_todoTaskDeadline="todo_time";
  static final c_todoComplete= "todo_complete";
  static final c_todoPriority = "todo_priority";


  Future<Database> initDB ()async{
    if(db==null){
      db=await openDB();
      return db!;
    }
    else{
      return db!;
    }
  }

  Future<Database> openDB () async{
    Directory mDr=await getApplicationDocumentsDirectory();
    ///path requred
    String mPath=join(mDr.path,"todo.db");
    /// version work data structure change scema
    return await openDatabase(mPath,version: 1,onCreate: (db,version) {
      db.execute(
          '''
         create table $tableTodoName(
         $c_todoId integer primary key autoincrement,
          $c_todoTitle text,
          $c_todoDesc text, 
          $c_todoTaskDeadline text ,
          $c_todoComplete integer default 0,
          $c_todoPriority integer )
        '''
      );
    });
  }

  /// qure add
  Future<bool> addTodo(
      {required String title ,
        required String desc,
        required String deadline,
        int priority=1
      })async{
    var db=await initDB(); /// her to call chck condition then add
    int rewsEffected=await db.insert(tableTodoName, {
      c_todoTitle:title,
      c_todoDesc:desc,
      c_todoTaskDeadline:deadline,
      c_todoComplete:0,
      c_todoPriority:priority
    });
    return rewsEffected >0;
  }

  ///fetch data
  Future<List<Map<String,dynamic>>> fetchTodo()async {
    var db = await initDB();
    List<Map<String, dynamic>> allData = await db.query(tableTodoName);
    return allData;
  }
  Future<List<Map<String, dynamic>>> fetchAllTodo(int filter) async {
    var db = await initDB();
    List<Map<String, dynamic>> allTodo = [];

    if (filter > 0) {
      allTodo = await db.query(
        tableTodoName,
        where: "$c_todoComplete = ?",
        whereArgs: [filter == 1 ? 1 : 0],
      );
    } else {
      allTodo = await db.query(
        tableTodoName,
        orderBy: "$c_todoTaskDeadline DESC", // ✅ correct use of variable
      );
    }
    return allTodo;
  }



  Future<List<Map<String,dynamic>>> fetchTodoPending()async{
    var db= await initDB();
    List<Map<String,dynamic>> allData=await db.query(
        tableTodoName,where: '$c_todoComplete=?',whereArgs: [0]);
    return allData;
  }

  Future<List<Map<String,dynamic>>> fetchTodoComplete()async{
    var db= await initDB();
    List<Map<String,dynamic>> allData=await db.query(
        tableTodoName,where: '$c_todoComplete=?',whereArgs: [1]);
    return allData;
  }

  Future<bool> updateTodoCompleted({
    required int id,
    required bool isCompleted
  })async{
    var db=await initDB();

    int rowEffected=await db.update(
        tableTodoName, {
      c_todoComplete:isCompleted?1 :0
    },
        where:"$c_todoId=?",whereArgs:[id]);
    return rowEffected>0;
  }

  ///delete todo list
  Future<int>deleteTodo(int id)async{
    final db=await initDB();
    return await db.delete(
        tableTodoName,
        where: "$c_todoId=?",
        whereArgs: [id]
    );
  }
  /// update
  Future<int> updateTodo({
    required int id,
    required String title,
    required String desc,
    required String deadline,
    required int priority
  })async{
    final db=await initDB();
    return await db.update(tableTodoName, {
      c_todoTitle:title,
      c_todoDesc:desc,
      c_todoTaskDeadline:deadline,
      c_todoPriority: priority
    },
      where: "$c_todoId=? ",whereArgs: [id],
    );

  }
}