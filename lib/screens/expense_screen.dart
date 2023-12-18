import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Tarih formatlama için

import '../services/database.dart';

class ExpenseScreen extends StatefulWidget {
  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harcama Girişi'),
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
                decoration: InputDecoration(labelText: 'Harcama Kategorisi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen harcama kategorisini girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Miktar (\$)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen miktarı girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text('Tarih: ${DateFormat.yMd().format(_selectedDate)}'),
              ElevatedButton(
                onPressed: _selectDate,
                child: Text('Tarih Seç'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveExpense,
                child: Text('Kaydet'),
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

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      final String category = _categoryController.text.trim();
      final double amount = double.parse(_amountController.text.trim());
      final String date = DateFormat('yyyy-MM-dd').format(_selectedDate);

      _databaseService
          .addExpense({'category': category, 'amount': amount, 'date': date});

      // Ekranı kapat ve önceki ekrana geri dön
      Navigator.of(context).pop();
    }
  }
}
