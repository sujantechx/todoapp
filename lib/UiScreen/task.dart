/// using provider in global state mangement


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../DataBase/database_sqlite.dart';
import '../StateManged/provider.dart';
import 'add.dart';
class Task extends StatefulWidget {
  @override
  State<Task> createState() => _Task();
}
class _Task extends State<Task> {
  DBHelper ? dbHelper;
  int ? selectedIndex;
  List<Map<String, dynamic>> mTodo = [];
  int filter = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<DbProvider>(context, listen: false).fetchInitialTodo();
    context.read<DbProvider>().fetchInitialTodo();
    // getAllTodo();
  }
  // void getAllTodo()async{
  //   mTodo=await dbHelper!.fetchTodo();
  //   setState(() {
  //
  //   });
  // }


  @override
  Widget build(BuildContext context) {

    mTodo = Provider.of<DbProvider>(context).getData();
    ///mTodo = context.watch<DbProvider>().getData();

    return Scaffold(
      appBar: AppBar(title: Text('Provider State Manged')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: (){
                  filter=2;
                  Provider.of<DbProvider>(context, listen: false).fetchInitialTodo(filter: filter);
                  // context.read<DbProvider>().featchAllTodo(filter: filter);
                }, child: Text('Pending'))),
                SizedBox(
                  width: 11,
                ),
                Expanded(child: ElevatedButton(onPressed: (){
                  filter=1;
                  Provider.of<DbProvider>(context, listen: false).fetchInitialTodo(filter: filter);
                  // context.read<DbProvider>().featchAllTodo(filter: filter);
                }, child: Text('Completed'))),
                SizedBox(
                  width: 11,
                ),
                Expanded(child: ElevatedButton(onPressed: (){
                  filter=0;
                  Provider.of<DbProvider>(context, listen: false).fetchInitialTodo();
                  // context.read<DbProvider>().featchAllTodo(filter: filter);
                }, child: Text('All'))),
              ],
            ),

            Expanded(
              child: Consumer<DbProvider>(
                  builder: (ctx, provider, __){
                    ///mTodo = ctx.watch<DbProvider>().getData();
                    mTodo = provider.getData();
                    return mTodo.isNotEmpty
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
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            child: CheckboxListTile(
                                tileColor: bgColor,
                                title: Text(mTodo[index][DBHelper.c_todoTitle], style: TextStyle(
                                    decoration: mTodo[index][DBHelper.c_todoComplete]==1? TextDecoration.lineThrough : TextDecoration.none
                                ),),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(mTodo[index][DBHelper.c_todoDesc], style: TextStyle(
                                        decoration: mTodo[index][DBHelper.c_todoComplete]==1? TextDecoration.lineThrough : TextDecoration.none
                                    ),),
                                    SizedBox(height: 10,),
                                    if(selectedIndex==index)
                                      Row(
                                        children: [
                                          IconButton(onPressed: ()async{
                                            final result=await Navigator.push(context,
                                                MaterialPageRoute(builder:  (context) => AddTask(task:mTodo[index],),));
                                            // if(result==true){
                                            //   getAllTodo()
                                            // }
                                          },
                                              icon: Icon(Icons.edit,color: Colors.blue,)),
                                          SizedBox(width: 10,),
                                          IconButton(onPressed: (){

                                          },
                                              icon: Icon(Icons.delete,color: Colors.red,))
                                        ],
                                      ),
                                    Text(mTodo[index][DBHelper.c_todoTaskDeadline], style: TextStyle(
                                        decoration: mTodo[index][DBHelper.c_todoComplete]==1? TextDecoration.lineThrough : TextDecoration.none
                                    ),),

                                  ],
                                ),
                                value: mTodo[index][DBHelper.c_todoComplete]==1, onChanged: (value) async{
                              Provider.of<DbProvider>(context, listen: false).isComleted(id: mTodo[index]["t_id"], isCompleted: value!, filter: filter);
                              // context.read<DbProvider>().isCompleted(id: mTodo[index]["t_id"], isCompleted: value!, filter: filter);
                            }),
                          );
                        })
                        : Center(child: Text('No Todo'));}),
            )
          ],
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
