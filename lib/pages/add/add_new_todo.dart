import 'package:flutter/material.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({super.key});

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
   @override
   Widget build(BuildContext context) {
     final List<String> tasks = [
       "Task Customization",
       "Deadline Management",
       "Networking Assistance",
       "Data Security Assurance",
       "Continuous Feedback Loop"
     ];

     final List<String> tasks2 = [
       "Application Tracking",
       "Automated Job Alerts",
       "Mobile Optimization",
     ];

     return Scaffold(
       backgroundColor: Colors.grey.shade100,
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               // Top bar
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: const [
                   Icon(Icons.arrow_back_ios_new_rounded),
                   Row(
                     children: [
                       Icon(Icons.notifications_none_outlined),
                       SizedBox(width: 10),
                       Icon(Icons.more_vert),
                     ],
                   ),
                 ],
               ),
               const SizedBox(height: 20),
               const Text(
                 "Website for Rune.io",
                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
               ),

               const SizedBox(height: 10),

               // Team Members + Deadline
               Row(
                 children: [
                   // Team Avatars
                   SizedBox(
                     width: 100,
                     child: Stack(
                       children: [
                         Positioned(
                           left: 0,
                           child: CircleAvatar(
                             backgroundImage: NetworkImage("https://i.ibb.co/SJKm7Lm/avatar-boy.png"),
                             radius: 16,
                           ),
                         ),
                         Positioned(
                           left: 22,
                           child: CircleAvatar(
                             backgroundImage: NetworkImage("https://i.ibb.co/yPSYYcd/avatar-girl.png"),
                             radius: 16,
                           ),
                         ),
                         Positioned(
                           left: 44,
                           child: CircleAvatar(
                             backgroundImage: NetworkImage("https://i.ibb.co/y4ZK5ZX/avatar2.png"),
                             radius: 16,
                           ),
                         ),
                         const Positioned(
                           left: 66,
                           child: CircleAvatar(
                             backgroundColor: Colors.orange,
                             child: Icon(Icons.add, color: Colors.white, size: 16),
                             radius: 16,
                           ),
                         ),
                       ],
                     ),
                   ),
                   const Spacer(),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                     decoration: BoxDecoration(
                       color: Colors.grey.shade200,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: const Row(
                       children: [
                         Icon(Icons.access_time_filled, size: 16),
                         SizedBox(width: 5),
                         Text.rich(TextSpan(
                           text: "Deadline: ",
                           children: [TextSpan(text: "February 6", style: TextStyle(fontWeight: FontWeight.bold))],
                         )),
                       ],
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 20),

               // Search and Navigation
               Row(
                 children: [
                   Expanded(
                     child: Container(
                       padding: const EdgeInsets.symmetric(horizontal: 12),
                       height: 48,
                       decoration: BoxDecoration(
                           color: Colors.white, borderRadius: BorderRadius.circular(16)),
                       child: const Row(
                         children: [
                           Icon(Icons.search),
                           SizedBox(width: 8),
                           Text("Search cards", style: TextStyle(color: Colors.grey)),
                         ],
                       ),
                     ),
                   ),
                   const SizedBox(width: 10),
                   Container(
                     height: 48,
                     width: 48,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(16)),
                     child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
                   ),
                   const SizedBox(width: 8),
                   Container(
                     height: 48,
                     width: 48,
                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(16)),
                     child: const Icon(Icons.arrow_forward_ios, size: 16),
                   ),
                 ],
               ),

               const SizedBox(height: 16),

               // Status Tags
               Row(
                 children: [
                   _statusTag("On going", Colors.blue),
                   const SizedBox(width: 10),
                   _statusTag("In Process", Colors.orange),
                 ],
               ),

               const SizedBox(height: 16),

               // Task Cards
               Expanded(
                 child: SingleChildScrollView(
                   child: Wrap(
                     spacing: 10,
                     runSpacing: 12,
                     children: [
                       ...tasks.map((e) => _taskCard(e, true)),
                       ...tasks2.map((e) => _taskCard(e, false)),
                       _addNewCard(),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     );
   }

   Widget _statusTag(String title, Color color) {
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
       decoration: BoxDecoration(
           color: color.withOpacity(0.2),
           borderRadius: BorderRadius.circular(12)),
       child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
     );
   }

   Widget _taskCard(String title, bool blueDot) {
     return Container(
       width: 160,
       padding: const EdgeInsets.all(12),
       decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(12),
           boxShadow: const [
             BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 4)
           ]),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Row(
             children: [
               Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
               const Spacer(),
               if (blueDot)
                 const Icon(Icons.circle, color: Colors.blue, size: 8),
             ],
           ),
           const SizedBox(height: 8),
           const Text("12 Comments", style: TextStyle(color: Colors.grey, fontSize: 12)),
         ],
       ),
     );
   }

   Widget _addNewCard() {
     return Container(
       width: 160,
       height: 70,
       decoration: BoxDecoration(
         // border: Border.all(color: Colors.grey.shade300, style: BorderStyle.dotted),
         borderRadius: BorderRadius.circular(12),
       ),
       child: const Center(
         child: Icon(Icons.add_circle, color: Colors.black54),
       ),
     );

   }
}
/*
class AddNewTodo extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tasks = [
      "Task Customization",
      "Deadline Management",
      "Networking Assistance",
      "Data Security Assurance",
      "Continuous Feedback Loop"
    ];

    final List<String> tasks2 = [
      "Application Tracking",
      "Automated Job Alerts",
      "Mobile Optimization",
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back_ios_new_rounded),
                  Row(
                    children: [
                      Icon(Icons.notifications_none_outlined),
                      SizedBox(width: 10),
                      Icon(Icons.more_vert),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Website for Rune.io",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // Team Members + Deadline
              Row(
                children: [
                  // Team Avatars
                  SizedBox(
                    width: 100,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i.ibb.co/SJKm7Lm/avatar-boy.png"),
                            radius: 16,
                          ),
                        ),
                        Positioned(
                          left: 22,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i.ibb.co/yPSYYcd/avatar-girl.png"),
                            radius: 16,
                          ),
                        ),
                        Positioned(
                          left: 44,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i.ibb.co/y4ZK5ZX/avatar2.png"),
                            radius: 16,
                          ),
                        ),
                        const Positioned(
                          left: 66,
                          child: CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Icon(Icons.add, color: Colors.white, size: 16),
                            radius: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.access_time_filled, size: 16),
                        SizedBox(width: 5),
                        Text.rich(TextSpan(
                          text: "Deadline: ",
                          children: [TextSpan(text: "February 6", style: TextStyle(fontWeight: FontWeight.bold))],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Search and Navigation
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 48,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 8),
                          Text("Search cards", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                    child: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Status Tags
              Row(
                children: [
                  _statusTag("On going", Colors.blue),
                  const SizedBox(width: 10),
                  _statusTag("In Process", Colors.orange),
                ],
              ),

              const SizedBox(height: 16),

              // Task Cards
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 12,
                    children: [
                      ...tasks.map((e) => _taskCard(e, true)),
                      ...tasks2.map((e) => _taskCard(e, false)),
                      _addNewCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statusTag(String title, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12)),
      child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }

  Widget _taskCard(String title, bool blueDot) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, offset: Offset(2, 2), blurRadius: 4)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              if (blueDot)
                const Icon(Icons.circle, color: Colors.blue, size: 8),
            ],
          ),
          const SizedBox(height: 8),
          const Text("12 Comments", style: TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _addNewCard() {
    return Container(
      width: 160,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, style: BorderStyle.dotted),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(Icons.add_circle, color: Colors.black54),
      ),
    );

 */