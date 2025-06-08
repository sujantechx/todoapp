import 'package:flutter/material.dart';
import 'package:todoapp/loginPage/login_page.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"ToDo Now" ,
      // color:Colors.blue ,
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
