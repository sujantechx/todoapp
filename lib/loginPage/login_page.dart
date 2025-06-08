import 'package:flutter/material.dart';
import 'package:todoapp/wedget/tabbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios),
              ),
              SizedBox(height: 10),
              Text(
                'Create Account👋',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Please register on our Streamline, where you can continue using our service.",
                style: TextStyle(color: Colors.grey.shade700),
              ),
              SizedBox(height: 30),
              _buildTextField("Sujan Sahu", Icons.person),
              SizedBox(height: 15),
              _buildTextField("sujansahu@gmail.com", Icons.email),
              SizedBox(height: 15),
              _buildTextField("••••••••", Icons.lock, obscureText: true),
              SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreeToTerms = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "I agree to ",
                        children: [
                          TextSpan(
                            text: "privacy policy & terms",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: agreeToTerms ? () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomTabBar(),));
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF45C43),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text("Continue", style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 20),
              Center(child: Text("Or")),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildSocialIcon("assets/images/google.png"),
                  _buildSocialIcon("assets/images/facebook.png"),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    children: [
                      TextSpan(
                        text: "Sign in instead",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, IconData icon,
      {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Image.asset(assetPath, height: 24, width: 24),
    );
  }
}
