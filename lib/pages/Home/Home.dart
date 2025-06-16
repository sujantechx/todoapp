import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/pages/add/add_task.dart';
import 'package:todoapp/datbase/database_helper.dart';
import 'package:todoapp/provider/provider.dart';
class HomePage1 extends StatefulWidget {
  @override
  State<HomePage1> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage1> {

  List<Map<String, dynamic>> mTodo = [];
  int filter = 0;

  @override
  void initState() {
    super.initState();
    ///Provider.of<DbProvider>(context, listen: false).fetchInitialTodos();
    // context.read<DbProvider>().featchAllTodo(filter);
  }


  @override
  Widget build(BuildContext context) {

    ///mTodo = Provider.of<DbProvider>(context).getData();
    ///mTodo = context.watch<DbProvider>().getData();

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: ElevatedButton(onPressed: (){
                    filter=2;
                    ///Provider.of<DbProvider>(context, listen: false).fetchInitialTodos(filter: filter);
                    // context.read<DbProvider>().featchAllTodo(filter: filter);
                  }, child: Text('Pending'))),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(child: ElevatedButton(onPressed: (){
                    filter=1;
                    ///Provider.of<DbProvider>(context, listen: false).fetchInitialTodos(filter: filter);
                    // context.read<DbProvider>().featchAllTodo(filter: filter);
                  }, child: Text('Completed'))),
                  SizedBox(
                    width: 11,
                  ),
                  Expanded(child: ElevatedButton(onPressed: (){
                    filter=0;
                    ///Provider.of<DbProvider>(context, listen: false).fetchInitialTodos();
                    // context.read<DbProvider>().featchAllTodo(filter: filter);
                  }, child: Text('All'))),
                ],
              ),

              // Consumer<DbProvider>(
              //   builder: (ctx, provider, __){
                  ///mTodo = ctx.watch<DbProvider>().getData();
                  // mTodo = provider.getData();
                   SizedBox(
                    child: mTodo.isNotEmpty
                        ? ListView.builder(
                        itemCount: mTodo.length,
                        itemBuilder: (_, index){
                          Color bgColor = Colors.grey.shade200;

                          if(mTodo[index][DBHelper.c_todoPriority]==1){
                            bgColor = Colors.grey.shade200;
                          } else if(mTodo[index][DBHelper.c_todoPriority]==2){
                            bgColor = Colors.yellow.shade200;
                          } else if(mTodo[index][DBHelper.c_todoPriority]==3){
                            bgColor = Colors.red.shade200;
                          }

                          return InkWell(
                            onLongPress: (){
                              showModalBottomSheet(context: context, builder: (_){
                                return Container(
                                  height: 200,
                                  color: Colors.white,
                                );
                              });
                            },
                            child: CheckboxListTile(
                                tileColor: bgColor,
                                title: Text(mTodo[index]["t_title"], style: TextStyle(
                                    decoration: mTodo[index]["t_isCompleted"]==1? TextDecoration.lineThrough : TextDecoration.none
                                ),),
                                subtitle: Text(mTodo[index]["t_desc"], style: TextStyle(
                                    decoration: mTodo[index]["t_isCompleted"]==1? TextDecoration.lineThrough : TextDecoration.none
                                ),),
                                value: mTodo[index]["t_isCompleted"]==1, onChanged: (value) async{
                              ///Provider.of<DbProvider>(context, listen: false).isCompleted(id: mTodo[index]["t_id"], isCompleted: value!, filter: filter);
                              context.read<DbProvider>().isCompleted(id: mTodo[index]["t_id"], isCompleted: value!, filter: filter);
                            }),
                          );
                        })
                        : Center(child: Text('No Todo')),
                  )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class DbProvider {
  void isCompleted({required id, required bool isCompleted, required int filter}) {}

  void featchAllTodo({required int filter}) {}
}