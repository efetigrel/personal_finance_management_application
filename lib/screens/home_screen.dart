import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Hello'),
      ),
    );
  }
}
