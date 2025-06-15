// import 'package:flutter/material.dart';
//
// class DbProvider extends ChangeNotifier{
//   DbProvider dbHelper;
//   DbProvider({required this.dbHelper});
//
//   List<Map<String ,dynamic>> _allTodo=[];
//   List<Map<String,dynamic>> getData=[];
//
//
//   /// event
//   addTodo({required String title, required String desc, required int priority, int filter = 0}) async{
//
//     bool check= await dbHelper.addTodo(title: title, desc: desc, priority: priority);
//     if(check){
//       _allTodo=await dbHelper.featchAllTodo(filter );
//       notifyListeners();
//     }
//   }
//
//   featchAllTodo(int filter, {required int filter}) {}}