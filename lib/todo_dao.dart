import 'package:drift/drift.dart';
import 'package:drift_practice/database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [TodoItems, TodoCategories])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(super.db);

  Future<(TodoCategory, List<TodoItem>)> getCategoriesWithItems({
    required String todoCategoryId,
  }) async {
    // 対象のカテゴリを取得
    final category = await (select(todoCategories)
          ..where((c) => c.id.equals(todoCategoryId)))
        .getSingle();

    // 紐づくTodoItemsを取得
    final relatedTodoItemsQuery = select(todoCategories).join([
      innerJoin(todoItems, todoItems.category.equalsExp(todoCategories.id)),
    ])
      ..where(todoCategories.id.equals(todoCategoryId));
    final result = await relatedTodoItemsQuery.get();
    final todoList = result.map((row) {
      final item = row.readTable(todoItems);
      return item;
    }).toList();

    return (category, todoList);
  }
}
