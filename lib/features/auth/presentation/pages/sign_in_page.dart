import 'package:flutter/material.dart';

import '../components/buttons.dart';

class SignInPage extends StatefulWidget {
  static const String id = "sign_in_page"; 

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool passwordSee = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              width: 100,
              height: 100,
            ),
            const Center(
              child: Text(
                "Welcome back!\nSign in to continue!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 100,
              height: 100,
            ),
            Column(
              children: const [
                MyButton(
                  iconUrl: 'assets/images/ic_google.png',
                  text: "Log in with Google",
                ),
                SizedBox(height: 20),
                MyButton(
                  iconUrl: 'assets/images/ic_facebook.png',
                  text: "Log in with Google",
                ),
                SizedBox(height: 20),
                Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return "Name in not valid";
                    }
                  },
                  decoration: const InputDecoration(hintText: "user name"),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  obscureText: passwordSee,
                  validator: (value) {
                    if (value != null && value.length >= 8) {
                      return null;
                    } else {
                      return "Name in not valid";
                    }
                  },
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
              ],
            ),
            const SizedBox(height: 100),
            Column(
              children: const [
                MyButtonTwo(text: "Log in"),
                SizedBox(height: 30),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF265AE8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
