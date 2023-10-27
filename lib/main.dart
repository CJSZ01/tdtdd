import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdtdd/data/repositories/task/isar/isar_task_repository.dart';
import 'package:tdtdd/data/repositories/task/task_repository.dart';
import 'package:tdtdd/utils/isar/isar_db.dart';
import 'package:tdtdd/view/todo/todo_cubit.dart';
import 'package:tdtdd/view/todo/todo_page.dart';

void main() {
  runApp(const TdTddApp());
}

class TdTddApp extends StatelessWidget {
  const TdTddApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(
          create: (context) => IsarDb(),
        ),
        RepositoryProvider<TaskRepository>(
          create: (context) => IsarTaskRepository(
            context.read<IsarDb>(),
          ),
        ),
        BlocProvider(
          create: (context) => TodoCubit(
            taskRepository: context.read<TaskRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        home: const TodoPage(),
        theme: ThemeData(colorSchemeSeed: Colors.orange,),
      ),
    );
  }
}
