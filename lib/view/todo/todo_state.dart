import '../../data/models/task/task_model.dart';

sealed class TodoState {}

final class TodoLoadingState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<TaskModel> tasks;

  TodoLoadedState({required this.tasks});
}

final class TodoEmptyState extends TodoLoadedState {
  TodoEmptyState()
      : super(
          tasks: [],
        );
}

final class TodoFailureState extends TodoState {
  final String message;

  TodoFailureState({required this.message});
}
