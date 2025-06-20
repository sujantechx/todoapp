import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/tasks/pending.dart';

import 'all_task.dart';
import 'complete.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> with SingleTickerProviderStateMixin {
  TabController? mController;
  @override
  void initState() {
    super.initState();
     mController=TabController(length: 3, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("All task"),
        bottom: TabBar(
            controller: mController,
            indicatorColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                text: "All Task",
              ),
              Tab(
                text: "Pending",
              ),
              Tab(
                text: "Complete",
              )
        ]),
      ),

      body: TabBarView(
          controller: mController,
          children: [
            AllTask(),
            Pending(),
            Complete()

      ]),
    );
  }
}
