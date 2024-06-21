import 'package:drift/drift.dart' hide Column;
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:drift_practice/database.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // db初期化
  final _ = AppDatabase.singleton();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drift Practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _faker = Faker();
  final _executionLogs = <String>[];
  final _driftDb = AppDatabase.singleton();
  final _logScrollController = ScrollController();
  var _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _logScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              icon: const Icon(Icons.expand),
              onPressed: () {
                setState(
                  () {
                    _isExpanded = !_isExpanded;
                  },
                );
              }),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.sizeOf(context).height * (_isExpanded ? 1 : 0.5),
            child: ListView(
              controller: _logScrollController,
              children: [
                if (_executionLogs.isEmpty)
                  const ListTile(
                    title: Text('ここに実行ログが表示されます'),
                  ),
                for (final (index, log) in _executionLogs.indexed)
                  ListTile(
                    title: Text(
                      '[${index.toString().padLeft(2, '0')}] --> $log',
                      style: TextStyle(
                          color:
                              log.contains('成功') ? Colors.green : Colors.red),
                    ),
                  ),
              ],
            ),
          )),
          const SliverToBoxAdapter(child: Divider()),
          if (!_isExpanded)
            SliverFillRemaining(
              child: ListView(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _createRandomTodoItems();
                    },
                    child: const Text('ランダムなTodoItemsを追加'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _createRandomTodoCategory();
                    },
                    child: const Text('ランダムなTodoCategoryを追加'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _createTodoItemsRelatedTodoCategory();
                    },
                    child: const Text('特定のTodoCategoryに紐づくTodoItemsを追加'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _createHashTags();
                    },
                    child: const Text('ランダムなHashTagsを追加'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _createTodoItemHashTag();
                    },
                    child: const Text('特定のTodoItemとHashTagを紐づける'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _getTodoItemsByTodoCategoryId();
                    },
                    child: const Text('特定のTodoCategoryに紐づくTodoItemsを取得'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _deleteAllRecords();
                    },
                    child: const Text('全テーブルのレコードを削除'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      _removeLogs();
                    },
                    child: const Text('ログをクリア'),
                  ),
                ],
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleOnPressedFAB,
        tooltip: 'drift_db_viewerを表示',
        child: const Icon(Icons.search),
      ),
    );
  }

  /// 全テーブルのレコードを削除
  Future<void> _deleteAllRecords() async {
    await _tryFunc(
      actionName: '全テーブルのレコードを削除',
      func: () async {
        return await Future.wait(
          [
            _driftDb.managers.todoItems.delete(),
            _driftDb.managers.todoCategories.delete(),
            _driftDb.managers.hashTags.delete(),
            _driftDb.managers.todoItemHashTag.delete(),
          ],
        );
      },
    );
  }

  /// ランダムなTodoCategoryを追加
  Future<void> _createRandomTodoCategory() async {
    await _tryFunc(
      actionName: 'ランダムなTodoCategoryを追加',
      func: () async {
        final TodoCategory record =
            await _driftDb.managers.todoCategories.createReturning(
          (e) => e(description: _faker.lorem.word()),
          mode: InsertMode.insertOrReplace,
        );
        return record.toJsonString();
      },
    );
  }

  void _addExecutionLog(String log) async {
    setState(() {
      _executionLogs.add(log);
    });
    if (!_logScrollController.hasClients) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _logScrollController.animateTo(
        _logScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<void> _tryFunc(
      {required String actionName, required dynamic Function() func}) async {
    try {
      final ret = await func();
      _addExecutionLog('$actionName: 成功: $ret');
    } catch (e) {
      _addExecutionLog('$actionName: 失敗: $e');
    }
  }

  void _handleOnPressedFAB() {
    final db = AppDatabase.singleton();
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (context) {
          return DriftDbViewer(db);
        },
      ),
    );
  }

  Future<void> _createTodoItemsRelatedTodoCategory() async {
    await _tryFunc(
      actionName: '特定のTodoCategoryに紐づくTodoItemsを追加',
      func: () async {
        final randomCategory = await _driftDb.managers.todoCategories.get();
        if (randomCategory.isEmpty) {
          throw Exception('TodoCategoryが存在しません');
        }
        randomCategory.shuffle();
        final selectedCategory = randomCategory.first;

        final todoItems = await _driftDb.managers.todoItems.createReturning(
          (e) => e(
            title: _faker.lorem.word(),
            content: _faker.lorem.sentence(),
            category: Value(selectedCategory.id),
          ),
          mode: InsertMode.insertOrReplace,
        );

        return {
          'category': selectedCategory.toJsonString(),
          'todoItems': todoItems.toJsonString(),
        };
      },
    );
  }

  Future<void> _createRandomTodoItems() async {
    await _tryFunc(
      actionName: 'ランダムなTodoItemsを追加',
      func: () async {
        return await _driftDb.managers.todoItems.createReturning(
          (e) => e(
            title: _faker.lorem.word(),
            content: _faker.lorem.sentence(),
          ),
          mode: InsertMode.insertOrReplace,
        );
      },
    );
  }

  void _removeLogs() {
    setState(() {
      _executionLogs.clear();
    });
  }

  Future<void> _getTodoItemsByTodoCategoryId() async {
    await _tryFunc(
      actionName: '特定のTodoCategoryに紐づくTodoItemsを取得',
      func: () async {
        final randomCategory = await _driftDb.managers.todoCategories.get();
        if (randomCategory.isEmpty) {
          throw Exception('TodoCategoryが存在しません');
        }

        final selectedCategory = randomCategory.first;
        final categoryWithTodoItems = await _driftDb.todoDao
            .getCategoriesWithItems(todoCategoryId: selectedCategory.id);
        return categoryWithTodoItems;
      },
    );
  }

  Future<void> _createHashTags() async {
    await _tryFunc(
      actionName: 'ランダムなHashTagsを追加',
      func: () async {
        return await _driftDb.managers.hashTags.createReturning(
          (e) => e(name: _faker.lorem.word()),
          mode: InsertMode.insertOrReplace,
        );
      },
    );
  }

  Future<void> _createTodoItemHashTag() async {
    await _tryFunc(
      actionName: '特定のTodoItemとHashTagを紐づける',
      func: () async {
        // todoItemとhashTagを取得する
        final todoItems = await _driftDb.managers.todoItems.get();
        final hashTags = await _driftDb.managers.hashTags.get();
        if (todoItems.isEmpty || hashTags.isEmpty) {
          throw Exception('TodoItemまたはHashTagが存在しません');
        }
        
        // シャッフル
        todoItems.shuffle();
        hashTags.shuffle();

        //TodoItemHashTagを作成する
        final todoItem = todoItems.first;
        final hashTag = hashTags.first;
        return await _driftDb.managers.todoItemHashTag.create(
          (e) => e(
            todoItemId: todoItem.id,
            hashTagId: hashTag.id,
          ),
          mode: InsertMode.insertOrReplace,
        );
      },
    );
  }
}
