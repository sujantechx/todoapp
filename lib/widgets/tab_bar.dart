
import 'package:flutter/material.dart';
import '../CubitList/list_page.dart';
import '../Profile/profile.dart';
import '../UiScreen/add.dart';
import '../UiScreen/home.dart';
import '../UiScreen/task.dart';
import '../UiScreen/task2.dart';

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
    Task(),
    // Task2(),
    Profile(),
    // ListPage(),
  ];
  final List<String> _title=[
    "Home",
    'Add Task',
    'Task',
    "Home1",

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
              // BottomNavigationBarItem(icon: Icon(Icons.check), label: "Task2"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
              // BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );

  }
}
