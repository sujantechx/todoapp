import 'package:flutter/material.dart';

import '../../datbase/database_helper.dart';
import '../DataBase/database_sqlite.dart';

class Pending extends StatefulWidget {
  const Pending({super.key});

  @override
  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  DBHelper? dbHelper;
  List<Map<String,dynamic>> allTodo=[];
  @override
  void initState() {
    super.initState();
    dbHelper=DBHelper.getInstance();
    getAllTodo();
  }
  void getAllTodo()async{
    allTodo=await dbHelper!.fetchTodoPending();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: allTodo.isNotEmpty? ListView.builder(
          itemCount: allTodo.length,
          itemBuilder: (context, index) {
            /// color creaqte
            Color bgColor=Colors.green;
            if(allTodo[index][DBHelper.c_todoPriority]==3){
              bgColor=Colors.grey.shade300;
            } else if(allTodo[index][DBHelper.c_todoPriority]==2){
              bgColor=Colors.yellow.shade300;
            } else if(allTodo[index][DBHelper.c_todoPriority]==1){
              bgColor=Colors.red.shade300;
            } else{
              bgColor=Colors.blue.shade300;
            }
            return InkWell(
              child: CheckboxListTile(
                fillColor: WidgetStatePropertyAll(bgColor),
                  // tileColor: bgColor,
                  title: Text(allTodo[index][DBHelper.c_todoTitle],style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                     decoration: allTodo[index][DBHelper.c_todoComplete]==1? TextDecoration.lineThrough:TextDecoration.none

                 ),),

                 subtitle:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     SizedBox(height: 5),

                     Text(allTodo[index][DBHelper.c_todoDesc],style: TextStyle(
                        fontSize: 12,
                       /// extra add line text uper
                       decoration: allTodo[index][DBHelper.c_todoComplete]==1? TextDecoration.lineThrough:TextDecoration.none
                      ),),
                     SizedBox(height: 14),

                     Text(allTodo[index][DBHelper.c_todoTaskDeadline],style: TextStyle(
                       fontSize: 12,
                     ),),
                   ],
                 ),


                  value: allTodo[index][DBHelper.c_todoComplete]==1,
                  onChanged: (value)async{
                bool check=await dbHelper!.updateTodoCompleted(id: allTodo[index][DBHelper.c_todoId],
                    isCompleted: value!);
                if(check){
                  getAllTodo();
                }
                  }),
            );

            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(allTodo[index][DBHelper.c_todoTitle],style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),),

                        Text(allTodo[index][DBHelper.c_todoDesc],style: TextStyle(
                          fontSize: 12,
                        ),),
                        SizedBox(height: 10,),

                        Text(allTodo[index][DBHelper.c_todoTaskDeadline],style: TextStyle(
                          fontSize: 12,
                        ),),


                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.edit),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            Text("Mark as complete  ",style: TextStyle(
                              fontSize: 12,
                            ),),
                            Icon(Icons.check_box_outline_blank)
                          ],
                        ),


                      ],
                    )

                  ],
                ),
              ),
            );



          },):Center(
          child: Text("No ToDo List!!"),
        ),
      ),
    );
  }
}
