import 'package:isar/isar.dart';
part 'isar_task_model.g.dart';

@collection
final class IsarTaskModel {
  Id id = Isar.autoIncrement;
  String description = '';
  bool check = false;
}
