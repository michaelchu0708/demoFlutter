// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:demoapp/page/counter/counter.dart';
import 'package:demoapp/page/home/home.dart';
import 'package:demoapp/page/todolist/home.dart';
import 'package:demoapp/widget/iconbutton.dart';
import 'notifier/counter.dart';
import 'notifier/todo.dart';

/// Some keys used for testing
final addTodoKey = UniqueKey();
final activeFilterKey = UniqueKey();
final completedFilterKey = UniqueKey();
final allFilterKey = UniqueKey();

/// The different ways to filter the list of todos
enum TodoListFilter {
  all,
  active,
  completed,
}
final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList(const [
    Todo(id: 'todo-0', description: 'hi'),
    Todo(id: 'todo-1', description: 'hello'),
    Todo(id: 'todo-2', description: 'bonjour'),
  ]);
});

final countProvider =
    StateNotifierProvider<CounterRiverpod, int>((ref) => CounterRiverpod());

final todoListFilter = StateProvider((_) => TodoListFilter.all);
final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.completed).length;
});
final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);

  switch (filter) {
    case TodoListFilter.completed:
      return todos.where((todo) => todo.completed).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.completed).toList();
    case TodoListFilter.all:
      return todos;
  }
});
final currentTodo = Provider<Todo>((ref) => throw UnimplementedError());
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(countProvider);
    return const MaterialApp(
      home: MyHomePage(
        title: 'Demo App',
      ),
    );
  }
}
