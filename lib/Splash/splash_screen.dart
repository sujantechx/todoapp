import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/Auth/auth_screen.dart';

import '../widgets/tab_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(Duration(seconds: 2),(){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>AuthScreen()));
    // }
    // );
    _checkStatus();
  }
  Future<void> _checkStatus()async{
    await Future.delayed(Duration(seconds: 2));
    final prefs= await SharedPreferences.getInstance();

    ///check the first time open
    bool isFirstTime=prefs.getBool('isFirstTime') ?? true;

    ///
    bool isLoggedIn=prefs.getBool('isLoggedIn')?? false;

    if(isLoggedIn){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomTabBar(),));
    }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen(),));

    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("TODO ",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xF2EAB616),
              fontSize: 25
            ),),

            Text(" NOW ",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              fontSize: 25
            ),),

          ],
        ),
      ),
    );
  }
}
