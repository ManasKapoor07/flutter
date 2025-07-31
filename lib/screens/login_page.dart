import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import '/screens/CreateAccountPage.dart';
// import '/screens/hero_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 36, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App Logo
              Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: Center(
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 64, // Adjust as needed
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF242526),
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome back! Please enter your details.",
                  style: TextStyle(
                    fontSize: 15.5,
                    color: Color(0xFF7A7F92),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 36),

              // Email
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  labelStyle: theme.textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF7A7F92),
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE7EAF1)),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE7EAF1)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4852B2),
                      width: 1.4,
                    ),
                  ),
                  filled: false,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 22),

              // Password
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: theme.textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF7A7F92),
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE7EAF1)),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFE7EAF1)),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF4852B2),
                      width: 1.4,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF858899),
                    ),
                    onPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),
                  filled: false,
                ),
              ),
              const SizedBox(height: 38),

              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Example Login logic here
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MainPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF4852B2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      letterSpacing: 0.2,
                    ),
                  ),
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(height: 28),

              // OR divider
              Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 1, color: Color(0xFFE7EAF1)),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or login with",
                      style: TextStyle(color: Color(0xFFB0B5CA), fontSize: 13),
                    ),
                  ),
                  const Expanded(
                    child: Divider(thickness: 1, color: Color(0xFFE7EAF1)),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Google Button
              SizedBox(
                height: 44,
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: Image.asset("assets/images/google.png", height: 22),
                  label: const Text(
                    "Google",
                    style: TextStyle(fontSize: 15, color: Color(0xFF181A20)),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE7EAF1), width: 1),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 12),

              // Apple Button
              SizedBox(
                height: 44,
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.apple, color: Colors.black, size: 22),
                  label: const Text(
                    "Apple",
                    style: TextStyle(fontSize: 15, color: Color(0xFF181A20)),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE7EAF1), width: 1),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 22),

              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF4852B2),
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  child: const Text("Forgot Password?"),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 13, color: Color(0xFF969AAF)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF4852B2),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF4852B2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
