

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////
/// LOGIN SCREEN
////////////////////////////////////////////////////////////

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 30),

              Text("Welcome Back 👋",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),

              SizedBox(height: 10),

              Text("Login to continue creating amazing ads",
                  style: TextStyle(color: Colors.grey)),

              SizedBox(height: 30),

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

              buildButton("Login"),

              SizedBox(height: 20),

              Center(child: Text("or continue with")),

              SizedBox(height: 20),

              socialButton("Continue with Google"),
              socialButton("Continue with Facebook"),

              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => RegisterScreen()),
                      );
                    },
                    child: Text("Register",
                        style: TextStyle(color: Colors.purple)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// REGISTER SCREEN
////////////////////////////////////////////////////////////

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Create Your Account 🚀",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

            SizedBox(height: 20),

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

            SizedBox(height: 10),

            buildButton("Create Account"),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text("Login",
                      style: TextStyle(color: Colors.purple)),
                )
              ],
            )
          ],
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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

Widget buildButton(String text) {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.purple, Colors.deepPurple],
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(
      child: Text(text,
          style: TextStyle(color: Colors.white, fontSize: 16)),
    ),
  );
}

Widget socialButton(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Center(child: Text(text)),
  );
}