
import 'package:flutter/material.dart';
import 'package:todoapp/pages/Home/home_page.dart';
import 'package:todoapp/pages/add/add_task.dart';
import 'package:todoapp/pages/tasks/tasks_TabBar.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int currentIndex=0;
  final List<Widget> _pages=[
    HomePage(),
    AddTask(),
    Tasks()
    // Profile()
  ];
  final List<String> _title=[
    "Home",
    'Add Task',
    'Task'
    // "Profile"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(2.0), // Outer padding
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Colors.white, // Custom background color
            selectedItemColor:  Colors.blue,
            unselectedItemColor: Colors.black,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              // BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calender"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
              BottomNavigationBarItem(icon: Icon(Icons.check), label: "Task"),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );

  }
}
