import 'package:flutter/material.dart';
import 'package:todoapp/datbase/database_helper.dart';

class AllTask extends StatefulWidget {
  const AllTask({super.key});

  @override
  State<AllTask> createState() => _AllTaskState();
}
class _AllTaskState extends State<AllTask> {
  DBHelper? dbHelper;
  List<Map<String,dynamic>> allTodo=[];
  @override
  void initState() {
    super.initState();
    dbHelper=DBHelper.getInstance();
    getAllTodo();
  }
  void getAllTodo()async{
    allTodo=await dbHelper!.fetchTodo();
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 150,
          child:allTodo.isNotEmpty? ListView.builder(
            itemCount: allTodo.length,
            itemBuilder: (context, index) {
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
      ),
    );
  }
}
