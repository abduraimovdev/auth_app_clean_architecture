import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/components/buttons.dart';
import 'package:ui_one/features/auth/presentation/validator/auth_validator.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _signUpGlobalKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRetryController = TextEditingController();
  bool passwordSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _signUpGlobalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                // Back Icon Button
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    SizedBox(width: 10),
                    Text(
                      "Enter your details",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 55),
                Column(
                  children: [
                    // Name Input -------------------------------------
                    TextFormField(
                      validator: AuthValidator.isNameValid,
                      decoration: const InputDecoration(
                        hintText: "user name",
                      ),
                    ),

                    // Email Input -------------------------------------
                    const SizedBox(height: 40),
                    TextFormField(
                      validator: AuthValidator.isNameValid,
                      decoration: const InputDecoration(
                        hintText: "email addresss",
                      ),
                    ),

                    // Password Input -------------------------------------
                    const SizedBox(height: 40),
                    TextFormField(
                      obscureText: passwordSee,
                      validator: AuthValidator.isPasswordValid,
                      decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordSee = !passwordSee;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),

                    // Retry Password Input -------------------------------------
                    const SizedBox(height: 40),
                    TextFormField(
                      obscureText: passwordSee,
                      validator: AuthValidator.isPasswordValid,
                      decoration: InputDecoration(
                        hintText: "password",
                        suffixIcon: GestureDetector(
                          onTap: () {
                            passwordSee = !passwordSee;
                            setState(() {});
                          },
                          child: Icon(
                            passwordSee
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                    // Sign Up for Button ----------------------------------
                    MyButtonTwo(
                      text: "Continue",
                      onPressed: signUpButton,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // when the button is pressed
  void signUpButton() {
    if (_signUpGlobalKey.currentState!.validate()) {
      if (passwordController.text.trim() !=
          passwordRetryController.text.trim()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Iltimos Qayta yozish parolini Tugrilang !"),
          ),
        );
      }
      print("Data is True");
    }
  }

  // textController exits when finished
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRetryController.dispose();
    super.dispose();
  }
}
