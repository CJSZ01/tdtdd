import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdtdd/view/todo/todo_cubit.dart';
import 'package:tdtdd/view/todo/todo_page.dart';

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
  testWidgets(
    'render todo page',
    (widgetTester) async {
      when(
        () => repository.fetchTasks(),
      ).thenAnswer(
        (invocation) async => [],
      );

      await widgetTester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: const MaterialApp(
            home: TodoPage(),
          ),
        ),
      );
    },
  );
  testWidgets(
    ' todo page with all tasks',
    (widgetTester) async {
      when(
        () => repository.fetchTasks(),
      ).thenAnswer(
        (invocation) async => [],
      );
      await widgetTester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: const MaterialApp(
            home: TodoPage(),
          ),
        ),
      );
      expect(
        find.byKey(
          const Key('EmptyState'),
        ),
        findsOneWidget,
      );
      await widgetTester.pump(
        const Duration(seconds: 2),
      );
      expect(
        find.byKey(
          const Key('LoadedState'),
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    ' todo page with failure',
    (widgetTester) async {
      when(
        () => repository.fetchTasks(),
      ).thenThrow(
        (invocation) async => Exception('Failed'),
      );
      await widgetTester.pumpWidget(
        BlocProvider.value(
          value: cubit,
          child: const MaterialApp(
            home: TodoPage(),
          ),
        ),
      );
      expect(
        find.byKey(
          const Key('EmptyState'),
        ),
        findsOneWidget,
      );
      await widgetTester.pump(
        const Duration(seconds: 2),
      );
      expect(
        find.byKey(
          const Key('FailureState'),
        ),
        findsOneWidget,
      );
    },
  );
}
