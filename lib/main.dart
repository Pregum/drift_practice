import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:drift_practice/database.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
  final executionLogs = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                child: ListView(
                  children: [
                    if (executionLogs.isEmpty)
                      const Text('ここに操作ログが表示されます')
                    else
                      for (final log in executionLogs) Text(log),
                  ],
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: () {
                  final db = AppDatabase.singleton();
                  // db.managers.todoCategory
                  //     .create((e) => e(description: '', id: '1'));
                },
                child: const Text('全データ消去'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleOnPressedFAB,
        tooltip: 'drift_db_viewerを表示',
        child: const Icon(Icons.search),
      ),
    );
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
}
