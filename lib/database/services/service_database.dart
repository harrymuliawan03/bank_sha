import 'package:bank_sha/database/core/response_database.dart';
import 'package:bank_sha/database/database.dart';
import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ServiceDatabase {
  // Function to create and return a DriftIsolate
  static Future<DriftIsolate> createDriftIsolate() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'db.sqlite');
    final isolate = await DriftIsolate.spawn(
      () => NativeDatabase(File(path)),
    );
    return isolate;
  }

  static Future<ResponseDatabase<T>> insertData<T>(
    AppDatabase db,
    TableInfo table,
    Insertable data,
  ) async {
    try {
      // Use insertOnConflictUpdate to handle insertion or update
      final res = await db.into(table).insertOnConflictUpdate(data);
      print('res $res');
      return ResponseDatabase<T>(
          valid: true, data: null, message: 'Success added or updated data');
    } catch (e) {
      print(e);
      return ResponseDatabase<T>(
          valid: false, data: null, message: 'Failed to add or update data');
    }
  }

  static Future<ResponseDatabase<T>> getData<T>(
    AppDatabase db,
    TableInfo table,
  ) async {
    try {
      final res = await db.select(table).get() as List<T>;
      return ResponseDatabase<T>(
          valid: true, data: res, message: 'Success get data');
    } catch (e) {
      return ResponseDatabase<T>(
          valid: false, data: null, message: 'Failed get data');
    }
  }

  static Future<ResponseDatabase<T>> deleteAllData<T>(
    AppDatabase db,
    TableInfo table,
  ) async {
    try {
      final res = await db.delete(table).go();
      if (res > 0) {
        return ResponseDatabase<T>(
            valid: true, data: null, message: 'Success delete data');
      }
      return ResponseDatabase<T>(
          valid: false, data: null, message: 'Failed delete data');
    } catch (e) {
      return ResponseDatabase<T>(
          valid: false, data: null, message: 'Failed delete data');
    }
  }
}
