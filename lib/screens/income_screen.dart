import 'package:flutter/material.dart';
import 'package:personal_finance_management_application/screens/chart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Finans Yönetimi'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Ana Sayfa'),
              Tab(icon: Icon(Icons.attach_money), text: 'Gelir'),
              Tab(icon: Icon(Icons.money_off), text: 'Harcama'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Ana Sayfa Ekranı')),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChartScreen()));
          },
          tooltip: 'Grafik Ekranı',
          child: const Icon(Icons.insert_chart),
        ),
      ),
    );
  }
}
