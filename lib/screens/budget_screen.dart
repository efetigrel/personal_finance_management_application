import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tarih formatlama için
import 'package:charts_flutter/flutter.dart' as charts;

import '../services/database.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _budgetAmountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bütçe Yönetimi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Kategori'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir kategori girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _budgetAmountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Bütçe Miktarı (\$)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bütçe miktarını girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                  'Başlangıç Tarihi: ${DateFormat.yMd().format(_selectedDate)}'),
              ElevatedButton(
                onPressed: _selectDate,
                child: Text('Başlangıç Tarihi Seç'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveBudget,
                child: Text('Bütçe Oluştur'),
              ),
              SizedBox(height: 16.0),
              FutureBuilder(
                future: _loadBudgetData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Hata oluştu: ${snapshot.error}');
                  } else {
                    return _buildBudgetChart(snapshot.data!);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<List<Map<String, dynamic>>> _loadBudgetData() async {
    // Kategori ve bütçe miktarını veritabanından çek
    return await _databaseService.getBudgets();
  }

  void _saveBudget() {
    if (_formKey.currentState!.validate()) {
      final String category = _categoryController.text.trim();
      final double budgetAmount =
          double.parse(_budgetAmountController.text.trim());
      final String startDate = DateFormat('yyyy-MM-dd').format(_selectedDate);

      _databaseService.addBudget({
        'category': category,
        'budgetAmount': budgetAmount,
        'startDate': startDate,
      });
    }
  }

  Widget _buildBudgetChart(List<Map<String, dynamic>> budgetData) {
    List<charts.Series<Map<String, dynamic>, String>> _createChartData() {
      return [
        charts.Series<Map<String, dynamic>, String>(
          id: 'Budgets',
          domainFn: (Map<String, dynamic> budget, _) =>
              budget['category'] as String,
          measureFn: (Map<String, dynamic> budget, _) =>
              budget['budgetAmount'] as double,
          data: budgetData,
          labelAccessorFn: (Map<String, dynamic> budget, _) =>
              '${budget['category']}: \$${budget['budgetAmount']}',
        ),
      ];
    }

    return Expanded(
      child: charts.PieChart(
        _createChartData(),
        animate: true,
        animationDuration: Duration(seconds: 1),
        defaultRenderer: charts.ArcRendererConfig(
          arcRendererDecorators: [charts.ArcLabelDecorator()],
        ),
      ),
    );
  }
}
