import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdtdd/data/models/task/task_model.dart';
import 'package:tdtdd/data/repositories/task/task_repository.dart';
import 'package:tdtdd/view/todo/todo_state.dart';

final class TodoCubit extends Cubit<TodoState> {
  final TaskRepository _taskRepository;
  TodoCubit({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(
          TodoEmptyState(),
        );

  Future<void> fetchTasks() async {
    emit(
      TodoLoadingState(),
    );
    try {
      final tasks = await _taskRepository.fetchTasks();
      emit(
        TodoLoadedState(tasks: tasks),
      );
    } catch (e) {
      emit(
        TodoFailureState(message: 'Failed to fetch tasks'),
      );
    }
  }

  Future<void> addTask({
    required TaskModel task,
  }) async {
    final tasks = _getTasks();
    if (tasks == null) return;
    tasks.add(task);
    await emitTasks(tasks);
  }

  Future<void> deleteTask({
    required TaskModel task,
  }) async {
    final tasks = _getTasks();
    if (tasks == null) return;
    tasks.remove(task);
    await emitTasks(tasks);
  }

  Future<void> updateTask({
    required TaskModel task,
  }) async {
    final tasks = _getTasks();
    if (tasks == null) return;
    final index = tasks.indexWhere((element) => element.id == task.id);
    tasks[index] = task.copyWith(
      checked: task.checked,
      description: task.description,
    );
    await emitTasks(tasks);
  }

  @visibleForTesting
  void addTasks({required List<TaskModel> tasks}) {
    emit(TodoLoadedState(tasks: tasks));
  }

  List<TaskModel>? _getTasks() {
    final state = this.state;
    if (state is! TodoLoadedState) {
      return null;
    }
    return state.tasks.toList();
  }

  Future<void> emitTasks(List<TaskModel> tasks) async {
    try {
      await _taskRepository.updateTasks(tasks);
      final updatedTasks = await _taskRepository.fetchTasks();
      emit(
        TodoLoadedState(tasks: updatedTasks),
      );
    } catch (e) {
      emit(
        TodoFailureState(
          message: 'Failed to modify tasks',
        ),
      );
    }
  }
}
