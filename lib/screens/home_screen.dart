import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/database.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finans Yönetimi'),
      ),
      body: FutureBuilder(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata oluştu: ${snapshot.error}');
          } else {
            return _buildHomeScreen(snapshot.data!);
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _loadData() async {
    // Gelir ve harcamaları veritabanından çek
    List<Map<String, dynamic>> incomes = await _databaseService.getIncomes();
    List<Map<String, dynamic>> expenses = await _databaseService.getExpenses();

    // Toplam gelir ve harcamayı hesapla
    double totalIncome = incomes.fold(0, (sum, item) => sum + item['amount']);
    double totalExpense = expenses.fold(0, (sum, item) => sum + item['amount']);

    // Gelir ve harcamaları döndür
    return {
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
      'incomes': incomes,
      'expenses': expenses,
    };
  }

  Widget _buildHomeScreen(Map<String, dynamic> data) {
    List<charts.Series<Map<String, dynamic>, String>> _createChartData() {
      final incomeData = data['incomes'] as List<Map<String, dynamic>>;
      final expenseData = data['expenses'] as List<Map<String, dynamic>>;

      return [
        charts.Series<Map<String, dynamic>, String>(
          id: 'Income',
          domainFn: (Map<String, dynamic> income, _) =>
              income['type'] as String,
          measureFn: (Map<String, dynamic> income, _) =>
              income['amount'] as double,
          data: incomeData,
          labelAccessorFn: (Map<String, dynamic> income, _) =>
              '${income['type']}: \$${income['amount']}',
        ),
        charts.Series<Map<String, dynamic>, String>(
          id: 'Expense',
          domainFn: (Map<String, dynamic> expense, _) =>
              expense['category'] as String,
          measureFn: (Map<String, dynamic> expense, _) =>
              expense['amount'] as double,
          data: expenseData,
          labelAccessorFn: (Map<String, dynamic> expense, _) =>
              '${expense['category']}: \$${expense['amount']}',
        ),
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Toplam Gelir: \$${data['totalIncome']}'),
                Text('Toplam Harcama: \$${data['totalExpense']}'),
              ],
            ),
          ),
        ),
        Expanded(
          child: charts.PieChart(
            _createChartData(),
            animate: true,
            animationDuration: const Duration(seconds: 1),
            defaultRenderer: charts.ArcRendererConfig(
              arcRendererDecorators: [charts.ArcLabelDecorator()],
            ),
          ),
        ),
      ],
    );
  }
}
