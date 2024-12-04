import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return await openDatabase(path,
        version: 2, onCreate: _createDB, onUpgrade: _onUpgrade);
  }

  // Function to create the initial tables
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        profilePicture BLOB,
        firstName TEXT NOT NULL,
        lastName TEXT NOT NULL,
        position TEXT NOT NULL,
        phone TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        isLoggedIn INTEGER DEFAULT 0
      )
    ''');

    // Creating the search_history table
    await db.execute('''
      CREATE TABLE search_history (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        query TEXT NOT NULL,
        timestamp INTEGER NOT NULL
      )
    ''');
  }

  // Function to handle upgrades (e.g., adding new tables)
  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE search_history (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          query TEXT NOT NULL,
          timestamp INTEGER NOT NULL
        )
      ''');
    }
  }

  // Get trending search queries
  Future<List<Map<String, dynamic>>> getTrendingSearchQueries() async {
    final db = await instance.database;
    return await db.rawQuery('''
    SELECT query, COUNT(query) as frequency
    FROM search_history
    GROUP BY query
    ORDER BY frequency DESC, timestamp DESC
    LIMIT 10
  ''');
  }

  // Add search history
  Future<int> addSearchHistory(String query) async {
    final db = await instance.database;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return await db.insert('search_history', {
      'query': query,
      'timestamp': timestamp,
    });
  }

  // Get search history (5 latest searches)
  Future<List<Map<String, dynamic>>> getSearchHistory() async {
    final db = await instance.database;
    return await db.query(
      'search_history',
      orderBy: 'timestamp DESC',
      limit: 5,
    );
  }

  // Clear all search history
  Future<void> clearSearchHistory() async {
    final db = await instance.database;
    await db.delete('search_history');
  }

  // Delete a specific search history
  Future<void> deleteSearchHistory(String query) async {
    final db = await instance.database;
    await db.delete(
      'search_history',
      where: 'query = ?',
      whereArgs: [query],
    );
  }

  // Register user
  Future<int> registerUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }

  // Login user
  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Get current logged-in user
  Future<Map<String, dynamic>?> getCurrentUser(int userId) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
    return result.isNotEmpty ? result.first : null;
  }

  // Logout user
  Future<void> logoutUser(int userId) async {
    final db = await instance.database;
    await db.update(
      'users',
      {'isLoggedIn': 0},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  // Update user information
  Future<int> updateUser(int userId, Map<String, dynamic> updatedData) async {
    final db = await instance.database;
    return await db.update(
      'users',
      updatedData,
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  // Delete user
  Future<int> deleteUser(int userId) async {
    final db = await instance.database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  // Check if email exists
  Future<bool> emailExists(String email) async {
    final db = await instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  // Set user as logged-in
  Future<void> setLoggedInUser(int userId) async {
    final db = await instance.database;
    await db.update(
      'users',
      {'isLoggedIn': 1},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  // Get all users
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await instance.database;
    return await db.query('users');
  }
}
