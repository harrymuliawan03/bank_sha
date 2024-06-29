import 'package:drift/drift.dart';

@DataClassName('Transaction')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get amount => integer()();
  TextColumn get createdAt => text()();

  IntColumn get transactionTypeId =>
      integer().customConstraint('NULL REFERENCES transaction_types(id)')();
}
