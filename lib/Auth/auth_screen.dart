import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/Auth/login.dart';
import 'package:todoapp/Auth/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  ///check status login
  Future<void> _login(BuildContext context,String type) async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn',true);
    if(type=='Login'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup(),));

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              image: DecorationImage(image: AssetImage("assets/images/bgimg.png"),
                  fit: BoxFit.cover
              )
            ),
          ),

          Positioned(
              bottom: 20,right: 5,left: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton(
                  onPressed: ()=>_login(context, 'Login')
                  ,style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:
                    Color(0xEFECAC22),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ), child: Text("  Login  ")),

                   ElevatedButton(
                  onPressed: ()=>_login(context, 'Signup'),
                       style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                       backgroundColor:
                       Color(0xEFECAC22),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                  ),
                      child: Text(" Sign Up ")),

                ],
              ))
        ],
      ),
    );
  }
}
