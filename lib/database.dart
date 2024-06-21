import 'package:drift/drift.dart';

// These additional imports are necessary to open the sqlite3 database
import 'dart:io';
import 'package:drift/native.dart';
import 'package:drift_practice/todo_dao.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

const _uuid = Uuid();

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()(); // autoIncrementを使うと主キーに設定される
  TextColumn get title => text()();
  TextColumn get content => text().named('body')();
  TextColumn get category =>
      text().nullable().references(TodoCategories, #id)();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class TodoCategories extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get description => text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class HashTags extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get name => text().withLength(min: 1, max: 32)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}

class TodoItemHashTag extends Table {
  IntColumn get todoItemId =>
      integer().references(TodoItems, #id, onDelete: KeyAction.cascade)();
  TextColumn get hashTagId =>
      text().references(HashTags, #id, onDelete: KeyAction.cascade)();
  // こんなかんじで外部キーを指定することもできる
  // TextColumn get hashTagId =>
  //     text().customConstraint('REFERENCES hash_tags(id)')();

  @override
  Set<Column<Object>>? get primaryKey => {todoItemId, hashTagId};
}

@DriftDatabase(
  tables: [TodoItems, TodoCategories, HashTags, TodoItemHashTag],
  daos: [TodoDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase._() : super(_openConnection());

  static AppDatabase? _singleton;

  factory AppDatabase.singleton() {
    _singleton ??= AppDatabase._();
    return _singleton!;
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
