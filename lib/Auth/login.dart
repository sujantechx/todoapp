import 'package:flutter/material.dart';
import 'package:todoapp/Auth/signup.dart';
import 'package:todoapp/widgets/tab_bar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
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
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email or Phone",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                    ),
                  ),
                  SizedBox(width: 30,),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                    ),
                  ),
                  SizedBox(width: 30,),

                  TextButton(onPressed: (){

                  }, child: Text("Forget Password ??",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                    Color(0xEFECAC22),
                  ),)),

                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                  },
                    child: Text.rich(TextSpan(
                     text: "Don't have an account ",
                     children: [
                       TextSpan(
                         text: "Sign Up",style: TextStyle(
                           color: Color(0xEFECAC22)
                       )
                       )
                     ]
                               )),
                  ),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomTabBar(),));
                      },style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                    Color(0xEFECAC22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                  ),
                      child: Text("  Login  ")),
                ],
              ),
            ),
          ),
        ],
      ) ,
    );
  }
}
