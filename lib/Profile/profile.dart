import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/Auth/auth_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ///shared preference to check
  Future<void>_Logout()async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(),));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              const SizedBox(height: 16),
              // Top Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back_ios_new_rounded),
                  Icon(Icons.more_vert),
                ],
              ),

              const SizedBox(height: 24),

              // Task Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Column(
                    children: [
                      Text("12", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("In Process tasks", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(width: 30),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/profile.png"), // Use your own image URL
                  ),
                  SizedBox(width: 30),
                  Column(
                    children: [
                      Text("42", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("Completed tasks", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
               SizedBox(height: 16),

              // Name and Role
              Column(
                children: [
                  const Text("Sujan ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Software Designer", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Color(0xEFECAC22),                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Settings Options
              ..._buildSettingsList(),

              ElevatedButton(onPressed: ()=>_Logout(),

                  style:ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                    Color(0xEFECAC22),
                  ),child: Text("Log Out"))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSettingsList() {
    final settings = [
      {"icon": Icons.notifications_none, "title": "Notification"},
      {"icon": Icons.security, "title": "Security"},
      {"icon": Icons.language, "title": "Language & Region"},
      {"icon": Icons.workspace_premium, "title": "Go Premium"},
      {"icon": Icons.help_outline, "title": "Help Center"},
    ];

    return settings
        .map(
          (item) => Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: ListTile(
          leading: Icon(item["icon"] as IconData, color: Colors.black),
          title: Text(item["title"] as String),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
      ),
    )
        .toList();

  }
}