// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TransactionTypesTable extends TransactionTypes
    with TableInfo<$TransactionTypesTable, TransactionType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, code, action, thumbnail];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_types';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action']),
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail']),
    );
  }

  @override
  $TransactionTypesTable createAlias(String alias) {
    return $TransactionTypesTable(attachedDatabase, alias);
  }
}

class TransactionType extends DataClass implements Insertable<TransactionType> {
  final int id;
  final String? name;
  final String? code;
  final String? action;
  final String? thumbnail;
  const TransactionType(
      {required this.id, this.name, this.code, this.action, this.thumbnail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || action != null) {
      map['action'] = Variable<String>(action);
    }
    if (!nullToAbsent || thumbnail != null) {
      map['thumbnail'] = Variable<String>(thumbnail);
    }
    return map;
  }

  TransactionTypesCompanion toCompanion(bool nullToAbsent) {
    return TransactionTypesCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      action:
          action == null && nullToAbsent ? const Value.absent() : Value(action),
      thumbnail: thumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnail),
    );
  }

  factory TransactionType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      code: serializer.fromJson<String?>(json['code']),
      action: serializer.fromJson<String?>(json['action']),
      thumbnail: serializer.fromJson<String?>(json['thumbnail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'code': serializer.toJson<String?>(code),
      'action': serializer.toJson<String?>(action),
      'thumbnail': serializer.toJson<String?>(thumbnail),
    };
  }

  TransactionType copyWith(
          {int? id,
          Value<String?> name = const Value.absent(),
          Value<String?> code = const Value.absent(),
          Value<String?> action = const Value.absent(),
          Value<String?> thumbnail = const Value.absent()}) =>
      TransactionType(
        id: id ?? this.id,
        name: name.present ? name.value : this.name,
        code: code.present ? code.value : this.code,
        action: action.present ? action.value : this.action,
        thumbnail: thumbnail.present ? thumbnail.value : this.thumbnail,
      );
  @override
  String toString() {
    return (StringBuffer('TransactionType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('action: $action, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, action, thumbnail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionType &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.action == this.action &&
          other.thumbnail == this.thumbnail);
}

class TransactionTypesCompanion extends UpdateCompanion<TransactionType> {
  final Value<int> id;
  final Value<String?> name;
  final Value<String?> code;
  final Value<String?> action;
  final Value<String?> thumbnail;
  const TransactionTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.action = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  TransactionTypesCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.action = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  static Insertable<TransactionType> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<String>? action,
    Expression<String>? thumbnail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (action != null) 'action': action,
      if (thumbnail != null) 'thumbnail': thumbnail,
    });
  }

  TransactionTypesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<String?>? code,
      Value<String?>? action,
      Value<String?>? thumbnail}) {
    return TransactionTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      action: action ?? this.action,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('action: $action, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }
}

class $TransactionsTable extends Transactions
    with TableInfo<$TransactionsTable, Transaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transactionTypeIdMeta =
      const VerificationMeta('transactionTypeId');
  @override
  late final GeneratedColumn<int> transactionTypeId = GeneratedColumn<int>(
      'transaction_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NULL REFERENCES transaction_types(id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, amount, createdAt, transactionTypeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transactions';
  @override
  VerificationContext validateIntegrity(Insertable<Transaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('transaction_type_id')) {
      context.handle(
          _transactionTypeIdMeta,
          transactionTypeId.isAcceptableOrUnknown(
              data['transaction_type_id']!, _transactionTypeIdMeta));
    } else if (isInserting) {
      context.missing(_transactionTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transaction(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      transactionTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}transaction_type_id'])!,
    );
  }

  @override
  $TransactionsTable createAlias(String alias) {
    return $TransactionsTable(attachedDatabase, alias);
  }
}

class Transaction extends DataClass implements Insertable<Transaction> {
  final int id;
  final int amount;
  final String createdAt;
  final int transactionTypeId;
  const Transaction(
      {required this.id,
      required this.amount,
      required this.createdAt,
      required this.transactionTypeId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<int>(amount);
    map['created_at'] = Variable<String>(createdAt);
    map['transaction_type_id'] = Variable<int>(transactionTypeId);
    return map;
  }

  TransactionsCompanion toCompanion(bool nullToAbsent) {
    return TransactionsCompanion(
      id: Value(id),
      amount: Value(amount),
      createdAt: Value(createdAt),
      transactionTypeId: Value(transactionTypeId),
    );
  }

  factory Transaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transaction(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      transactionTypeId: serializer.fromJson<int>(json['transactionTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<int>(amount),
      'createdAt': serializer.toJson<String>(createdAt),
      'transactionTypeId': serializer.toJson<int>(transactionTypeId),
    };
  }

  Transaction copyWith(
          {int? id, int? amount, String? createdAt, int? transactionTypeId}) =>
      Transaction(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        transactionTypeId: transactionTypeId ?? this.transactionTypeId,
      );
  @override
  String toString() {
    return (StringBuffer('Transaction(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('transactionTypeId: $transactionTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, createdAt, transactionTypeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transaction &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.transactionTypeId == this.transactionTypeId);
}

class TransactionsCompanion extends UpdateCompanion<Transaction> {
  final Value<int> id;
  final Value<int> amount;
  final Value<String> createdAt;
  final Value<int> transactionTypeId;
  const TransactionsCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.transactionTypeId = const Value.absent(),
  });
  TransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int amount,
    required String createdAt,
    required int transactionTypeId,
  })  : amount = Value(amount),
        createdAt = Value(createdAt),
        transactionTypeId = Value(transactionTypeId);
  static Insertable<Transaction> custom({
    Expression<int>? id,
    Expression<int>? amount,
    Expression<String>? createdAt,
    Expression<int>? transactionTypeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (transactionTypeId != null) 'transaction_type_id': transactionTypeId,
    });
  }

  TransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? amount,
      Value<String>? createdAt,
      Value<int>? transactionTypeId}) {
    return TransactionsCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      transactionTypeId: transactionTypeId ?? this.transactionTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (transactionTypeId.present) {
      map['transaction_type_id'] = Variable<int>(transactionTypeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionsCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('transactionTypeId: $transactionTypeId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $TransactionTypesTable transactionTypes =
      $TransactionTypesTable(this);
  late final $TransactionsTable transactions = $TransactionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [transactionTypes, transactions];
}

typedef $$TransactionTypesTableInsertCompanionBuilder
    = TransactionTypesCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> code,
  Value<String?> action,
  Value<String?> thumbnail,
});
typedef $$TransactionTypesTableUpdateCompanionBuilder
    = TransactionTypesCompanion Function({
  Value<int> id,
  Value<String?> name,
  Value<String?> code,
  Value<String?> action,
  Value<String?> thumbnail,
});

class $$TransactionTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionTypesTable,
    TransactionType,
    $$TransactionTypesTableFilterComposer,
    $$TransactionTypesTableOrderingComposer,
    $$TransactionTypesTableProcessedTableManager,
    $$TransactionTypesTableInsertCompanionBuilder,
    $$TransactionTypesTableUpdateCompanionBuilder> {
  $$TransactionTypesTableTableManager(
      _$AppDatabase db, $TransactionTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionTypesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionTypesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TransactionTypesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> action = const Value.absent(),
            Value<String?> thumbnail = const Value.absent(),
          }) =>
              TransactionTypesCompanion(
            id: id,
            name: name,
            code: code,
            action: action,
            thumbnail: thumbnail,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> name = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> action = const Value.absent(),
            Value<String?> thumbnail = const Value.absent(),
          }) =>
              TransactionTypesCompanion.insert(
            id: id,
            name: name,
            code: code,
            action: action,
            thumbnail: thumbnail,
          ),
        ));
}

class $$TransactionTypesTableProcessedTableManager
    extends ProcessedTableManager<
        _$AppDatabase,
        $TransactionTypesTable,
        TransactionType,
        $$TransactionTypesTableFilterComposer,
        $$TransactionTypesTableOrderingComposer,
        $$TransactionTypesTableProcessedTableManager,
        $$TransactionTypesTableInsertCompanionBuilder,
        $$TransactionTypesTableUpdateCompanionBuilder> {
  $$TransactionTypesTableProcessedTableManager(super.$state);
}

class $$TransactionTypesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionTypesTable> {
  $$TransactionTypesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get action => $state.composableBuilder(
      column: $state.table.action,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get thumbnail => $state.composableBuilder(
      column: $state.table.thumbnail,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransactionTypesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionTypesTable> {
  $$TransactionTypesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get code => $state.composableBuilder(
      column: $state.table.code,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get action => $state.composableBuilder(
      column: $state.table.action,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get thumbnail => $state.composableBuilder(
      column: $state.table.thumbnail,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TransactionsTableInsertCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  required int amount,
  required String createdAt,
  required int transactionTypeId,
});
typedef $$TransactionsTableUpdateCompanionBuilder = TransactionsCompanion
    Function({
  Value<int> id,
  Value<int> amount,
  Value<String> createdAt,
  Value<int> transactionTypeId,
});

class $$TransactionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableProcessedTableManager,
    $$TransactionsTableInsertCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder> {
  $$TransactionsTableTableManager(_$AppDatabase db, $TransactionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TransactionsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TransactionsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TransactionsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> amount = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<int> transactionTypeId = const Value.absent(),
          }) =>
              TransactionsCompanion(
            id: id,
            amount: amount,
            createdAt: createdAt,
            transactionTypeId: transactionTypeId,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int amount,
            required String createdAt,
            required int transactionTypeId,
          }) =>
              TransactionsCompanion.insert(
            id: id,
            amount: amount,
            createdAt: createdAt,
            transactionTypeId: transactionTypeId,
          ),
        ));
}

class $$TransactionsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TransactionsTable,
    Transaction,
    $$TransactionsTableFilterComposer,
    $$TransactionsTableOrderingComposer,
    $$TransactionsTableProcessedTableManager,
    $$TransactionsTableInsertCompanionBuilder,
    $$TransactionsTableUpdateCompanionBuilder> {
  $$TransactionsTableProcessedTableManager(super.$state);
}

class $$TransactionsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get transactionTypeId => $state.composableBuilder(
      column: $state.table.transactionTypeId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$TransactionsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TransactionsTable> {
  $$TransactionsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get amount => $state.composableBuilder(
      column: $state.table.amount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get transactionTypeId => $state.composableBuilder(
      column: $state.table.transactionTypeId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$TransactionTypesTableTableManager get transactionTypes =>
      $$TransactionTypesTableTableManager(_db, _db.transactionTypes);
  $$TransactionsTableTableManager get transactions =>
      $$TransactionsTableTableManager(_db, _db.transactions);
}
