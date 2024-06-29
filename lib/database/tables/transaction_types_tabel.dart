import 'package:drift/drift.dart';

@DataClassName('TransactionType')
class TransactionTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get code => text().nullable()();
  TextColumn get action => text().nullable()();
  TextColumn get thumbnail => text().nullable()();
}
