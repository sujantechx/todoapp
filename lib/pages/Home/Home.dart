// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   final taskStatuses = [
//     {'title': 'On going', 'count': '24 Tasks', 'color': Colors.blue, 'icon': Icons.sync},
//     {'title': 'In Process', 'count': '12 Tasks', 'color': Colors.amber, 'icon': Icons.timelapse},
//     {'title': 'Completed', 'count': '42 Tasks', 'color': Colors.teal, 'icon': Icons.check_circle},
//     {'title': 'Canceled', 'count': '8 Tasks', 'color': Colors.red, 'icon': Icons.cancel},
//   ];
//
//   final recentTasks = [
//     {'title': 'Website for Rune.io', 'progress': 0.4, 'color': Colors.red},
//     {'title': 'Dashboard for ProSavvy', 'progress': 0.75, 'color': Colors.teal},
//     {'title': 'Mobile Apps for Track.id', 'progress': 0.5, 'color': Colors.orange},
//     {'title': 'Website for CourierGo.com', 'progress': 0.4, 'color': Colors.blue},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: ListView(
//             children: [
//               // Top Greeting Section
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 25,
//                     backgroundImage: AssetImage("assets/images/profile.png"), // replace with your avatar asset
//                   ),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text('Hi, Sujan👋',
//                             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                         Text('Your daily adventure starts now',
//                             style: TextStyle(color: Colors.grey)),
//                       ],
//                     ),
//                   ),
//                   Icon(Icons.dashboard_customize_rounded)
//                 ],
//               ),
//               const SizedBox(height: 20),
//
//               // Task Status Grid
//               GridView.builder(
//                 shrinkWrap: true,
//                 itemCount: taskStatuses.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 2.5),
//                 itemBuilder: (context, index) {
//                   var item = taskStatuses[index];
//                   return Container(
//                     decoration: BoxDecoration(
//                       color: item['color'] as Color,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     child: Row(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: item['color'] as Color,
//                           child: Icon(item['icon'] as IconData, color: Colors.white),
//                         ),
//                         SizedBox(width: 12),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(item['title'] as String,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: item['color'] as Color)),
//                             Text(item['count'] as String, style: TextStyle(color: Colors.black87)),
//                           ],
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//
//               const SizedBox(height: 24),
//               const Text("Recent Task",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//               const SizedBox(height: 12),
//
//               // Task List
//               ...recentTasks.map((task) {
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 12),
//                   padding: EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey.shade300),
//                       borderRadius: BorderRadius.circular(12),
//                       color: Colors.white),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(task['title']! as String,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 16)),
//                             SizedBox(height: 4),
//                             Text("Digital Product Design",
//                                 style: TextStyle(color: Colors.grey)),
//                             SizedBox(height: 4),
//                             Row(
//                               children: const [
//                                 Icon(Icons.task_alt_outlined,
//                                     color: Colors.grey, size: 16),
//                                 SizedBox(width: 4),
//                                 Text("12 Tasks",
//                                     style: TextStyle(color: Colors.grey)),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       CircularPercentIndicator(
//                         radius: 30.0,
//                         lineWidth: 6.0,
//                         percent: task['progress'] as double,
//                         center: Text("${(task['progress'] as double) * 100}.toInt()}%"),
//                         progressColor: task['color'] as Color,
//                         backgroundColor: Colors.grey.shade200,
//                         circularStrokeCap: CircularStrokeCap.round,
//                       )
//                     ],
//                   ),
//                 );
//               }).toList()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
