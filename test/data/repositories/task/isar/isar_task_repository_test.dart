import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdtdd/data/models/task/task_model.dart';
import 'package:tdtdd/data/repositories/task/isar/isar_task_model.dart';
import 'package:tdtdd/data/repositories/task/isar/isar_task_repository.dart';
import 'package:tdtdd/data/repositories/task/task_repository.dart';
import 'package:tdtdd/utils/isar/isar_db.dart';

import 'isar_task_repository_mocks.dart';

void main() {
  late IsarDb database;
  late TaskRepository repository;

  setUp(() {
    database = IsarDbMock();
    repository = IsarTaskRepository(database);
  });

  test(
    'fetch tasks',
    () async {
      when(
        () => database.getTasks(),
      ).thenAnswer(
        (_) async => [
          IsarTaskModel()..id = 1,
        ],
      );
      final tasks = await repository.fetchTasks();
      expect(
        tasks.length,
        1,
      );
    },
  );
  test(
    'update tasks',
    () async {
      when(
        () => database.deleteAllTasks(),
      ).thenAnswer(
        (_) async => [],
      );
      when(
        () => database.putAllTasks(
          models: any(named: 'models'),
        ),
      ).thenAnswer(
        (_) async => [],
      );
      final tasks = await repository.updateTasks(
        [
          const TaskModel(
            id: -1,
            description: '',
            checked: false,
          ),
          const TaskModel(
            id: 0,
            description: '',
            checked: false,
          ),
        ],
      );
      expect(
        tasks.length,
        2,
      );
    },
  );
}
