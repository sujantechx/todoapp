import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/datbase/database_helper.dart';
import 'package:todoapp/loginPage/login_page.dart';
import 'package:todoapp/provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider<DbProvider>(
      create: (context) => DbProvider(
        dbHelper: DBHelper.getInstance(),
      ),
      child: MyApp(),
    ),
  );
}
/*
void main() {
  runApp(
    /// multiple provider r
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DbProvider>(
          create: (context) => DbProvider(
            dbHelper: DBHelper.getInstance(),
          ),
          child: MyApp(),
        ),
      ],
    ));
      /*
        ChangeNotifierProvider<DbProvider>(
          create: (context) => DbProvider(
            dbHelper: DBHelper.getInstance(),
          ),
          child: MyApp(),
        ),
     );*/
}
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo Now",
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
