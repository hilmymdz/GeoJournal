import 'package:flutter/material.dart';
import 'package:geo_jurnal/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Account", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("First Time? Fill your information below", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 30),
            
            _buildLabel("Full Name"),
            TextFormField(decoration: const InputDecoration(hintText: "Your Name")),
            const SizedBox(height: 16),
            
            _buildLabel("Email"),
            TextFormField(decoration: const InputDecoration(hintText: "email@example.com")),
            const SizedBox(height: 16),
            
            _buildLabel("Password"),
            TextFormField(obscureText: true, decoration: const InputDecoration(hintText: "••••••••")),
            const SizedBox(height: 16),
            
            _buildLabel("Confirm Password"),
            TextFormField(obscureText: true, decoration: const InputDecoration(hintText: "••••••••")),
            const SizedBox(height: 32),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Register"),
              ),
            ),
            
            const SizedBox(height: 100),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                   GestureDetector(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                    },
                    child: const Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF3C6658))),
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