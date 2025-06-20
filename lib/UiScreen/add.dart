
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../DataBase/database_sqlite.dart';

class AddTask extends StatefulWidget {
  final Map<String,dynamic>? task; /// if null then add , else Edit
  const AddTask({ Key? key, this.task}): super(key:key);
  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  var _titleController=TextEditingController();
  var _taskDescController=TextEditingController();
  var _deadelineController=TextEditingController();
  int priority=1;

  DateTime? selectedDate;
  ///date time as calender function
  void _showDateTimePicker(){
    showModalBottomSheet(
        context: context,
        // isScrollControlled: true,// full height

        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12))
        ),
        builder: (BuildContext context){
          DateTime tempDte=selectedDate??DateTime.now();
          TimeOfDay tempTime=TimeOfDay.now();

          return StatefulBuilder(

              builder: (context,setModaleState){
                return Column(
                  children: [
                    ///calender
                    CalendarDatePicker(
                        initialDate: tempDte,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2035),
                        onDateChanged: (newDate){
                          setModaleState((){
                            tempDte=newDate;
                          });
                        }),

                    /// Time picker
                    ElevatedButton.icon(
                      icon: Icon(Icons.access_time),
                      label: Text("pick time"),
                      onPressed: ()async{
                        final pickedTime=await showTimePicker(
                            context: context,
                            initialTime: tempTime);
                        if(pickedTime!=null){
                          setModaleState((){
                            tempTime=pickedTime;
                          });
                        }
                      },
                    ),
                    SizedBox(
                        height: 10),
                    ElevatedButton(
                      child: Text("Conform"),
                      onPressed: (){
                        final DateTime finalDateTime=DateTime(
                            tempDte.year,
                            tempDte.month,
                            tempDte.day,
                            tempTime.hour,
                            tempTime.minute
                        );
                        final formatted=DateFormat(
                            'yyyy-MM-dd-kk:mm'
                        ).format(finalDateTime);
                        _deadelineController.text=formatted;
                        selectedDate=finalDateTime;
                        Navigator.pop(context);
                      },
                    )

                  ],
                );
              });
        }

    );
  }
  /// data base to call date fetch and  red write work
  DBHelper?dbHelper;
  List<Map<String,dynamic>> allTodo=[];
  @override
  void initState() {
    super.initState();
    dbHelper=DBHelper.getInstance();
    getAllTodo();

    if(widget.task!=null){
      _titleController.text=widget.task![DBHelper.c_todoTitle];
      _taskDescController.text=widget.task![DBHelper.c_todoDesc];
      _deadelineController.text=widget.task![DBHelper.c_todoTaskDeadline];
      priority=widget.task![DBHelper.c_todoPriority];
    }
  }
  ///data fetch create function
  void getAllTodo()async{
    allTodo=await dbHelper!.fetchTodo();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,size: 35,),),
        title: Text("Add TAsk"),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text("Task title"),
              Container(
                height: 50,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: " eg Buy a bike",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Task Description"),
              Container(
                height: 150,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                ),
                child: TextField(
                  controller: _taskDescController,
                  maxLines: 3,
                  minLines: 3,
                  decoration: InputDecoration(
                      hintText: " eg Buy a bike",
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text("Task Deadline"),
              InkWell(
                onTap:_showDateTimePicker,

                child: Container(
                  height: 50,
                  decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white
                  ),
                  child: TextField(
                    controller: _deadelineController,
                    enabled: false,///input
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.arrow_drop_down_outlined,size: 35,),
                        hintText: " select date and time",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Set as priority",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),

                  RadioMenuButton(value: 1, groupValue: priority, onChanged: (value){
                    priority= value!;
                    setState(() {

                    });
                  }, child: Text("Low")),
                  RadioMenuButton(value: 2, groupValue: priority, onChanged: (value){
                    priority= value!;
                    setState(() {

                    });
                  }, child: Text("Mid")),
                  RadioMenuButton(value: 3, groupValue: priority, onChanged: (value){
                    priority= value!;
                    setState(() {
                    });
                  }, child: Text("High")),
                ],
              ),

              SizedBox(height: 210,),
              Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: ()async{
                  if(widget.task==null){
                    ///add new task
                    await dbHelper!.addTodo(
                        title: _titleController.text,
                        desc:_taskDescController.text,
                        deadline: _deadelineController.text,
                        priority:priority
                    );
                  }else{
                    ///update todo
                    await dbHelper!.updateTodo(
                      id: widget.task![DBHelper.c_todoId],
                      title: _titleController.text,
                      desc: _taskDescController.text,
                      deadline: _deadelineController.text,
                      priority:priority,
                    );
                  }
                  /* bool check=await dbHelper!.addTodo(
                      title: _titleController.text,
                      desc:_taskDescController.text,
                      deadline: _deadelineController.text,
                      priority:priority
                  );
                  if(check){
                    getAllTodo();
                  }*/
                  print("sucses fully add");
                  print("$priority");
                  Navigator.pop(context,true);/// return succes to refresh list
                },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Color(0xffecbc16),
                        foregroundColor: Colors.white
                    ),
                    child: Text("Add Task")),
              )
            ],
          ),
        ),
      ),
    );
  }
}


