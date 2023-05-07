import 'package:flutter/material.dart';
import 'package:ui_one/features/auth/presentation/pages/intro_page.dart';
import 'package:ui_one/features/auth/presentation/pages/search_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ui_one/features/auth/presentation/pages/sign_up_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SearchScreen(),
      routes: {
        IntroPage.id: (context) => const IntroPage(),
        SignUpPage.id: (context) => const SignUpPage(),
        SignInPage.id: (context) => const SignInPage(),
      },
    );
  }
}
