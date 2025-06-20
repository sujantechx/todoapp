import 'package:flutter/material.dart';
import '../DataBase/database_sqlite.dart';
import '../UiScreen/add.dart';

class AllTask extends StatefulWidget {
  const AllTask({super.key});

  @override
  State<AllTask> createState() => _AllTaskState();
}
class _AllTaskState extends State<AllTask> {
  DBHelper? dbHelper;
  int? selectedIndex;/// her track  longpres index veriavel store
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
        child: allTodo.isNotEmpty? ListView.builder(
          itemCount: allTodo.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: InkWell(
              onLongPress: (){
                setState(() {
                  selectedIndex=index; /// her track  longpres index
                });
              },
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

                        /// longpres to work

                        if (selectedIndex == index) // Show buttons only if long-pressed
                          Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: ()async{
                                    final result= await Navigator.push(
                                        context, MaterialPageRoute(
                                      builder: (context) => AddTask(task: allTodo[index],),));

                                    if(result==true){
                                      getAllTodo(); ///refresh list if task was update
                                    }
                                  }
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: ()async{
                                   await dbHelper!.deleteTodo(allTodo[index][DBHelper.c_todoId]);
                                   getAllTodo();
                                  }
                                ),]
                          ),

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
            ),
          );

        },):Center(
          child: Text("No ToDo List!!"),
        ),
      ),
    );
  }
}
