import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/firebase_options.dart';
import 'package:personal_finance_management_application/screens/auth/sign_in.dart';
import 'package:personal_finance_management_application/screens/auth/sign_up.dart';
import 'package:personal_finance_management_application/screens/home_screen.dart';
import 'package:personal_finance_management_application/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Finance Management Application',
      routes: {
        "/signIn": (context) => const SignIn(),
        "/signUp": (context) => const SignUp(),
        "/homeScreen": (context) => const HomeScreen()
      },
      theme: AppTheme.darkTheme(),
      home: const SignIn(),
    );
  }
}
