import 'package:flutter/material.dart';
import 'package:geo_jurnal/screens/main_navigation.dart';
import 'package:geo_jurnal/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text("Hi! Welcome Back", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 40),
            
            _buildLabel("Email / Username"),
            TextFormField(decoration: const InputDecoration(hintText: "Enter your email")),
            const SizedBox(height: 20),
            
            _buildLabel("Password"),
            TextFormField(obscureText: true, decoration: const InputDecoration(hintText: "••••••••")),
            
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?", style: TextStyle(color: Color(0xFF3C6658), fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainNavigationScaffold()),
                    (route) => false,
                  );
                },
                child: const Text("Login"),
              ),
            ),
            
            const SizedBox(height: 250),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                   GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const RegisterScreen()));
                    },
                    child: const Text("Register", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3C6658))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    );
  }
}