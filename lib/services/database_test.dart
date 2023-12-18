import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Database Service Tests', () {
    late DatabaseService databaseService;

    setUp(() {
      databaseService = DatabaseService();
    });

    test('Add and Retrieve Income', () async {
      final incomeData = {
        'category': 'Salary',
        'amount': 2000.0,
        'date': '2023-01-01'
      };
      await databaseService.addIncome(incomeData);

      final retrievedIncome = await databaseService.getIncomes();
      expect(retrievedIncome, hasLength(1));
      expect(retrievedIncome[0]['category'], 'Salary');
      expect(retrievedIncome[0]['amount'], 2000.0);
      expect(retrievedIncome[0]['date'], '2023-01-01');
    });

    test('Add and Retrieve Expense', () async {
      final expenseData = {
        'category': 'Groceries',
        'amount': 100.0,
        'date': '2023-01-02'
      };
      await databaseService.addExpense(expenseData);

      final retrievedExpense = await databaseService.getExpenses();
      expect(retrievedExpense, hasLength(1));
      expect(retrievedExpense[0]['category'], 'Groceries');
      expect(retrievedExpense[0]['amount'], 100.0);
      expect(retrievedExpense[0]['date'], '2023-01-02');
    });
  });
}

class DatabaseService {
  // Örnek bir gelir listesi
  List<Map<String, dynamic>> incomes = [];

  // Örnek bir gider listesi
  List<Map<String, dynamic>> expenses = [];

  // Gelir eklemek için metot
  Future<void> addIncome(Map<String, dynamic> incomeData) async {
    // Geliri listeye ekleme işlemleri
    // ...
  }

  // Gelirleri getirmek için metot
  Future<List<Map<String, dynamic>>> getIncomes() async {
    // Gelir listesini getirme işlemleri
    // ...
    return incomes;
  }

  // Gider eklemek için metot
  Future<void> addExpense(Map<String, dynamic> expenseData) async {
    // Gideri listeye ekleme işlemleri
    // ...
  }

  // Giderleri getirmek için metot
  Future<List<Map<String, dynamic>>> getExpenses() async {
    // Gider listesini getirme işlemleri
    // ...
    return expenses;
  }

  // Diğer metotlar

  // ...
}
