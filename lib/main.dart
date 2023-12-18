import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/screens/home_screen.dart';
import 'package:personal_finance_management_application/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Finance Management Application',
      theme: AppTheme.darkTheme(),
      home: HomeScreen(),
    );
  }
}
