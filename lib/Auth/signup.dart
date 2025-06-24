import 'package:flutter/material.dart';
import 'package:todoapp/Auth/login.dart';
import 'package:todoapp/widgets/tab_bar.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final phoneController=TextEditingController();
  final nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
      Container(
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/bgimg.png"),fit: BoxFit.fill)
    ),
    ),
          Container(
           decoration: BoxDecoration(
           color: Colors.white.withOpacity(0.3)
        ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 25,),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 25,),

                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 25,),

                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  SizedBox(height: 10,),

                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                    child: Text.rich(
                      TextSpan(
                        text:"I have an acc",
                        children:[
                          TextSpan(
                            text: "  Login.",style: TextStyle(
                            color: Color(0xEFECAC22)
                          )
                          )
                        ]
                      )
                    ),
                  ),


                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomTabBar(),));
                      },style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xEFECAC22),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side:BorderSide(width: double.infinity)
                  ),
                      child: Text(" Sign Up ")),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
