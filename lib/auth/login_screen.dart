import 'package:flutter/material.dart';

import '../screens/home_screen.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20),

              /// LOGO + NAME
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.campaign, color: Colors.purple),
                  ),
                  SizedBox(width: 10),
                  Text("Infyle",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),

              SizedBox(height: 40),

              Text("Welcome Back 👋",
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold)),

              SizedBox(height: 8),

              Text("Login to continue creating amazing ads",
                  style: TextStyle(color: Colors.grey)),

            SizedBox(height: 25),

              buildTextField("Email or Phone", Icons.email),

              SizedBox(height: 20),

              buildTextField("Password", Icons.lock, isPassword: true),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                ),
              ),

              SizedBox(height: 10),

              buildButton(
                "Login",
                onTap: () {
                  print("Login Clicked");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomeScreen()),
                  );
                },
              ),
              SizedBox(height: 25),

              Center(child: Text("or continue with")),

              SizedBox(height: 20),

              socialButton("Continue with Google"),
              socialButton("Continue with Facebook"),

              SizedBox(height: 30),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => RegisterScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Register",
                            style: TextStyle(color: Colors.purple))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text("Create Your Account 🚀",
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),

              SizedBox(height: 25),

              buildTextField("Full Name", Icons.person),
              SizedBox(height: 15),

              buildTextField("Email", Icons.email),
              SizedBox(height: 15),

              buildTextField("Phone Number", Icons.phone),
              SizedBox(height: 15),

              buildTextField("Password", Icons.lock, isPassword: true),
              SizedBox(height: 15),

              buildTextField("Confirm Password", Icons.lock, isPassword: true),

              SizedBox(height: 20),

              Row(
                children: [
                  Checkbox(value: true, onChanged: (v) {}),
                  Expanded(
                      child: Text(
                          "I agree to Terms & Conditions and Privacy Policy"))
                ],
              ),

              SizedBox(height: 15),

              buildButton("Create Account"),

              SizedBox(height: 30),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Login",
                            style: TextStyle(color: Colors.purple))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// COMMON WIDGETS
////////////////////////////////////////////////////////////

Widget buildTextField(String hint, IconData icon,
    {bool isPassword = false}) {
  return TextField(
    obscureText: isPassword,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hint,
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.symmetric(vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    ),
  );
}Widget buildButton(String text, {VoidCallback? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff7B61FF), Color(0xff5A4FFF)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
Widget socialButton(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(14),
    ),
    child: Center(
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
    ),
  );
}