import 'package:tdtdd/data/models/task/task_model.dart';

abstract interface class TaskRepository {
  Future<List<TaskModel>> fetchTasks();
  Future<List<TaskModel>> updateTasks(List<TaskModel> tasks);
}
