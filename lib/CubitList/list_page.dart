
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_list.dart';
import 'list_state.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}
class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("List"),),
    body: BlocBuilder<ListCubit,ListState>(
        builder: (_,state){
          return state.mList.isNotEmpty?
          ListView.builder(
              itemCount: state.mList.length,
              itemBuilder: (_,index){
            return ListTile(
                title: Text(state.mList[index]['title']),
                subtitle: Text(state.mList[index]['desc']),
                trailing: SizedBox(
                width: 110,
                child: Row(
                children: [
                IconButton(
                onPressed: () {
                context.read<ListCubit>().updateMap({
                "title": "Cubit Topic Updated*",
                "desc": "Cubit with List of Map Updated*",
                }, index);
                },
                icon: Icon(Icons.edit),
                ),
                IconButton(
                onPressed: () {
                context.read<ListCubit>().deleteMap(index);
                },
                icon: Icon(Icons.delete, color: Colors.red),
                ),
                ],
                ),)
            );
          }):Text('no List!!');
        }
        ),floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(),));
      },
      child: Text('Add'),    ),
    );
  }
}
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Center(child: Text('Next Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListCubit>().addMap({
            "title" : "Cubit Topic",
            "desc" : "Cubit with List of Map"
          });
          Navigator.pop(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}