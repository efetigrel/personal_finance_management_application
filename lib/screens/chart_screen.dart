import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import '../services/database.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final DatabaseService _databaseService = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik ve İstatistikler'),
      ),
      body: FutureBuilder(
        future: _loadChartData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Hata oluştu: ${snapshot.error}');
          } else {
            return _buildChartScreen(snapshot.data!);
          }
        },
      ),
    );
  }

  Future<Map<String, dynamic>> _loadChartData() async {
    // Gelir ve harcamaları veritabanından çek
    List<Map<String, dynamic>> incomes = await _databaseService.getIncomes();
    List<Map<String, dynamic>> expenses = await _databaseService.getExpenses();

    return {
      'incomes': incomes,
      'expenses': expenses,
    };
  }

  Widget _buildChartScreen(Map<String, dynamic> chartData) {
    List<charts.Series<Map<String, dynamic>, String>> _createChartData() {
      return [
        charts.Series<Map<String, dynamic>, String>(
          id: 'Income',
          domainFn: (Map<String, dynamic> income, _) =>
              DateFormat.MMM().format(DateTime.parse(income['date'])),
          measureFn: (Map<String, dynamic> income, _) =>
              income['amount'] as double,
          data: chartData['incomes'],
          labelAccessorFn: (Map<String, dynamic> income, _) =>
              '${DateFormat.MMM().format(DateTime.parse(income['date']))}: \$${income['amount']}',
        ),
        charts.Series<Map<String, dynamic>, String>(
          id: 'Expense',
          domainFn: (Map<String, dynamic> expense, _) =>
              DateFormat.MMM().format(DateTime.parse(expense['date'])),
          measureFn: (Map<String, dynamic> expense, _) =>
              expense['amount'] as double,
          data: chartData['expenses'],
          labelAccessorFn: (Map<String, dynamic> expense, _) =>
              '${DateFormat.MMM().format(DateTime.parse(expense['date']))}: \$${expense['amount']}',
        ),
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: charts.BarChart(
            _createChartData(),
            animate: true,
            barGroupingType: charts.BarGroupingType.grouped,
            animationDuration: Duration(seconds: 1),
            defaultRenderer: charts.BarRendererConfig(
              groupingType: charts.BarGroupingType.grouped,
              strokeWidthPx: 2.0,
            ),
            behaviors: [
              charts.SeriesLegend(),
            ],
          ),
        ),
      ],
    );
  }
}
