// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final int id;
  final String description;
  final bool checked;

  const TaskModel(
      {required this.id, required this.description, required this.checked});

  @override
  List<Object?> get props => [id, description, checked];

  TaskModel copyWith({
    int? id,
    String? description,
    bool? checked,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      checked: checked ?? this.checked,
    );
  }
}
