// ignore_for_file: constant_identifier_names

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:xpenso/data/model/user_model.dart';

import '../../domain/app_constants.dart';
import '../model/expense_model.dart';

class DbHelper {
  DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  static const String USER_TABLE = 'user_table';
  static const String USER_ID = 'user_id';
  static const String USER_NAME = 'user_name';
  static const String USER_EMAIL = 'user_email';
  static const String USER_PASSWORD = 'user_password';
  static const String USER_MOBILE = 'user_mobile';
  static const String USER_CREATED_AT = 'created_at';

  static const String EXPENSE_TABLE = 'expense_table';
  static const String EXPENSE_ID = 'expense_id';
  static const String EXPENSE_TITLE = 'expense_title';
  static const String EXPENSE_DESCRIPTION = 'expense_description';
  static const String EXPENSE_DATE = 'expense_date';
  static const String EXPENSE_AMOUNT = 'expense_amount';
  static const String EXPENSE_BALANCE = 'expense_balance';
  static const String EXPENSE_TYPE = 'expense_type'; // 1-> debit, 2-> credit
  static const String EXPENSE_CATEGORY = 'expense_category_id';
  static const String EXPENSE_CREATED_AT = 'expense_created_at';

  Database? _db;

  Future<Database> getDB() async {
    _db ??= await openDb();
    return _db!;
  }

  Future<Database> openDb() async {
    Directory appDocDir = await getApplicationCacheDirectory();
    String dbPath = join(appDocDir.path, 'expenseDb.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $USER_TABLE (
          $USER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $USER_NAME TEXT NOT NULL,
          $USER_EMAIL TEXT NOT NULL,
          $USER_PASSWORD TEXT NOT NULL,
          $USER_MOBILE TEXT,
          $USER_CREATED_AT TEXT NOT NULL
        )
      ''');

        await db.execute('''
        CREATE TABLE $EXPENSE_TABLE (
          $EXPENSE_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          $USER_ID TEXT NOT NULL,
          $EXPENSE_TITLE TEXT NOT NULL,
          $EXPENSE_DESCRIPTION TEXT,
          $EXPENSE_DATE TEXT NOT NULL,
          $EXPENSE_AMOUNT REAL NOT NULL,
          $EXPENSE_BALANCE REAL,
          $EXPENSE_TYPE TEXT NOT NULL,
          $EXPENSE_CATEGORY TEXT NOT NULL
        )
      ''');
      },
    );
  }

  /// events
  /// register USER
  Future<bool> registerUser(UserModel newUser) async {
    var db = await getDB();

    int rowsEffected = await db.insert(USER_TABLE, newUser.toMap());

    return rowsEffected > 0;
  }

  ///check email before registering
  Future<bool> isEmailAlreadyExists({required String email}) async {
    var db = await getDB();

    List<Map<String, dynamic>> mData = await db
        .query(USER_TABLE, where: "$USER_EMAIL = ?", whereArgs: [email]);

    return mData.isNotEmpty;
  }

  ///authenticate USER
  Future<bool> authenticateUser(
      {String email = "",
      String mobNo = "",
      required String pass,
      bool isEmail = true}) async {
    var db = await getDB();

    var mData = isEmail
        ? await db.query(USER_TABLE,
            where: "$USER_EMAIL = ? and $USER_PASSWORD = ?",
            whereArgs: [email, pass])
        : await db.query(USER_TABLE,
            where: "$USER_MOBILE = ? and $USER_PASSWORD = ?",
            whereArgs: [mobNo, pass]);

    if (mData.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(AppConstants.USER_ID, UserModel.fromMap(mData[0]).uid ?? 0);
    }

    return mData.isNotEmpty;
  }

  Future<bool> addExpense({required ExpenseModel newExp}) async {
    var db = await getDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt(AppConstants.USER_ID) ?? 0;

    newExp.uid = uid.toString();

    int rowsEffected = await db.insert(EXPENSE_TABLE, newExp.toMap());

    return rowsEffected > 0;
  }

  Future<List<ExpenseModel>> fetchAllExpense() async{
    var db = await getDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uid = prefs.getInt(AppConstants.USER_ID) ?? 0;

    List<Map<String, dynamic>> mExp = await db.query(EXPENSE_TABLE, where: "$USER_ID = ?", whereArgs: [uid]);

    List<ExpenseModel> allExp = [];

    for(Map<String, dynamic> eachExp in mExp){
      allExp.add(ExpenseModel.fromMap(eachExp));
    }

    return allExp;
  }
}
