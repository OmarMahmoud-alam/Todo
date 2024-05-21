import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todoapp/feature/home/data/model/todo_item_model/todo.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        todo TEXT,
        completed INTEGER,
        userId INTEGER
      )
    ''');
  }

  Future<void> insertTodo(Todo todo) async {
    final db = await database;
    await db.insert('todos', todo.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTodos(int offset, int limit) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todos',
      offset: offset,
      limit: limit,
    );

    return List.generate(maps.length, (i) {
      return Todo.fromJson(maps[i]);
    });
  }
}