import 'package:flutter/material.dart';

import '../services/database.dart';

class GoalScreen extends StatefulWidget {
  @override
  _GoalScreenState createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  final DatabaseService _databaseService = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _goalController = TextEditingController();
  final TextEditingController _stepsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hedef Belirleme'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _goalController,
                decoration: InputDecoration(labelText: 'Hedef'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir hedef girin';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stepsController,
                decoration: InputDecoration(labelText: 'İzlenecek Adımlar'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen izlenecek adımları girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveGoal,
                child: Text('Hedefi Kaydet'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveGoal() {
    if (_formKey.currentState!.validate()) {
      final String goal = _goalController.text.trim();
      final String steps = _stepsController.text.trim();

      _databaseService.addGoal({'goal': goal, 'steps': steps});

      // Ekranı kapat ve önceki ekrana geri dön
      Navigator.of(context).pop();
    }
  }
}
