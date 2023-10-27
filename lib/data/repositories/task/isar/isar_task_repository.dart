import 'package:tdtdd/data/models/task/task_model.dart';
import 'package:tdtdd/data/repositories/task/isar/isar_task_model.dart';
import 'package:tdtdd/data/repositories/task/task_repository.dart';
import 'package:tdtdd/utils/isar/isar_db.dart';

class IsarTaskRepository implements TaskRepository {
  final IsarDb database;
  IsarTaskRepository(this.database);
  @override
  Future<List<TaskModel>> fetchTasks() async {
    final models = await database.getTasks();
    return models
        .map(
          (isarTask) => TaskModel(
              id: isarTask.id,
              description: isarTask.description,
              checked: isarTask.check),
        )
        .toList();
  }

  @override
  Future<List<TaskModel>> updateTasks(List<TaskModel> tasks) async {
    final models = tasks.map(
      (task) {
        final model = IsarTaskModel()
          ..check = task.checked
          ..description = task.description;
        if (task.id != -1) {
          model.id = task.id;
        }
        return model;
      },
    ).toList();
    await database.deleteAllTasks();
    await database.putAllTasks(models: models);
    return tasks;
  }
}
