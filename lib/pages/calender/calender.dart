
import 'package:flutter/material.dart';
class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


// import 'package:flutter/material.dart';
//
// class Calender extends StatefulWidget {
//   const Calender({super.key});
//
//   @override
//   State<Calender> createState() => _CalenderState();
// }
// class _CalenderState extends State<Calender> {
//   final List<Map<String, dynamic>> tasks = [
//     {
//       "time": "09.00 am - 10.15 am",
//       "title": "Optimize server response time.",
//       "members": [],
//       "tag": null
//     },
//     {
//       "time": "10.45 am - 11.45 am",
//       "title": "Team Meeting (Designer and Developer)",
//       "members": ["A", "B", "C"],
//       "tag": "Optimization Website for Rune.io"
//     },
//     {
//       "time": "03.00 pm - 04.15 pm",
//       "title": "Optimize Homepage Design",
//       "members": [],
//       "tag": null
//     }
//   ];
//
//   final List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
//   final List<String> dates = ["14", "15", "16", "17", "18", "19", "20"];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: ListView(
//             children: [
//               const SizedBox(height: 16),
//               // Header
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Icon(Icons.arrow_back_ios_new_rounded),
//                   Text(""),
//                   Icon(Icons.more_vert),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 "Wednesday, 17 January 2024",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//
//               // Horizontal Date Picker
//               SizedBox(
//                 height: 70,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: weekdays.length,
//                   itemBuilder: (context, index) {
//                     final isSelected = index == 3;
//                     return Container(
//                       width: 60,
//                       margin: const EdgeInsets.only(right: 10),
//                       decoration: BoxDecoration(
//                         color: isSelected ? Colors.orange : Colors.transparent,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       padding: const EdgeInsets.all(10),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(weekdays[index],
//                               style: TextStyle(
//                                   color: isSelected ? Colors.white : Colors.grey)),
//                           const SizedBox(height: 4),
//                           Text(dates[index],
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: isSelected ? Colors.white : Colors.black)),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               const SizedBox(height: 24),
//
//               // Task Timeline
//               ...List.generate(tasks.length + 1, (index) {
//                 if (index == 2) {
//                   // Add new subtask button
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     child: Container(
//                       height: 80,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Colors.grey.shade400),
//                         color: Colors.white,
//                       ),
//                       child: Row(
//                         children: const [
//                           Expanded(
//                             child: Padding(
//                               padding: EdgeInsets.only(left: 16.0),
//                               child: Text("Add new subtask",
//                                   style: TextStyle(color: Colors.grey, fontSize: 16)),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(right: 16.0),
//                             child: CircleAvatar(
//                               backgroundColor: Colors.black,
//                               child: Icon(Icons.add, color: Colors.white),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//
//                 final task = tasks[index >= 2 ? index - 1 : index];
//                 return Padding(
//                   padding: const EdgeInsets.only(bottom: 16),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(12),
//                       border: Border.all(color: Colors.grey.shade300),
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(task["title"],
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                         const SizedBox(height: 8),
//                         Text(task["time"], style: TextStyle(color: Colors.grey.shade600)),
//                         const SizedBox(height: 8),
//                         if (task["tag"] != null)
//                           Container(
//                             padding:
//                             const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.grey.shade200,
//                             ),
//                             child: Text(task["tag"],
//                                 style: const TextStyle(color: Colors.black)),
//                           ),
//                         if (task["members"].isNotEmpty) const SizedBox(height: 8),
//                         if (task["members"].isNotEmpty)
//                           Row(
//                             children: [
//                               ...task["members"].map<Widget>((name) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(right: 4.0),
//                                   child: CircleAvatar(
//                                     radius: 14,
//                                     backgroundColor: Colors.orange,
//                                     child: Text(
//                                       name,
//                                       style: const TextStyle(
//                                           color: Colors.white, fontSize: 12),
//                                     ),
//                                   ),
//                                 );
//                               }).toList(),
//                               const Spacer(),
//                               const Icon(Icons.arrow_forward_ios, size: 16)
//                             ],
//                           )
//                       ],
//                     ),
//                   ),
//                 );
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
