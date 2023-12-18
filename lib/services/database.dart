import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {
  static Database? _database;
  static const String dbName = 'finans_yonetimi.db';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Tabloları oluşturmak için gerekli SQL komutlarını yazın
        await db.execute('''
          CREATE TABLE incomes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            amount REAL,
            date TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE expenses(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            category TEXT,
            amount REAL,
            date TEXT
          )
        ''');
      },
    );
  }

  // Gelir ekleme işlemi
  Future<void> addIncome(Map<String, dynamic> income) async {
    final Database db = await database;
    await db.insert('incomes', income);
  }

  // Harcama ekleme işlemi
  Future<void> addExpense(Map<String, dynamic> expense) async {
    final Database db = await database;
    await db.insert('expenses', expense);
  }

  // Gelir güncelleme işlemi
  Future<void> updateIncome(int id, Map<String, dynamic> income) async {
    final Database db = await database;
    await db.update('incomes', income, where: 'id = ?', whereArgs: [id]);
  }

  // Harcama güncelleme işlemi
  Future<void> updateExpense(int id, Map<String, dynamic> expense) async {
    final Database db = await database;
    await db.update('expenses', expense, where: 'id = ?', whereArgs: [id]);
  }

  // Gelir silme işlemi
  Future<void> deleteIncome(int id) async {
    final Database db = await database;
    await db.delete('incomes', where: 'id = ?', whereArgs: [id]);
  }

  // Harcama silme işlemi
  Future<void> deleteExpense(int id) async {
    final Database db = await database;
    await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
  }

  getIncomes() {}

  getBudgets() {}

  void addBudget(Map<String, Object> map) {}

  getExpenses() {}

  void addGoal(Map<String, String> map) {}
}


// In lib/services/database.dart
