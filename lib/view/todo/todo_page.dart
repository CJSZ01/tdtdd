import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdtdd/data/models/task/task_model.dart';
import 'package:tdtdd/view/todo/todo_cubit.dart';
import 'package:tdtdd/view/todo/todo_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late TodoCubit _cubit;
  @override
  void initState() {
    super.initState();
    _cubit = context.read<TodoCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _cubit.fetchTasks();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TD TDD'),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is TodoLoadedState) {
            final tasks = state.tasks;
            return ListView.builder(
              key: const Key('LoadedState'),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return GestureDetector(
                  onLongPress: () => showTaskDialog(
                    context,
                    task: task,
                  ),
                  child: CheckboxListTile(
                    value: task.checked,
                    title: Text(
                      task.description,
                    ),
                    onChanged: (value) => _cubit.updateTask(
                        task: task.copyWith(checked: !task.checked)),
                  ),
                );
              },
            );
          } else {
            late String message;
            late Key key;
            if (state is TodoLoadingState) {
              message = 'Loading tasks...';
              key = const Key('LoadingState');
            }
            if (state is TodoFailureState) {
              message = 'Failed to load tasks...';
              key = const Key('FailureState');
            }
            if (state is TodoEmptyState) {
              message = 'No tasks found...';
              key = const Key('EmptyState');
            }
            return Center(
              key: key,
              child: Text(message),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          showTaskDialog(context);
        },
      ),
    );
  }

  Future<void> showTaskDialog(BuildContext context, {TaskModel? task}) {
    String description = task?.description ?? '';
    bool editing = task == null;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(
          '${editing ? 'Adding' : 'Editing'} Task ${!editing ? task.id : ''} ',
        ),
        content: TextFormField(
          initialValue: description,
          onChanged: (value) => description = value,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (editing) {
                final newTask = TaskModel(
                  id: -1,
                  description: description,
                  checked: false,
                );
                await _cubit.addTask(task: newTask).whenComplete(
                      () => Navigator.pop(context),
                    );
              } else {
                await _cubit
                    .updateTask(
                      task: task.copyWith(description: description),
                    )
                    .whenComplete(
                      () => Navigator.pop(context),
                    );
              }
            },
            child: const Text('Save'),
          ),
          if (!editing)
            TextButton(
              onPressed: () async {
                await _cubit.deleteTask(task: task).whenComplete(
                      () => Navigator.pop(context),
                    );
              },
              child: const Text('Delete'),
            ),
        ],
      ),
    );
  }
}
