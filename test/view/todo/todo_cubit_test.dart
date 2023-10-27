import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdtdd/data/models/task/task_model.dart';
import 'package:tdtdd/view/todo/todo_cubit.dart';
import 'package:tdtdd/view/todo/todo_state.dart';

import 'todo_mocks.dart';

void main() {
  late TaskRepositoryMock repository;
  late TodoCubit cubit;
  setUp(
    () {
      repository = TaskRepositoryMock();
      cubit = TodoCubit(taskRepository: repository);
    },
  );

  group(
    'fetch Tasks →',
    () {
      test(
        'should fetch all tasks',
        () async {
          when(() => repository.fetchTasks()).thenAnswer(
            (realInvocation) async => [
              const TaskModel(id: 1, description: '', checked: true),
            ],
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoLoadingState>(),
                isA<TodoLoadedState>(),
              ],
            ),
          );
          await cubit.fetchTasks();
        },
      );
      test(
        'should fail to fetch tasks',
        () async {
          when(() => repository.fetchTasks()).thenThrow(
            Exception(
              'Failed to fetch tasks',
            ),
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoLoadingState>(),
                isA<TodoFailureState>(),
              ],
            ),
          );
          await cubit.fetchTasks();
        },
      );
    },
  );
  group(
    'add Tasks →',
    () {
      test(
        'should add one task',
        () async {
          when(
            () => repository.updateTasks(
              any(),
            ),
          ).thenAnswer(
            (realInvocation) async => [
              const TaskModel(
                id: 1,
                description: '',
                checked: true,
              ),
            ],
          );
          when(
            () => repository.fetchTasks(),
          ).thenAnswer(
            (realInvocation) async => [
              const TaskModel(
                id: 2,
                description: '',
                checked: false,
              )
            ],
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoLoadedState>(),
              ],
            ),
          );
          const task = TaskModel(
            id: 2,
            description: '',
            checked: false,
          );
          await cubit.addTask(
            task: task,
          );
          final state = cubit.state as TodoLoadedState;
          expect(
            state.tasks.length,
            1,
          );
          expect(
            state.tasks,
            [task],
          );
        },
      );
      test(
        'should fail to add one task',
        () async {
          when(
            () => repository.updateTasks(
              any(),
            ),
          ).thenThrow(
            Exception(
              'Failed to update task',
            ),
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoFailureState>(),
              ],
            ),
          );
          const task = TaskModel(
            id: 2,
            description: '',
            checked: false,
          );
          await cubit.addTask(
            task: task,
          );
        },
      );
    },
  );
  group(
    'remove Tasks →',
    () {
      test(
        'should remove one task',
        () async {
          when(
            () => repository.updateTasks(
              any(),
            ),
          ).thenAnswer(
            (realInvocation) async => [
              const TaskModel(
                id: 1,
                description: '',
                checked: true,
              ),
            ],
          );
          when(
            () => repository.fetchTasks(),
          ).thenAnswer(
            (realInvocation) async => [],
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoLoadedState>(),
              ],
            ),
          );
          const task = TaskModel(
            id: 2,
            description: '',
            checked: false,
          );
          cubit.addTasks(
            tasks: [task],
          );

          await cubit.deleteTask(
            task: task,
          );
          final state = cubit.state as TodoLoadedState;
          expect(
            state.tasks.length,
            0,
          );
          expect(
            state.tasks,
            [],
          );
        },
      );
      test(
        'should fail to remove one task',
        () async {
          when(
            () => repository.updateTasks(
              any(),
            ),
          ).thenThrow(
            Exception(
              'Failed to remove task',
            ),
          );
          const task = TaskModel(
            id: 2,
            description: '',
            checked: false,
          );
          cubit.addTasks(
            tasks: [task],
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoFailureState>(),
              ],
            ),
          );

          cubit.deleteTask(task: task);
        },
      );
    },
  );
  group(
    'check Task →',
    () {
      test(
        'should check one task',
        () async {
          when(
            () => repository.updateTasks(
              any(),
            ),
          ).thenAnswer(
            (realInvocation) async => [],
          );
          when(
            () => repository.fetchTasks(),
          ).thenAnswer(
            (realInvocation) async => [
              const TaskModel(
                id: 3,
                description: '',
                checked: true,
              ),
            ],
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoLoadedState>(),
              ],
            ),
          );
          const task = TaskModel(
            id: 3,
            description: '',
            checked: false,
          );
          cubit.addTasks(tasks: [task]);
          expect(
            (cubit.state as TodoLoadedState).tasks.length,
            1,
          );
          expect(
            (cubit.state as TodoLoadedState).tasks.first.checked,
            false,
          );
          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoLoadedState>(),
              ],
            ),
          );

          await cubit.updateTask(
            task: task,
          );
          final state = cubit.state as TodoLoadedState;
          expect(
            state.tasks.length,
            1,
          );
          expect(
            state.tasks.first.checked,
            true,
          );
        },
      );
      test(
        'should fail to check one task',
        () async {
          when(
            () => repository.updateTasks(
              any(),
            ),
          ).thenThrow(
            Exception(
              'Failed to check task',
            ),
          );
          const task = TaskModel(
            id: 3,
            description: '',
            checked: false,
          );
          cubit.addTasks(
            tasks: [task],
          );

          expect(
            cubit.stream,
            emitsInOrder(
              [
                isA<TodoFailureState>(),
              ],
            ),
          );
          cubit.updateTask(
            task: task,
          );
        },
      );
    },
  );
}
