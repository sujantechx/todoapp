import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/widgets/tab_bar.dart';
import 'CubitList/cubit_list.dart';
import 'DataBase/database_sqlite.dart';
import 'StateManged/cubit/cubit.dart';
import 'StateManged/provider.dart';

void main() {
  runApp(
      MultiProvider(
          providers:[
            ChangeNotifierProvider(
              create: (context)=>DbProvider(
                  dbHelper: DBHelper.getInstance(),
              )),
            BlocProvider(create: (context)=>ListCubit()),
            BlocProvider(create: (context)=>TodoCubit(dbHelper: DBHelper.getInstance()))
          ] , child: MyApp()
      ),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "todo GSM",
      home: BottomTabBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}