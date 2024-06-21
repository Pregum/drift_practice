// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TodoCategoriesTable extends TodoCategories
    with TableInfo<$TodoCategoriesTable, TodoCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_categories';
  @override
  VerificationContext validateIntegrity(Insertable<TodoCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  $TodoCategoriesTable createAlias(String alias) {
    return $TodoCategoriesTable(attachedDatabase, alias);
  }
}

class TodoCategory extends DataClass implements Insertable<TodoCategory> {
  final String id;
  final String description;
  const TodoCategory({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  TodoCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TodoCategoriesCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory TodoCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoCategory(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  TodoCategory copyWith({String? id, String? description}) => TodoCategory(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('TodoCategory(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoCategory &&
          other.id == this.id &&
          other.description == this.description);
}

class TodoCategoriesCompanion extends UpdateCompanion<TodoCategory> {
  final Value<String> id;
  final Value<String> description;
  final Value<int> rowid;
  const TodoCategoriesCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    this.rowid = const Value.absent(),
  }) : description = Value(description);
  static Insertable<TodoCategory> custom({
    Expression<String>? id,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoCategoriesCompanion copyWith(
      {Value<String>? id, Value<String>? description, Value<int>? rowid}) {
    return TodoCategoriesCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'body', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_categories (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, content, category, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(Insertable<TodoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}body'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at']),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String content;
  final String? category;
  final DateTime? createdAt;
  const TodoItem(
      {required this.id,
      required this.title,
      required this.content,
      this.category,
      this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      category: serializer.fromJson<String?>(json['category']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'category': serializer.toJson<String?>(category),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TodoItem copyWith(
          {int? id,
          String? title,
          String? content,
          Value<String?> category = const Value.absent(),
          Value<DateTime?> createdAt = const Value.absent()}) =>
      TodoItem(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        category: category.present ? category.value : this.category,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, category, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.category == this.category &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> category;
  final Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.category = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : title = Value(title),
        content = Value(content);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? category,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (category != null) 'category': category,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? category,
      Value<DateTime?>? createdAt}) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('category: $category, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HashTagsTable extends HashTags with TableInfo<$HashTagsTable, HashTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HashTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      clientDefault: () => _uuid.v4());
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 32),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hash_tags';
  @override
  VerificationContext validateIntegrity(Insertable<HashTag> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HashTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HashTag(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $HashTagsTable createAlias(String alias) {
    return $HashTagsTable(attachedDatabase, alias);
  }
}

class HashTag extends DataClass implements Insertable<HashTag> {
  final String id;
  final String name;
  const HashTag({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  HashTagsCompanion toCompanion(bool nullToAbsent) {
    return HashTagsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory HashTag.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HashTag(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  HashTag copyWith({String? id, String? name}) => HashTag(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('HashTag(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HashTag && other.id == this.id && other.name == this.name);
}

class HashTagsCompanion extends UpdateCompanion<HashTag> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> rowid;
  const HashTagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HashTagsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.rowid = const Value.absent(),
  }) : name = Value(name);
  static Insertable<HashTag> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HashTagsCompanion copyWith(
      {Value<String>? id, Value<String>? name, Value<int>? rowid}) {
    return HashTagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HashTagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TodoItemHashTagTable extends TodoItemHashTag
    with TableInfo<$TodoItemHashTagTable, TodoItemHashTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemHashTagTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _todoItemIdMeta =
      const VerificationMeta('todoItemId');
  @override
  late final GeneratedColumn<int> todoItemId = GeneratedColumn<int>(
      'todo_item_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES todo_items (id) ON DELETE CASCADE'));
  static const VerificationMeta _hashTagIdMeta =
      const VerificationMeta('hashTagId');
  @override
  late final GeneratedColumn<String> hashTagId = GeneratedColumn<String>(
      'hash_tag_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES hash_tags (id) ON DELETE CASCADE'));
  @override
  List<GeneratedColumn> get $columns => [todoItemId, hashTagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_item_hash_tag';
  @override
  VerificationContext validateIntegrity(
      Insertable<TodoItemHashTagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('todo_item_id')) {
      context.handle(
          _todoItemIdMeta,
          todoItemId.isAcceptableOrUnknown(
              data['todo_item_id']!, _todoItemIdMeta));
    } else if (isInserting) {
      context.missing(_todoItemIdMeta);
    }
    if (data.containsKey('hash_tag_id')) {
      context.handle(
          _hashTagIdMeta,
          hashTagId.isAcceptableOrUnknown(
              data['hash_tag_id']!, _hashTagIdMeta));
    } else if (isInserting) {
      context.missing(_hashTagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {todoItemId, hashTagId};
  @override
  TodoItemHashTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItemHashTagData(
      todoItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}todo_item_id'])!,
      hashTagId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash_tag_id'])!,
    );
  }

  @override
  $TodoItemHashTagTable createAlias(String alias) {
    return $TodoItemHashTagTable(attachedDatabase, alias);
  }
}

class TodoItemHashTagData extends DataClass
    implements Insertable<TodoItemHashTagData> {
  final int todoItemId;
  final String hashTagId;
  const TodoItemHashTagData(
      {required this.todoItemId, required this.hashTagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['todo_item_id'] = Variable<int>(todoItemId);
    map['hash_tag_id'] = Variable<String>(hashTagId);
    return map;
  }

  TodoItemHashTagCompanion toCompanion(bool nullToAbsent) {
    return TodoItemHashTagCompanion(
      todoItemId: Value(todoItemId),
      hashTagId: Value(hashTagId),
    );
  }

  factory TodoItemHashTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItemHashTagData(
      todoItemId: serializer.fromJson<int>(json['todoItemId']),
      hashTagId: serializer.fromJson<String>(json['hashTagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'todoItemId': serializer.toJson<int>(todoItemId),
      'hashTagId': serializer.toJson<String>(hashTagId),
    };
  }

  TodoItemHashTagData copyWith({int? todoItemId, String? hashTagId}) =>
      TodoItemHashTagData(
        todoItemId: todoItemId ?? this.todoItemId,
        hashTagId: hashTagId ?? this.hashTagId,
      );
  @override
  String toString() {
    return (StringBuffer('TodoItemHashTagData(')
          ..write('todoItemId: $todoItemId, ')
          ..write('hashTagId: $hashTagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(todoItemId, hashTagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItemHashTagData &&
          other.todoItemId == this.todoItemId &&
          other.hashTagId == this.hashTagId);
}

class TodoItemHashTagCompanion extends UpdateCompanion<TodoItemHashTagData> {
  final Value<int> todoItemId;
  final Value<String> hashTagId;
  final Value<int> rowid;
  const TodoItemHashTagCompanion({
    this.todoItemId = const Value.absent(),
    this.hashTagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoItemHashTagCompanion.insert({
    required int todoItemId,
    required String hashTagId,
    this.rowid = const Value.absent(),
  })  : todoItemId = Value(todoItemId),
        hashTagId = Value(hashTagId);
  static Insertable<TodoItemHashTagData> custom({
    Expression<int>? todoItemId,
    Expression<String>? hashTagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (todoItemId != null) 'todo_item_id': todoItemId,
      if (hashTagId != null) 'hash_tag_id': hashTagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoItemHashTagCompanion copyWith(
      {Value<int>? todoItemId, Value<String>? hashTagId, Value<int>? rowid}) {
    return TodoItemHashTagCompanion(
      todoItemId: todoItemId ?? this.todoItemId,
      hashTagId: hashTagId ?? this.hashTagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (todoItemId.present) {
      map['todo_item_id'] = Variable<int>(todoItemId.value);
    }
    if (hashTagId.present) {
      map['hash_tag_id'] = Variable<String>(hashTagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemHashTagCompanion(')
          ..write('todoItemId: $todoItemId, ')
          ..write('hashTagId: $hashTagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $TodoCategoriesTable todoCategories = $TodoCategoriesTable(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final $HashTagsTable hashTags = $HashTagsTable(this);
  late final $TodoItemHashTagTable todoItemHashTag =
      $TodoItemHashTagTable(this);
  late final TodoDao todoDao = TodoDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [todoCategories, todoItems, hashTags, todoItemHashTag];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('todo_items',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('todo_item_hash_tag', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('hash_tags',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('todo_item_hash_tag', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$TodoCategoriesTableInsertCompanionBuilder = TodoCategoriesCompanion
    Function({
  Value<String> id,
  required String description,
  Value<int> rowid,
});
typedef $$TodoCategoriesTableUpdateCompanionBuilder = TodoCategoriesCompanion
    Function({
  Value<String> id,
  Value<String> description,
  Value<int> rowid,
});

class $$TodoCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoCategoriesTable,
    TodoCategory,
    $$TodoCategoriesTableFilterComposer,
    $$TodoCategoriesTableOrderingComposer,
    $$TodoCategoriesTableProcessedTableManager,
    $$TodoCategoriesTableInsertCompanionBuilder,
    $$TodoCategoriesTableUpdateCompanionBuilder> {
  $$TodoCategoriesTableTableManager(
      _$AppDatabase db, $TodoCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TodoCategoriesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TodoCategoriesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TodoCategoriesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoCategoriesCompanion(
            id: id,
            description: description,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String description,
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoCategoriesCompanion.insert(
            id: id,
            description: description,
            rowid: rowid,
          ),
        ));
}

class $$TodoCategoriesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TodoCategoriesTable,
    TodoCategory,
    $$TodoCategoriesTableFilterComposer,
    $$TodoCategoriesTableOrderingComposer,
    $$TodoCategoriesTableProcessedTableManager,
    $$TodoCategoriesTableInsertCompanionBuilder,
    $$TodoCategoriesTableUpdateCompanionBuilder> {
  $$TodoCategoriesTableProcessedTableManager(super.$state);
}

class $$TodoCategoriesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TodoCategoriesTable> {
  $$TodoCategoriesTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter todoItemsRefs(
      ComposableFilter Function($$TodoItemsTableFilterComposer f) f) {
    final $$TodoItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.todoItems,
        getReferencedColumn: (t) => t.category,
        builder: (joinBuilder, parentComposers) =>
            $$TodoItemsTableFilterComposer(ComposerState(
                $state.db, $state.db.todoItems, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TodoCategoriesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TodoCategoriesTable> {
  $$TodoCategoriesTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TodoItemsTableInsertCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  Value<String?> category,
  Value<DateTime?> createdAt,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<String?> category,
  Value<DateTime?> createdAt,
});

class $$TodoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableProcessedTableManager,
    $$TodoItemsTableInsertCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder> {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TodoItemsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TodoItemsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TodoItemsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String?> category = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TodoItemsCompanion(
            id: id,
            title: title,
            content: content,
            category: category,
            createdAt: createdAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String content,
            Value<String?> category = const Value.absent(),
            Value<DateTime?> createdAt = const Value.absent(),
          }) =>
              TodoItemsCompanion.insert(
            id: id,
            title: title,
            content: content,
            category: category,
            createdAt: createdAt,
          ),
        ));
}

class $$TodoItemsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TodoItemsTable,
    TodoItem,
    $$TodoItemsTableFilterComposer,
    $$TodoItemsTableOrderingComposer,
    $$TodoItemsTableProcessedTableManager,
    $$TodoItemsTableInsertCompanionBuilder,
    $$TodoItemsTableUpdateCompanionBuilder> {
  $$TodoItemsTableProcessedTableManager(super.$state);
}

class $$TodoItemsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$TodoCategoriesTableFilterComposer get category {
    final $$TodoCategoriesTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.category,
        referencedTable: $state.db.todoCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TodoCategoriesTableFilterComposer(ComposerState($state.db,
                $state.db.todoCategories, joinBuilder, parentComposers)));
    return composer;
  }

  ComposableFilter todoItemHashTagRefs(
      ComposableFilter Function($$TodoItemHashTagTableFilterComposer f) f) {
    final $$TodoItemHashTagTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.todoItemHashTag,
            getReferencedColumn: (t) => t.todoItemId,
            builder: (joinBuilder, parentComposers) =>
                $$TodoItemHashTagTableFilterComposer(ComposerState($state.db,
                    $state.db.todoItemHashTag, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$TodoItemsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$TodoCategoriesTableOrderingComposer get category {
    final $$TodoCategoriesTableOrderingComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.category,
            referencedTable: $state.db.todoCategories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$TodoCategoriesTableOrderingComposer(ComposerState($state.db,
                    $state.db.todoCategories, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$HashTagsTableInsertCompanionBuilder = HashTagsCompanion Function({
  Value<String> id,
  required String name,
  Value<int> rowid,
});
typedef $$HashTagsTableUpdateCompanionBuilder = HashTagsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> rowid,
});

class $$HashTagsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HashTagsTable,
    HashTag,
    $$HashTagsTableFilterComposer,
    $$HashTagsTableOrderingComposer,
    $$HashTagsTableProcessedTableManager,
    $$HashTagsTableInsertCompanionBuilder,
    $$HashTagsTableUpdateCompanionBuilder> {
  $$HashTagsTableTableManager(_$AppDatabase db, $HashTagsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HashTagsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HashTagsTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$HashTagsTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HashTagsCompanion(
            id: id,
            name: name,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            Value<String> id = const Value.absent(),
            required String name,
            Value<int> rowid = const Value.absent(),
          }) =>
              HashTagsCompanion.insert(
            id: id,
            name: name,
            rowid: rowid,
          ),
        ));
}

class $$HashTagsTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $HashTagsTable,
    HashTag,
    $$HashTagsTableFilterComposer,
    $$HashTagsTableOrderingComposer,
    $$HashTagsTableProcessedTableManager,
    $$HashTagsTableInsertCompanionBuilder,
    $$HashTagsTableUpdateCompanionBuilder> {
  $$HashTagsTableProcessedTableManager(super.$state);
}

class $$HashTagsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HashTagsTable> {
  $$HashTagsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter todoItemHashTagRefs(
      ComposableFilter Function($$TodoItemHashTagTableFilterComposer f) f) {
    final $$TodoItemHashTagTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.todoItemHashTag,
            getReferencedColumn: (t) => t.hashTagId,
            builder: (joinBuilder, parentComposers) =>
                $$TodoItemHashTagTableFilterComposer(ComposerState($state.db,
                    $state.db.todoItemHashTag, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$HashTagsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HashTagsTable> {
  $$HashTagsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$TodoItemHashTagTableInsertCompanionBuilder = TodoItemHashTagCompanion
    Function({
  required int todoItemId,
  required String hashTagId,
  Value<int> rowid,
});
typedef $$TodoItemHashTagTableUpdateCompanionBuilder = TodoItemHashTagCompanion
    Function({
  Value<int> todoItemId,
  Value<String> hashTagId,
  Value<int> rowid,
});

class $$TodoItemHashTagTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoItemHashTagTable,
    TodoItemHashTagData,
    $$TodoItemHashTagTableFilterComposer,
    $$TodoItemHashTagTableOrderingComposer,
    $$TodoItemHashTagTableProcessedTableManager,
    $$TodoItemHashTagTableInsertCompanionBuilder,
    $$TodoItemHashTagTableUpdateCompanionBuilder> {
  $$TodoItemHashTagTableTableManager(
      _$AppDatabase db, $TodoItemHashTagTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TodoItemHashTagTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TodoItemHashTagTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$TodoItemHashTagTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> todoItemId = const Value.absent(),
            Value<String> hashTagId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoItemHashTagCompanion(
            todoItemId: todoItemId,
            hashTagId: hashTagId,
            rowid: rowid,
          ),
          getInsertCompanionBuilder: ({
            required int todoItemId,
            required String hashTagId,
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoItemHashTagCompanion.insert(
            todoItemId: todoItemId,
            hashTagId: hashTagId,
            rowid: rowid,
          ),
        ));
}

class $$TodoItemHashTagTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $TodoItemHashTagTable,
    TodoItemHashTagData,
    $$TodoItemHashTagTableFilterComposer,
    $$TodoItemHashTagTableOrderingComposer,
    $$TodoItemHashTagTableProcessedTableManager,
    $$TodoItemHashTagTableInsertCompanionBuilder,
    $$TodoItemHashTagTableUpdateCompanionBuilder> {
  $$TodoItemHashTagTableProcessedTableManager(super.$state);
}

class $$TodoItemHashTagTableFilterComposer
    extends FilterComposer<_$AppDatabase, $TodoItemHashTagTable> {
  $$TodoItemHashTagTableFilterComposer(super.$state);
  $$TodoItemsTableFilterComposer get todoItemId {
    final $$TodoItemsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoItemId,
        referencedTable: $state.db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TodoItemsTableFilterComposer(ComposerState(
                $state.db, $state.db.todoItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$HashTagsTableFilterComposer get hashTagId {
    final $$HashTagsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hashTagId,
        referencedTable: $state.db.hashTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$HashTagsTableFilterComposer(ComposerState(
                $state.db, $state.db.hashTags, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$TodoItemHashTagTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $TodoItemHashTagTable> {
  $$TodoItemHashTagTableOrderingComposer(super.$state);
  $$TodoItemsTableOrderingComposer get todoItemId {
    final $$TodoItemsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.todoItemId,
        referencedTable: $state.db.todoItems,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$TodoItemsTableOrderingComposer(ComposerState(
                $state.db, $state.db.todoItems, joinBuilder, parentComposers)));
    return composer;
  }

  $$HashTagsTableOrderingComposer get hashTagId {
    final $$HashTagsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.hashTagId,
        referencedTable: $state.db.hashTags,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$HashTagsTableOrderingComposer(ComposerState(
                $state.db, $state.db.hashTags, joinBuilder, parentComposers)));
    return composer;
  }
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$TodoCategoriesTableTableManager get todoCategories =>
      $$TodoCategoriesTableTableManager(_db, _db.todoCategories);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
  $$HashTagsTableTableManager get hashTags =>
      $$HashTagsTableTableManager(_db, _db.hashTags);
  $$TodoItemHashTagTableTableManager get todoItemHashTag =>
      $$TodoItemHashTagTableTableManager(_db, _db.todoItemHashTag);
}
